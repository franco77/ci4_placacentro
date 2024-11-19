<?php
namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\PaymentReceipts_model;
use App\Models\UserData_model;
class PaymentReceipts extends BaseController{
   use ResponseTrait;

   public function __construct() {
      $this->PaymentReceipts_model = new PaymentReceipts_model;
      $this->UserData_model = new UserData_model;

      $tableTemplate = [
         'table_open' => '<table class="table table-responsive table-striped table-bordered">',
         'tbody_open'         => '<tbody>',
         'tbody_close'        => '</tbody>',
         'table_close'        => '</table>'
      ];
      $this->table = new \CodeIgniter\View\Table($tableTemplate);
      $this->validation = \Config\Services::validation();
   }

   function index(){
      $data = [
         'title' => 'Data Payment Receipts',
         'host' => site_url('admin/paymentreceipts/')
      ];
      echo view('admin/payment_receipts/list', $data);
   }

   public function data(){
      try
      {
         $request = esc($this->request->getPost());
         $search = $request['search']['value'];
         $limit = $request['length'];
         $start = $request['start'];

         $orderIndex = $request['order'][0]['column'];
         $orderFields = $request['columns'][$orderIndex]['data'];
         $orderDir = $request['order'][0]['dir'];

         $recordsTotal = $this->PaymentReceipts_model->countTotal();
         $data = $this->PaymentReceipts_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->PaymentReceipts_model->countFilter($search);

         $callback = [
            'draw' => $request['draw'],
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data
         ];

         return $this->respond($callback);
      }
      catch (\Exception $e)
      {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }

   }

   public function new()
   {
      $data = [
         'data_user_data' => $this->UserData_model->findAll(),];

      echo view('admin/payment_receipts/form', $data);
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
         try
         {
            $insert = $this->PaymentReceipts_model->insert($request);

            if ($insert)
            {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            }
            else
            {
               return $this->fail($this->PaymentReceipts_model->errors());
            }
         }
         catch (\Exception $e)
         {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }

   }

   public function show($id = null)
   {
      try
      {
         $data = $this->PaymentReceipts_model->join('user_data', 'user_data.id = payment_receipts.id_user')
                     ->find($id);
         if ($data)
         {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Id User', ':', $data['id_user']]);
            $this->table->addRow(['Amount Paid', ':', $data['amount_paid']]);
            $this->table->addRow(['Payment Date', ':', $data['payment_date']]);
            return $this->respond($this->table->generate());
         }
         else{
            return $this->failNotFound();
         }
      }
      catch (\Exception $e)
      {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }

   }

   public function edit($id = null)
   {
      try
      {
         $data = $this->PaymentReceipts_model->find($id);

         if ($data)
         {
            $data = [
               'data_user_data' => $this->UserData_model->findAll(),
               'data_payment_receipts' => $data
            ];

            echo view('admin/payment_receipts/form', $data);
         }
         else
         {
            return $this->failNotFound();
         }
      }
      catch (\Exception $e)
      {
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
         try
         {
            $update = $this->PaymentReceipts_model->update($id, $request);

            if ($update)
            {
               return $this->respondNoContent('Data updated');
            }
            else {
               return $this->fail($this->PaymentReceipts_model->errors());
            }
         }
         catch (\Exception $e)
         {
            // return $this->failServerError($e->getMessage());
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }

   public function delete($id = null)
   {
      try
      {
         $data = $this->PaymentReceipts_model->find($id);
         if ($data)
         {
            $this->PaymentReceipts_model->delete($id);
            return $this->respondDeleted([
               'status' => 200,
               'message' => 'Data deleted.'
            ]);
         }
         else
         {
            return $this->failNotFound();
         }
      }
      catch (\Exception $e)
      {
         // return $this->failServerError($e->getMessage());
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   private function rules(){
      $this->validation->setRules([
         'id_user' => [
            'label' => 'Id User',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'amount_paid' => [
            'label' => 'Amount Paid',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'payment_date' => [
            'label' => 'Payment Date',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
      ]);
   }

}