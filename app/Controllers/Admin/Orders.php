<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Orders_model;
use App\Models\Customers_model;
use App\Models\Mop_model;

$this->ionAuth = new \IonAuth\Libraries\IonAuth();

class Orders extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Orders_model = new Orders_model;
      $this->Customers_model = new Customers_model();
      $this->Mop_model = new Mop_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Orders',
         'host' => site_url('admin/orders/')
      ];
      echo view('admin/orders/list', $data);
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

         $recordsTotal = $this->Orders_model->countTotal();
         $data = $this->Orders_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Orders_model->countFilter($search);

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
         'all_customers' => $this->Customers_model->findAll(),
         'action' => 'new',
      ];

      echo view('admin/orders/form', $data);
   }

   public function create()
   {
      $response = array();

      $request['id'] = $this->request->getPost('id');
      $request['customer_id'] = $this->request->getPost('customer_id');
      $request['delivery'] = $this->request->getPost('delivery');
      $request['status'] = $this->request->getPost('status');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']  = json_encode($this->request->getPost('items[]'));
      $request['qty']   = json_encode($this->request->getPost('qty[]'));
      $request['price']   = json_encode($this->request->getPost('price[]'));
      $request['total']   = json_encode($this->request->getPost('total[]'));
      $request['category']    = json_encode($this->request->getPost('category[]'));
      $request['notes'] = $this->request->getPost('notes');
      $request['created_by'] = $this->currentUser->id;
      $request['registered_on'] = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Orders_model->insert($request);


            /* Insertamos registros en la tabala mop que es la tabla donde se guardan los movimientos de los productos: */
            /* Forma 1 Insercion */
            // $dataMop = [
            //    'id'          => $this->request->getPost('id'),
            //    'item_code'   => json_encode($this->request->getPost('productcode[]')),
            //    'item_name'   => json_encode($this->request->getPost('items[]')),
            //    'quantity'    => json_encode($this->request->getPost('qty[]')),
            //    'price'       => json_encode($this->request->getPost('price[]')),
            //    'total'       => json_encode($this->request->getPost('total[]')),
            //    'category'    => json_encode($this->request->getPost('category[]')),
            //    'type'        => 'Cuts',
            //    'created_by'  => $this->currentUser->id,
            //    'created_at'  => date("Y-m-d h:i:s"),
            // ];
            // $this->Mop_model->insert($dataMop);

            /* Insertamos registros en la tabala mop que es la tabla donde se guardan los movimientos de los productos: */
            /* Forma 2 Insercion */
            $productcode   = $this->request->getPost('productcode');
            $items   = $this->request->getPost('items');
            $qty    = $this->request->getPost('qty');
            $price       = $this->request->getPost('price');
            $total       = $this->request->getPost('total');
            $category    = $this->request->getPost('category');
            $randomString = generateRandomString(5);

            for ($i = 0; $i < count($productcode); $i++) {
               $dataMop = array(

                  'id'         => $this->request->getPost('id'),
                  'code'       => $randomString,
                  'item_code'  => $productcode[$i],
                  'item_name'  => $items[$i],
                  'quantity'   => $qty[$i],
                  'price'      => $price[$i],
                  'total'      => $total[$i],
                  'category'   => $category[$i],
                  'type'       => 'Orders',
                  'created_by' => $this->currentUser->id,
                  'created_at' => date("Y-m-d h:i:s"),
               );
               $this->Mop_model->insert($dataMop);
            }



            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Orders_model->errors());
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
         $data = $this->Orders_model->showOrders($id);
         if ($data) {

            $items = json_decode($data['items']);
            $qty = json_decode($data['qty']);
            $price = json_decode($data['price']);
            $this->table->addRow(['<strong>Cliente</strong>', $data['Cm_fname'] . ' ' . $data['Cm_lname']]);
            $this->table->addRow(['<strong>Notas</strong>', $data['notes']]);
            $this->table->addRow(['<strong>Estatus</strong>', $data['status']]);
            $this->table->addRow(['<strong>Entrega</strong>', $data['delivery']]);
            $this->table->addRow(['<strong>Creado por</strong>', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['<strong>Registrado el</strong>', $data['registered_on']]);
            $this->table->addRow(['<strong>Actualizado el</strong>', $data['updated_on']]);
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
         $data = $this->Orders_model->find($id);

         if ($data) {
            $data = [
               'data_orders' => $data,
               'all_customers' => $this->Customers_model->findAll(),
               'action' => 'edit',
            ];

            echo view('admin/orders/form', $data);
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
      $request['customer_id'] = $this->request->getPost('customer_id');
      $request['delivery'] = $this->request->getPost('delivery');
      $request['status'] = $this->request->getPost('status');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']  = json_encode($this->request->getPost('items[]'));
      $request['qty']   = json_encode($this->request->getPost('qty[]'));
      $request['price']   = json_encode($this->request->getPost('price[]'));
      $request['total']   = json_encode($this->request->getPost('total[]'));
      $request['category']    = json_encode($this->request->getPost('category[]'));
      $request['notes'] = $this->request->getPost('notes');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Orders_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Orders_model->errors());
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
         $data = $this->Orders_model->find($id);
         if ($data) {
            $this->Orders_model->delete($id);
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
         'customer_id' => [
            'label' => 'Customer Id',
            'rules' => 'required'
         ],
         'productcode' => [
            'label' => 'Productcode',
            'rules' => 'required'
         ],
         'items' => [
            'label' => 'Items',
            'rules' => 'required|string'
         ],
         'qty' => [
            'label' => 'Qty',
            'rules' => 'required|string'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required'
         ],
         'delivery' => [
            'label' => 'Delivery',
            'rules' => 'required'
         ]
      ]);
   }
}
