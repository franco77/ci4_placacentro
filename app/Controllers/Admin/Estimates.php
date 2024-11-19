<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Estimates_model;
use App\Models\Customers_model;
use Dompdf\Dompdf;

class Estimates extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Estimates_model = new Estimates_model;
      $this->Customers_model = new Customers_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Estimates',
         'host' => site_url('admin/estimates/')
      ];
      echo view('admin/estimates/list', $data);
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

         $recordsTotal = $this->Estimates_model->countTotal();
         $data = $this->Estimates_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Estimates_model->countFilter($search);

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
         'action' => 'new',
      ];

      echo view('admin/estimates/form', $data);
   }

   public function create()
   {
      $response = array();

      $request['id']            = $this->request->getPost('id');
      $request['customer_id']   = $this->request->getPost('customer_id');
      $request['notes']         = $this->request->getPost('notes');
      $request['productcode']   = json_encode($this->request->getPost('productcode[]'));
      $request['items']         = json_encode($this->request->getPost('items[]'));
      $request['qty']           = json_encode($this->request->getPost('qty[]'));
      $request['price']         = json_encode($this->request->getPost('price[]'));
      $request['total']         = json_encode($this->request->getPost('total[]'));
      $request['category']      = json_encode($this->request->getPost('category[]'));
      $request['status']        = $this->request->getPost('status');
      $request['created_by']    = $this->currentUser->id;
      $request['expiry_date']   = $this->request->getPost('expiry_date');
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
            $insert = $this->Estimates_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Estimates_model->errors());
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
         $data = $this->Estimates_model->showEstimates($id);
         if ($data) {
            $items = json_decode($data['items']);
            $qty = json_decode($data['qty']);
            $price = json_decode($data['price']);
            $this->table->addRow(['<strong>Cliente</strong>', ':', $data['Cm_fname'] . ' ' . $data['Cm_lname']]);
            $this->table->addRow(['Notes', ':', $data['notes']]);
            $this->table->addRow(['Status', ':', $data['status']]);
            $this->table->addRow(['Created By', ':', $data['U_fn'] . ' ' . $data['U_ln']]);
            $this->table->addRow(['Expiry Date', ':', dates_format($data['expiry_date'])]);
            $this->table->addRow(['Registered On', ':', dates_format($data['registered_on'])]);
            $this->table->addRow(['Updated On', ':', dates_format($data['updated_on'])]);
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
         $data = $this->Estimates_model->find($id);

         if ($data) {
            $data = [
               'data_customers' => $this->Customers_model->findAll(),
               'data_estimates' => $data,
               'action' => 'edit',
            ];

            echo view('admin/estimates/form', $data);
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

      $request['id']          = $this->request->getPost('id');
      $request['customer_id'] = $this->request->getPost('customer_id');
      $request['notes']       = $this->request->getPost('notes');
      $request['productcode'] = json_encode($this->request->getPost('productcode[]'));
      $request['items']       = json_encode($this->request->getPost('items[]'));
      $request['qty']         = json_encode($this->request->getPost('qty[]'));
      $request['price']       = json_encode($this->request->getPost('price[]'));
      $request['total']       = json_encode($this->request->getPost('total[]'));
      $request['category']    = json_encode($this->request->getPost('category[]'));
      $request['status']      = $this->request->getPost('status');
      $request['expiry_date'] = $this->request->getPost('expiry_date');
      $request['updated_on']  = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Estimates_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Estimates_model->errors());
            }
         } catch (\Exception $e) {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }




   function pdf($id = '')
   {
      $dompdf = new \Dompdf\Dompdf();
      $data['estimate'] = $this->Estimates_model->pdf($id);
      $dompdf->loadHtml(view('admin/estimates/pdf', $data));
      $dompdf->setPaper('letter', 'portrait');
      $options = $dompdf->getOptions();
      $options->set(array('isRemoteEnabled' => true));
      $dompdf->setOptions($options);
      $dompdf->render();
      $time = time();
      $dompdf->stream("report_" . $time . ".pdf", array(
         'Attachment' => 0,
      ));
   }




   public function delete($id = null)
   {
      try {
         $data = $this->Estimates_model->find($id);
         if ($data) {
            $this->Estimates_model->delete($id);
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
            'rules' => 'required|numeric|max_length[11]'
         ],
         'notes' => [
            'label' => 'Notes',
            'rules' => 'required|string'
         ],
         'productcode' => [
            'label' => 'Productcode',
            'rules' => 'required|string|max_length[250]'
         ],
         'items' => [
            'label' => 'Items',
            'rules' => 'required|string'
         ],
         'price' => [
            'label' => 'Price',
            'rules' => 'required|string'
         ],
         'qty' => [
            'label' => 'Qty',
            'rules' => 'required|string'
         ],
         'total' => [
            'label' => 'Total',
            'rules' => 'required|string'
         ],
         'category' => [
            'label' => 'Category',
            'rules' => 'required|string'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required|in_list[activo, inactivo, eliminado]'
         ],
         'expiry_date' => [
            'label' => 'Expiry Date',
            'rules' => 'required|valid_date[Y-m-d]'
         ]
      ]);
   }
}
