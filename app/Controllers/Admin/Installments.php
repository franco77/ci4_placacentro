<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Installments_model;

class Installments extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Installments_model = new Installments_model;
   }

   function index()
   {
      $data = [
         'title' => 'Recibos',
         'controller' => 'Customers',
         'host' => site_url('admin/installments/')
      ];
      echo view('admin/installments/list', $data);
   }

   public function data()
   {
      try {
         $request = esc($this->request->getPost());
         $search = $request['search']['value'];
         $limit = $request['length'];
         $start = $request['start'];

         $orderIndex = $request['order'][0]['column'];
         $orderFields = $request['columns'][$orderIndex]['data'];
         $orderDir = $request['order'][0]['dir'];

         $recordsTotal = $this->Installments_model->countTotal();
         $data = $this->Installments_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Installments_model->countFilter($search);

         $callback = [
            'draw' => $request['draw'],
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data
         ];

         return $this->respond($callback);
      } catch (\Exception $e) {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   public function new()
   {
      $data = ['action' => 'new'];

      echo view('admin/installments/form', $data);
   }

   public function create()
   {
      $request = esc($this->request->getPost());
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Installments_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Installments_model->errors());
            }
         } catch (\Exception $e) {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }

   public function show($id = null)
   {
      try {
         $data = $this->Installments_model->showInstallments($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<strong>Codigo cortes</strong>', $data['cod_cut']]);
            $this->table->addRow(['<strong>Titulo</strong>', $data['title']]);
            $this->table->addRow(['<strong>Tipo</strong>', $data['type']]);
            $this->table->addRow(['<strong>Descripccion</strong>', $data['description']]);
            $this->table->addRow(['<strong>Monto</strong>', $data['amount']]);
            $this->table->addRow(['<strong>Estatus</strong>', $data['status']]);
            $this->table->addRow(['<strong>Direccion IP</strong>', $data['ip_address']]);
            $this->table->addRow(['<strong>Creado por</strong>', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['<strong>Creado el</strong>', $data['created_at']]);
            $this->table->addRow(['<strong>Hora</strong>', $data['time']]);
            $this->table->addRow(['<strong>Actualizado el</strong>', $data['updated_at']]);
            return $this->respond($this->table->generate());
         } else {
            return $this->failNotFound();
         }
      } catch (\Exception $e) {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   public function edit($id = null)
   {
      try {
         $data = $this->Installments_model->find($id);

         if ($data) {
            $data = [
               'data_installments' => $data,
               'action' => 'edit'
            ];

            echo view('admin/installments/form', $data);
         } else {
            return $this->failNotFound();
         }
      } catch (\Exception $e) {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   public function update($id = null)
   {
      $request = esc($this->request->getPost());
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Installments_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Installments_model->errors());
            }
         } catch (\Exception $e) {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }



   public function changeStatus()
   {
      $id = $this->request->getPost('id');
      $status = $this->request->getPost('status');

      if ($id !== null && $status !== null) {
         $data = [
            'status' => $status,
         ];
         $this->Installments_model->update($id, $data);
         $response = [
            'success' => true
         ];
      } else {
         $response = [
            'success' => false
         ];
      }
      return $this->response->setJSON($response);
   }



   function pdf($id = '')
   {
      $dompdf = new \Dompdf\Dompdf();
      $data['installments'] = $this->Installments_model->pdf($id);
      $dompdf->loadHtml(view('admin/installments/pdf', $data));
      $dompdf->setPaper('letter', 'portrait');
      $options = $dompdf->getOptions();
      $options->set(array('isRemoteEnabled' => true));
      $dompdf->setOptions($options);
      $dompdf->render();
      $time = time();
      $dompdf->stream("report_" . $time . ".pdf", array(
         'Attachment' => 0,
      ));
      exit();
   }


   public function delete($id = null)
   {
      try {
         $data = $this->Installments_model->find($id);
         if ($data) {
            $this->Installments_model->delete($id);
            return $this->respondDeleted([
               'status' => 200,
               'message' => 'Data deleted.'
            ]);
         } else {
            return $this->failNotFound();
         }
      } catch (\Exception $e) {
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   private function rules()
   {
      $this->validation->setRules([
         'cod_cut' => [
            'label' => 'Cod Cut',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'title' => [
            'label' => 'Title',
            'rules' => 'required|string|max_length[50]'
         ],
         'type' => [
            'label' => 'Type',
            'rules' => 'required|string|max_length[250]'
         ],
         'description' => [
            'label' => 'Description',
            'rules' => 'required|string'
         ],
         'amount' => [
            'label' => 'Amount',
            'rules' => 'required|numeric|max_length[20]'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required|string|max_length[250]'
         ],
         'ip_address' => [
            'label' => 'Ip Address',
            'rules' => 'required|string|max_length[20]'
         ]
      ]);
   }
}