<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Supplies_model;
use App\Models\Users_model;

class Supplies extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Supplies_model = new Supplies_model;
      $this->Users_model = new Users_model();
   }

   function index()
   {
      $data = [
         'title' => 'Insumos',
         'host' => site_url('admin/supplies/')
      ];
      echo view('admin/supplies/list', $data);
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

         $recordsTotal = $this->Supplies_model->countTotal();
         $data = $this->Supplies_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Supplies_model->countFilter($search);

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
         'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
         'action' => 'new'
      ];

      echo view('admin/supplies/form', $data);
   }

   public function create()
   {
      $response = array();

      $request['id'] = $this->request->getPost('id');
      $request['id_user'] = $this->request->getPost('id_user');
      $request['subject'] = $this->request->getPost('subject');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']  = json_encode($this->request->getPost('items[]'));
      $request['qty']   = json_encode($this->request->getPost('qty[]'));
      $request['price']   = json_encode($this->request->getPost('price[]'));
      $request['total']   = json_encode($this->request->getPost('total[]'));
      $request['category']   = json_encode($this->request->getPost('category[]'));
      $request['notes'] = $this->request->getPost('notes');
      $request['deliver_date'] = $this->request->getPost('deliver_date');
      $request['created_by'] = $this->currentUser->id;
      $request['created_at'] = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Supplies_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Supplies_model->errors());
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
         $data = $this->Supplies_model->showSupplies($id);
         if ($data) {
            $items = json_decode($data['items']);
            $qty = json_decode($data['qty']);
            $this->table->addRow(['Id User', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['Subject', $data['subject']]);
            $this->table->addRow(['Notes', $data['notes']]);
            $this->table->addRow(['Deliver Date', $data['deliver_date']]);
            $this->table->addRow(['Created By', $data['created_by']]);
            $this->table->addRow(['Created At', $data['created_at']]);
            $this->table->addRow(['Updated At', $data['updated_at']]);
            $cell = ['style' => 'padding: 7px;text-align: center', 'colspan' => 3, 'data' => '<strong>Lista De Productos</strong>',];
            $this->table->addRow([$cell]);
            $cell2 = ['style' => 'width: 50%', 'data' => '<strong>Productos</strong>'];
            $this->table->addRow([$cell2, '<strong>Cantidad</strong>']);
            for ($i = 0; $i < count($items); $i++) :
               $this->table->addRow([$items[$i], $qty[$i]]);
            endfor;
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
         $data = $this->Supplies_model->find($id);

         if ($data) {
            $data = [
               'data_supplies' => $data,
               'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
               'action' => 'edit'
            ];

            echo view('admin/supplies/form', $data);
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
      $request['subject'] = $this->request->getPost('subject');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']  = json_encode($this->request->getPost('items[]'));
      $request['qty']   = json_encode($this->request->getPost('qty[]'));
      $request['price']   = json_encode($this->request->getPost('price[]'));
      $request['total']   = json_encode($this->request->getPost('total[]'));
      $request['category']   = json_encode($this->request->getPost('category[]'));
      $request['notes'] = $this->request->getPost('notes');
      $request['deliver_date'] = $this->request->getPost('deliver_date');
      $request['created_by'] = $this->currentUser->id;
      $request['updated_at'] = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Supplies_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Supplies_model->errors());
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
         $data = $this->Supplies_model->find($id);
         if ($data) {
            $this->Supplies_model->delete($id);
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
            'rules' => 'required'
         ],
         'subject' => [
            'label' => 'Subject',
            'rules' => 'required'
         ],
         'notes' => [
            'label' => 'Notes',
            'rules' => 'required|string'
         ]
      ]);
   }
}
