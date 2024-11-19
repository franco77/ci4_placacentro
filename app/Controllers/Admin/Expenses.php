<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Expenses_model;
use App\Models\CatExIn_model;

class Expenses extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Expenses_model = new Expenses_model;
      $this->CatExIn_model = new CatExIn_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Expenses',
         'host' => site_url('admin/expenses/')
      ];
      echo view('admin/expenses/list', $data);
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

         $recordsTotal = $this->Expenses_model->countTotal();
         $data = $this->Expenses_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Expenses_model->countFilter($search);

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
         'data_cat_ex_in' => $this->CatExIn_model->where('type', 'Gastos')->findAll(),
      ];

      echo view('admin/expenses/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id']            = $this->request->getPost('id');
      $request['ex_in_cat_id']  = $this->request->getPost('ex_in_cat_id');
      $request['title']         = $this->request->getPost('title');
      $request['amount']        = $this->request->getPost('amount');
      $request['description']   = $this->request->getPost('description');
      $request['created_by']    = $this->currentUser->id;
      $request['created_at']    = date("Y-m-d h:i:s");

      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Expenses_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Expenses_model->errors());
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
         $data = $this->Expenses_model->showExpenses($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<b>Categoria</b>', $data['CAT_title']]);
            $this->table->addRow(['<b>Titulo</b>', $data['title']]);
            $this->table->addRow(['<b>Monto</b>', monies_format($data['amount'])]);
            $this->table->addRow(['<b>Descripcion</b>', $data['description']]);
            $this->table->addRow(['<b>Registrado por</b>', $data['first_name'] . ' ' . $data['last_name']]);
            $this->table->addRow(['<b>Creado el</b>', $data['created_at']]);
            $this->table->addRow(['<b>Actualizado el</b>', $data['updated_at']]);
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
         $data = $this->Expenses_model->find($id);

         if ($data) {
            $data = [
               'data_cat_ex_in' => $this->CatExIn_model->findAll(),
               'data_expenses' => $data
            ];

            echo view('admin/expenses/form', $data);
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
      $request['id']            = $this->request->getPost('id');
      $request['ex_in_cat_id']  = $this->request->getPost('ex_in_cat_id');
      $request['title']         = $this->request->getPost('title');
      $request['amount']        = $this->request->getPost('amount');
      $request['description']   = $this->request->getPost('description');
      $request['updated_at']    = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Expenses_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Expenses_model->errors());
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
         $data = $this->Expenses_model->find($id);
         if ($data) {
            $this->Expenses_model->delete($id);
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
         'ex_in_cat_id' => [
            'label' => 'Ex In Cat Id',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'title' => [
            'label' => 'Title',
            'rules' => 'required|string|max_length[50]'
         ],
         'amount' => [
            'label' => 'Amount',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'description' => [
            'label' => 'Description',
            'rules' => 'required|string'
         ],
         'created_by' => [
            'label' => 'Created By',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'created_at' => [
            'label' => 'Created At',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
         'updated_at' => [
            'label' => 'Updated At',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
      ]);
   }
}