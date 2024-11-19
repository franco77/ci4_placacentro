<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Mop_model;

class Mop extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Mop_model = new Mop_model;
   }

   function index()
   {
      $data = [
         'title' => 'Movimientos de productos',
         'host' => site_url('admin/mop/')
      ];
      echo view('admin/mop/list', $data);
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

         $recordsTotal = $this->Mop_model->countTotal();
         $data = $this->Mop_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Mop_model->countFilter($search);

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
      $data = [];

      echo view('admin/mop/form', $data);
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
            $insert = $this->Mop_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Mop_model->errors());
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
         $data = $this->Mop_model->find($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Codigo', $data['item_code']]);
            $this->table->addRow(['Producto', $data['item_name']]);
            $this->table->addRow(['Cantidad', $data['quantity']]);
            $this->table->addRow(['Precio', $data['price']]);
            $this->table->addRow(['Categoria', $data['category']]);
            $this->table->addRow(['Tipo', $data['type']]);
            $this->table->addRow(['Creado el', $data['created_at']]);
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
         $data = $this->Mop_model->find($id);

         if ($data) {
            $data = [
               'data_mop' => $data
            ];

            echo view('admin/mop/form', $data);
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
            $update = $this->Mop_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Mop_model->errors());
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
         $data = $this->Mop_model->find($id);
         if ($data) {
            $this->Mop_model->delete($id);
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
         'item_code' => [
            'label' => 'Item Code',
            'rules' => 'required|string'
         ],
         'item_name' => [
            'label' => 'Item Name',
            'rules' => 'required|string'
         ],
         'quantity' => [
            'label' => 'Quantity',
            'rules' => 'required|string'
         ],
         'category' => [
            'label' => 'Category',
            'rules' => 'required|string|max_length[250]'
         ],
         'type' => [
            'label' => 'Type',
            'rules' => 'required|string|max_length[250]'
         ],
         'created_by' => [
            'label' => 'Created By',
            'rules' => 'required|numeric|max_length[10]'
         ],
         'created_at' => [
            'label' => 'Created At',
            'rules' => 'required|string'
         ],
      ]);
   }
}