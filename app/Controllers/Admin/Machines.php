<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Machines_model;
use App\Models\Users_model;

class Machines extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Machines_model = new Machines_model;
      $this->Users_model = new Users_model();
   }

   function index()
   {
      $data = [
         'title' => 'Maquinas',
         'controller' => 'Machine',
         'host' => site_url('admin/machines/')
      ];
      echo view('admin/machines/list', $data);
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

         $recordsTotal = $this->Machines_model->countTotal();
         $data = $this->Machines_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Machines_model->countFilter($search);

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
         'operators' => $this->Users_model->where('active', 1)->findAll(),
         'action' => 'new',
      ];

      echo view('admin/machines/form', $data);
   }

   public function create()
   {
      $response = array();

      $fields['id'] = $this->request->getPost('id');
      $fields['id_user'] = $this->request->getPost('id_user');
      $fields['name_machine'] = $this->request->getPost('name_machine');
      $fields['cod'] = $this->request->getPost('cod');
      $fields['status'] = $this->request->getPost('status');
      $this->rules();

      if ($this->validation->run($fields) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Machines_model->insert($fields);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Machines_model->errors());
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
         $data = $this->Machines_model->showMachines($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Operador', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['Nombre Maquina', $data['name_machine']]);
            $this->table->addRow(['Codigo', $data['cod']]);
            if ($data['status'] == 1) :
               $this->table->addRow(['Estatus', '<span class="badge text-bg-success">Activo</span>']);
            else :
               $this->table->addRow(['Estatus', '<span class="badge text-bg-danger">Inactivo</span>']);
            endif;
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
         $data = $this->Machines_model->find($id);

         if ($data) {
            $data = [
               'data_machines' => $data,
               'operators' => $this->Users_model->where('active', 1)->findAll(),
               'action' => 'edit',
            ];

            echo view('admin/machines/form', $data);
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
      $request['id_user'] = $this->request->getPost('id_user');
      $request['name_machine'] = $this->request->getPost('name_machine');
      $request['cod'] = $this->request->getPost('cod');
      $request['status'] = $this->request->getPost('status');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Machines_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Machines_model->errors());
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
         $data = $this->Machines_model->find($id);
         if ($data) {
            $this->Machines_model->delete($id);
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
         'id_user' => [
            'label' => 'Id User',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'name_machine' => [
            'label' => 'Name Machine',
            'rules' => 'required|string|max_length[50]'
         ],
         'cod' => [
            'label' => 'Cod',
            'rules' => 'required|string|max_length[50]'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required|max_length[11]'
         ],
      ]);
   }
}