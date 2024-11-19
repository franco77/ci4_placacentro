<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Holidays_model;

class Holidays extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Holidays_model = new Holidays_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Holidays',
         'host' => site_url('admin/holidays/')
      ];
      echo view('admin/holidays/list', $data);
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

         $recordsTotal = $this->Holidays_model->countTotal();
         $data = $this->Holidays_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Holidays_model->countFilter($search);

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
      $data = [
         'action' => 'new',
         'holy' => $this->Holidays_model->findAll(),
      ];

      echo view('admin/holidays/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id'] = $this->request->getPost('id');
      $request['title'] = $this->request->getPost('title');
      $request['date'] = $this->request->getPost('date');
      $request['month'] = $this->request->getPost('date');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Holidays_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Holidays_model->errors());
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
         $data = $this->Holidays_model->find($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Titulo', ':', $data['title']]);
            $this->table->addRow(['Fecha', ':', $data['date']]);
            $this->table->addRow(['Mes', ':', get_month($data['month'])]);
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
         $data = $this->Holidays_model->find($id);

         if ($data) {
            $data = [
               'data_holidays' => $data,
               'action' => 'edit',
            ];

            echo view('admin/holidays/form', $data);
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
      $response = array();
      $request['id'] = $this->request->getPost('id');
      $request['title'] = $this->request->getPost('title');
      $request['date'] = $this->request->getPost('date');
      $request['month'] = $this->request->getPost('date');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Holidays_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Holidays_model->errors());
            }
         } catch (\Exception $e) {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }

   public function delete($id = null)
   {
      try {
         $data = $this->Holidays_model->find($id);
         if ($data) {
            $this->Holidays_model->delete($id);
            return $this->respondDeleted([
               'status' => 200,
               'message' => 'Data deleted.'
            ]);
         } else {
            return $this->failNotFound();
         }
      } catch (\Exception $e) {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   private function rules()
   {
      $this->validation->setRules([
         'title' => [
            'label' => 'Title',
            'rules' => 'required|string|max_length[250]'
         ],
         'date' => [
            'label' => 'Date',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
      ]);
   }
}