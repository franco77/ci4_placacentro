<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Tickets_model;
use App\Models\Category_model;
use App\Models\Users_model;

class Tickets extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Tickets_model = new Tickets_model;
      $this->Category_model = new Category_model;
      $this->Users_model = new Users_model();
   }

   function index()
   {
      $data = [
         'title' => 'Tickets',
         'host' => site_url('admin/tickets/')
      ];
      echo view('admin/tickets/list', $data);
   }



   function List()
   {
      $data = [
         'title' => 'Tickets',
         'host' => site_url('admin/tickets/')
      ];
      echo view('admin/tickets/mylist', $data);
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

         $recordsTotal = $this->Tickets_model->countTotal();
         $data = $this->Tickets_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Tickets_model->countFilter($search);

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



   public function mydata()
   {
      try {
         $request = esc($this->request->getPost());
         $search = $request['search']['value'];
         $limit = $request['length'];
         $start = $request['start'];
         $user_id = $this->currentUser->id;

         $orderIndex = $request['order'][0]['column'];
         $orderFields = $request['columns'][$orderIndex]['data'];
         $orderDir = $request['order'][0]['dir'];

         $recordsTotal = $this->Tickets_model->countTotal();
         $data = $this->Tickets_model->myfilter($search, $limit, $start, $orderFields, $orderDir, $user_id);
         $recordsFiltered = $this->Tickets_model->countFilter($search);

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
         'data_category' => $this->Category_model->findAll(),
         'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
         'action' => 'new'
      ];

      echo view('admin/tickets/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id'] = $this->request->getPost('id');
      $request['id_user'] = $this->request->getPost('id_user');
      $request['id_category'] = $this->request->getPost('id_category');
      $request['ticket_title'] = $this->request->getPost('ticket_title');
      $request['ticket_description'] = $this->request->getPost('ticket_description');
      $request['priority'] = $this->request->getPost('priority');
      $request['status'] = 'activo';
      $request['created_on'] = date("Y-m-d h:i:s");
      $request['created_by'] = $this->currentUser->id;
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Tickets_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Tickets_model->errors());
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
         $data = $this->Tickets_model->showTickets($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<strong>Para</strong>', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['<strong>Categoria</strong>', $data['title']]);
            $this->table->addRow(['<strong>Titulo</strong>', $data['ticket_title']]);
            $this->table->addRow(['<strong>Mensaje</strong>', $data['ticket_description']]);
            $this->table->addRow(['<strong>Prioridad</strong>', $data['priority']]);
            $this->table->addRow(['<strong>Estatus</strong>', $data['status']]);
            $this->table->addRow(['<strong>Creado El</strong>', $data['created_on']]);
            $this->table->addRow(['<strong>Creado Por</strong>', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['<strong>Actualizado El</strong>', $data['updated_on']]);
            $this->table->addRow(['<strong>Actualizado Por</strong>', $data['updated_by']]);
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
         $data = $this->Tickets_model->find($id);

         if ($data) {
            $data = [
               'data_category' => $this->Category_model->findAll(),
               'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
               'data_tickets' => $data,
               'action' => 'edit'
            ];

            echo view('admin/tickets/form', $data);
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
      $request['id_category'] = $this->request->getPost('id_category');
      $request['ticket_title'] = $this->request->getPost('ticket_title');
      $request['ticket_description'] = $this->request->getPost('ticket_description');
      $request['priority'] = $this->request->getPost('priority');
      $request['status'] = 'Activo';
      $request['updated_on'] = date("Y-m-d h:i:s");
      $request['updated_by'] = $this->currentUser->id;
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Tickets_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Tickets_model->errors());
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
         $data = $this->Tickets_model->find($id);
         if ($data) {
            $this->Tickets_model->delete($id);
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
         'id_category' => [
            'label' => 'Id Category',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'ticket_title' => [
            'label' => 'Ticket Title',
            'rules' => 'required|string|max_length[500]'
         ],
         'ticket_description' => [
            'label' => 'Ticket Description',
            'rules' => 'required|string'
         ],
         'priority' => [
            'label' => 'Priority',
            'rules' => 'required'
         ]
      ]);
   }
}
