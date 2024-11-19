<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Items_model;
use App\Models\Brands_model;
use App\Models\Products_model;

class Items extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Items_model = new Items_model;
      $this->Brands_model = new Brands_model;
      $this->Products_model = new Products_model;
   }

   function index()
   {
      $data = [
         'title' => 'Productos',
         'controller' => 'Productos',
         'host' => site_url('admin/items/')
      ];
      echo view('admin/items/list', $data);
   }

   public function productListAjax()
   {

      if ($this->request->getPost('type')) {
         $type = $this->request->getPost('type');
         $name = $this->request->getPost('name_startsWith');

         $db = \Config\Database::connect(); // Establish database connection
         $query = "SELECT item_code, item_name, buy_price, category FROM items WHERE  UPPER($type) LIKE '%" . strtoupper($name) . "%'";
         $result = $db->query($query)->getResultArray();

         $data = [];
         foreach ($result as $row) {
            $name = $row['item_code'] . '|' . $row['item_name'] . '|' . $row['buy_price'] . '|' . $row['category'];
            $data[] = $name;
         }

         return $this->response->setJSON($data);
      }
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

         $recordsTotal = $this->Items_model->countTotal();
         $data = $this->Items_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Items_model->countFilter($search);

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
         'brand' => $this->Brands_model->findAll(),
         'action' => 'new'
      ];

      echo view('admin/items/form', $data);
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
            $insert = $this->Items_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Items_model->errors());
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
         $data = $this->Items_model->showItems($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<strong>Codigo</strong>', $data['item_code']]);
            $this->table->addRow(['<strong>Nombre</strong>', $data['item_name']]);
            $this->table->addRow(['<strong>Cantidad</strong>', $data['quantity']]);
            $this->table->addRow(['<strong>Precio De Venta</strong>', $data['buy_price']]);
            $this->table->addRow(['<strong>Estatus</strong>', $data['status']]);
            $this->table->addRow(['<strong>Categoria</strong>', $data['category']]);
            $this->table->addRow(['<strong>Marca</strong>', $data['brand']]);
            $this->table->addRow(['<strong>Creado el</strong>', $data['created_at']]);
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
         $data = $this->Items_model->find($id);

         if ($data) {
            $data = [
               'brand' => $this->Brands_model->findAll(),
               'data_items' => $data,
               'action' => 'edit',
            ];

            echo view('admin/items/form', $data);
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
            $update = $this->Items_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Items_model->errors());
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
         $data = $this->Items_model->find($id);
         if ($data) {
            $this->Items_model->delete($id);
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
            'rules' => 'required|string|max_length[512]'
         ],
         'item_name' => [
            'label' => 'Item Name',
            'rules' => 'required|string|max_length[512]'
         ],
         'quantity' => [
            'label' => 'Quantity',
            'rules' => 'required|decimal|max_length[7]'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required|string|max_length[512]'
         ],
         'category' => [
            'label' => 'Category',
            'rules' => 'required|string|max_length[512]'
         ],
      ]);
   }
}