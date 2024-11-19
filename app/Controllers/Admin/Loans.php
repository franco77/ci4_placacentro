<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Loans_model;
use App\Models\Users_model;

class Loans extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Loans_model = new Loans_model;
      $this->Users_model = new Users_model;

      $tableTemplate = [
         'table_open' => '<table class="table table-responsive table-striped table-bordered">',
         'tbody_open'         => '<tbody>',
         'tbody_close'        => '</tbody>',
         'table_close'        => '</table>'
      ];
      $this->table = new \CodeIgniter\View\Table($tableTemplate);
      $this->validation = \Config\Services::validation();
   }

   function index()
   {
      $data = [
         'title' => 'Data Loans',
         'host' => site_url('admin/loans/')
      ];
      echo view('admin/loans/list', $data);
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

         $recordsTotal = $this->Loans_model->countTotal();
         $data = $this->Loans_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Loans_model->countFilter($search);

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
         'data_user_data' => $this->Users_model->findAll(),
         'action' => 'new',
      ];

      echo view('admin/loans/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id']                 = $this->request->getPost('id');
      $request['id_user']            = $this->request->getPost('id_user');
      $request['loan_amount']        = $this->request->getPost('loan_amount');
      $request['total_installments'] = $this->request->getPost('total_installments');
      $request['interests']          = $this->request->getPost('interests');
      $request['fee_amount']         = $this->request->getPost('fee_amount');
      $request['status']             = 'sin_pagar';
      $request['loan_date']          = $this->request->getPost('loan_date');
      $request['loan_end_date']      = $this->request->getPost('loan_end_date');
      $request['created_by']      = $this->currentUser->id;
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
            $insert = $this->Loans_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Loans_model->errors());
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
         $data = $this->Loans_model->join('user_data', 'user_data.id = loans.id_user')
            ->find($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Id User', ':', $data['id_user']]);
            $this->table->addRow(['Loan Amount', ':', $data['loan_amount']]);
            $this->table->addRow(['Loan Date', ':', $data['loan_date']]);
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
         $data = $this->Loans_model->find($id);

         if ($data) {
            $data = [
               'data_user_data' => $this->Users_model->findAll(),
               'data_loans' => $data,
               'action' => 'edit',
            ];

            echo view('admin/loans/form', $data);
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
      $request['id']                 = $this->request->getPost('id');
      $request['id_user']            = $this->request->getPost('id_user');
      $request['loan_amount']        = $this->request->getPost('loan_amount');
      $request['total_installments'] = $this->request->getPost('total_installments');
      $request['interests']          = $this->request->getPost('interests');
      $request['fee_amount']         = $this->request->getPost('fee_amount');
      $request['status']             = $this->request->getPost('status');;
      $request['loan_date']          = $this->request->getPost('loan_date');
      $request['loan_end_date']      = $this->request->getPost('loan_end_date');
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
            $update = $this->Loans_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Loans_model->errors());
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
         $data = $this->Loans_model->find($id);
         if ($data) {
            $this->Loans_model->delete($id);
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
         'loan_amount' => [
            'label' => 'Loan Amount',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'loan_date' => [
            'label' => 'Loan Date',
            'rules' => 'required|valid_date[Y-m-d]'
         ],
      ]);
   }
}
