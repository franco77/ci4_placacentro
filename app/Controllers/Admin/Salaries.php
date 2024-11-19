<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Salaries_model;
use App\Models\Users_model;

class Salaries extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Salaries_model = new Salaries_model;
      $this->Users_model = new Users_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Salaries',
         'host' => site_url('admin/salaries/')
      ];
      echo view('admin/salaries/list', $data);
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

         $recordsTotal = $this->Salaries_model->countTotal();
         $data = $this->Salaries_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Salaries_model->countFilter($search);

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
         'data_user_data' => $this->Users_model->where('active', 1)->findAll(),
      ];

      echo view('admin/salaries/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id'] = $this->request->getPost('id');
      $request['id_user'] = $this->request->getPost('id_user');
      $request['amount'] = $this->request->getPost('amount');
      $request['deductions'] = $this->request->getPost('deductions');
      $request['bonuses'] = $this->request->getPost('bonuses');
      $request['net_salary'] = $this->request->getPost('net_salary');
      $request['pay_biweekly'] = $this->request->getPost('pay_biweekly');
      $request['created_on'] = date("Y-m-d h:i:s");
      $request['created_by']    = $this->currentUser->id;


      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Salaries_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Salaries_model->errors());
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
         $data = $this->Salaries_model->showSalaries($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<b>Empleado</b>', $data['first_name'] . ' ' . $data['last_name']]);
            $this->table->addRow(['<b>Cedula</b>', $data['ic']]);
            $this->table->addRow(['<b>Monto</b>', $data['amount']]);
            $this->table->addRow(['<b>Deducciones</b>', $data['deductions']]);
            $this->table->addRow(['<b>Bonos</b>', $data['bonuses']]);
            $this->table->addRow(['<b>Salario Neto</b>', $data['net_salary']]);
            $this->table->addRow(['<b>Pago Quincenal</b>', $data['pay_biweekly']]);
            $this->table->addRow(['<b>Fecha de registro</b>', $data['created_on']]);
            $created_by = $this->Users_model->find($data['created_by']);
            $this->table->addRow(['<b>Registrado por</b>', $created_by['first_name']]);
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
         $data = $this->Salaries_model->find($id);

         if ($data) {
            $data = [
               'data_user_data' => $this->Users_model->where('active', 1)->findAll(),
               'data_salaries' => $data
            ];

            echo view('admin/salaries/form', $data);
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
      $request['amount'] = $this->request->getPost('amount');
      $request['deductions'] = $this->request->getPost('deductions');
      $request['bonuses'] = $this->request->getPost('bonuses');
      $request['net_salary'] = $this->request->getPost('net_salary');
      $request['pay_biweekly'] = $this->request->getPost('pay_biweekly');
      $request['updated_by']    = $this->currentUser->id;
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->Salaries_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Salaries_model->errors());
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
         $data = $this->Salaries_model->find($id);
         if ($data) {
            $this->Salaries_model->delete($id);
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
         'amount' => [
            'label' => 'Amount',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'deductions' => [
            'label' => 'Deductions',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'bonuses' => [
            'label' => 'Bonuses',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'net_salary' => [
            'label' => 'Net Salary',
            'rules' => 'required|decimal|max_length[10]'
         ],
         'pay_biweekly' => [
            'label' => 'Pay Month',
            'rules' => 'required|string|max_length[255]'
         ]
      ]);
   }
}