<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\CatExIn_model;

class CatExIn extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->CatExIn_model = new CatExIn_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Cat Ex In',
         'host' => site_url('admin/catexin/')
      ];
      echo view('admin/cat_ex_in/list', $data);
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

         $recordsTotal = $this->CatExIn_model->countTotal();
         $data = $this->CatExIn_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->CatExIn_model->countFilter($search);

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

      echo view('admin/cat_ex_in/form', $data);
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
            $insert = $this->CatExIn_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->CatExIn_model->errors());
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
         $data = $this->CatExIn_model->find($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Title', ':', $data['title']]);
            $this->table->addRow(['Description', ':', $data['description']]);
            $this->table->addRow(['Type', ':', $data['type']]);
            $this->table->addRow(['Created At', ':', $data['created_at']]);
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
         $data = $this->CatExIn_model->find($id);

         if ($data) {
            $data = [
               'data_cat_ex_in' => $data
            ];

            echo view('admin/cat_ex_in/form', $data);
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
            $update = $this->CatExIn_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->CatExIn_model->errors());
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
         $data = $this->CatExIn_model->find($id);
         if ($data) {
            $this->CatExIn_model->delete($id);
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
            'rules' => 'required|string|max_length[50]'
         ],
         'description' => [
            'label' => 'Description',
            'rules' => 'required|string'
         ],
         'type' => [
            'label' => 'Type',
            'rules' => 'required|string|max_length[50]'
         ],
         'created_at' => [
            'label' => 'Created At',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
      ]);
   }
}