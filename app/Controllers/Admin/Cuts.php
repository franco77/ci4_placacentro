<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Cuts_model;
use App\Models\Customers_model;
use App\Models\Machines_model;
use App\Models\Assortments_model;
use App\Models\Mop_model;

class Cuts extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Cuts_model = new Cuts_model;
      $this->Customers_model = new Customers_model;
      $this->Machines_model = new Machines_model;
      $this->Assortments_model = new Assortments_model;
      $this->Mop_model = new Mop_model;
   }

   function index()
   {
      $data = [
         'title' => 'Cortes',
         'host' => site_url('admin/cuts/')
      ];
      echo view('admin/cuts/list', $data);
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

         $recordsTotal = $this->Cuts_model->countTotal();
         $data = $this->Cuts_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Cuts_model->countFilter($search);

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
         'data_customers' => $this->Customers_model->findAll(),
         'data_machines' => $this->Machines_model->findAll(),
         'action' => 'new',
      ];

      echo view('admin/cuts/form', $data);
   }

   public function create()
   {
      $response = array();

      $add_days = $this->request->getPost('total_days');
      $holidays = number_days_skillful(date("Y-m-d"), $add_days);

      $request['id'] = $this->request->getPost('id');
      $request['machine_id'] = $this->request->getPost('machine_id');
      $request['customer_id'] = $this->request->getPost('customer_id');
      $request['notes'] = $this->request->getPost('notes');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']       = json_encode($this->request->getPost('items[]'));
      $request['qty']         = json_encode($this->request->getPost('qty[]'));
      $request['price']       = json_encode($this->request->getPost('price[]'));
      $request['total']       = json_encode($this->request->getPost('total[]'));
      $request['category']    = json_encode($this->request->getPost('category[]'));
      $request['express'] = $this->request->getPost('express');
      $request['total_days'] = $this->request->getPost('total_days');
      $request['date_generated_delivery'] = $holidays;
      $request['date_delivered'] = $this->request->getPost('date_delivered');
      $request['qty_boards'] = $this->request->getPost('qty_boards');
      $request['qty_perforations'] = $this->request->getPost('qty_perforations');
      $request['quantity_cuts'] = $this->request->getPost('quantity_cuts');
      $request['total_meters_edge'] = $this->request->getPost('total_meters_edge');
      $request['stiff_edge'] = $this->request->getPost('stiff_edge');
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



            $insert = $this->Cuts_model->insert($request);
            $lastId = $this->Cuts_model->insertID();

            $data = [
               'id_cut' => $lastId,
               'status_assortment' => 'sin_surtir',
            ];
            $this->Assortments_model->insert($data);
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
                  'type'       => 'Cuts',
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
               return $this->fail($this->Cuts_model->errors());
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
         $data = $this->Cuts_model->showCuts($id);
         if ($data) {
            $items = json_decode($data['items']);
            $qty = json_decode($data['qty']);
            $price = json_decode($data['price']);
            $this->table->addRow(['<strong>Codigo de seguimiento</strong>', ':', $data['id']]);
            $this->table->addRow(['<strong>Maquina asignada</strong>', ':', $data['name_machine']]);
            $this->table->addRow(['<strong>Cliente del proyecto</strong>', ':', $data['Cm_fname'] . ' ' . $data['Cm_lname']]);
            $this->table->addRow(['<strong>Notas</strong>', ':', $data['Cuts_notes']]);
            $this->table->addRow(['<strong>Express</strong>', ':', $data['express']]);
            $this->table->addRow(['<strong>Estatus</strong>', ':', $data['St_Cut']]);
            $this->table->addRow(['<strong>Total Dias asignados</strong>', ':', $data['total_days']]);
            $this->table->addRow(['<strong>Fecha generada para la entrega</strong>', ':', $data['date_generated_delivery']]);
            if ($data['date_delivered'] != '') :
               $this->table->addRow(['<strong>Fecha de entrega</strong>', ':', $data['date_delivered']]);
            endif;
            $this->table->addRow(['<strong>Cantidad Laminas</strong>', ':', $data['qty_boards']]);
            $this->table->addRow(['<strong>Cantidad Perforaciones</strong>', ':', $data['qty_perforations']]);
            $this->table->addRow(['<strong>Cantidad Cortes</strong>', ':', $data['quantity_cuts']]);
            $this->table->addRow(['<strong>Total metros de canto</strong>', ':', $data['total_meters_edge']]);
            $this->table->addRow(['<strong>Canto rigido</strong>', ':', $data['stiff_edge']]);
            if ($data['name_edge_bander'] != '') :
               $this->table->addRow(['<strong>Enchapadora asignada</strong>', ':', $data['name_edge_bander']]);
            endif;
            $this->table->addRow(['<strong>Registrado por</strong>', ':', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['<strong>Fecha de registrado</strong>', ':', $data['registered_on']]);
            $this->table->addRow(['<strong>Actualizado el</strong>', ':', $data['updated_on']]);

            $cell = ['style' => 'padding: 7px;text-align: center', 'colspan' => 3, 'data' => '<strong>Lista De Productos</strong>',];
            $this->table->addRow([$cell]);

            $cell2 = ['style' => 'width: 50%', 'data' => '<strong>Productos</strong>'];
            $this->table->addRow([$cell2, '<strong>Cantidad</strong>', '<strong>Precio</strong>']);
            for ($i = 0; $i < count($items); $i++) :
               $this->table->addRow([$items[$i], $qty[$i], monies_format($price[$i])]);
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
         $data = $this->Cuts_model->find($id);

         if ($data) {
            $data = [
               'data_customers' => $this->Customers_model->findAll(),
               'data_machines' => $this->Machines_model->findAll(),
               'data_cuts' => $data,
               'action' => 'edit',
            ];

            echo view('admin/cuts/form', $data);
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

      $add_days = $this->request->getPost('total_days');
      $holidays = number_days_skillful(date("Y-m-d"), $add_days);

      $request['id'] = $this->request->getPost('id');
      $request['machine_id'] = $this->request->getPost('machine_id');
      $request['customer_id'] = $this->request->getPost('customer_id');
      $request['description'] = $this->request->getPost('description');
      $request['notes'] = $this->request->getPost('notes');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']       = json_encode($this->request->getPost('items[]'));
      $request['qty']         = json_encode($this->request->getPost('qty[]'));
      $request['price']       = json_encode($this->request->getPost('price[]'));
      $request['total']       = json_encode($this->request->getPost('total[]'));
      $request['category']       = json_encode($this->request->getPost('category[]'));
      $request['express'] = $this->request->getPost('express');
      $request['total_days'] = $this->request->getPost('total_days');
      //$request['date_generated_delivery'] = $holidays;
      $request['date_delivered'] = $this->request->getPost('date_delivered');
      $request['qty_boards'] = $this->request->getPost('qty_boards');
      $request['qty_perforations'] = $this->request->getPost('qty_perforations');
      $request['quantity_cuts'] = $this->request->getPost('quantity_cuts');
      $request['total_meters_edge'] = $this->request->getPost('total_meters_edge');
      $request['stiff_edge'] = $this->request->getPost('stiff_edge');
      $request['updated_on'] = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Cuts_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Cuts_model->errors());
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
         $data = $this->Cuts_model->find($id);
         if ($data) {
            $this->Cuts_model->delete($id);
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
         'machine_id' => [
            'label' => 'Machine Id',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'customer_id' => [
            'label' => 'Customer Id',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'notes' => [
            'label' => 'Notes',
            'rules' => 'required|string'
         ],
         'express' => [
            'label' => 'Express',
            'rules' => 'required'
         ],
         'total_days' => [
            'label' => 'Total Days',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'qty_boards' => [
            'label' => 'Qty Boards',
            'rules' => 'required|decimal|max_length[7]'
         ],
         'qty_perforations' => [
            'label' => 'Qty Perforations',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'quantity_cuts' => [
            'label' => 'Quantity Cuts',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'total_meters_edge' => [
            'label' => 'Total Meters Edge',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'stiff_edge' => [
            'label' => 'Stiff Edge',
            'rules' => 'required|in_list[no, si]'
         ]
      ]);
   }
}