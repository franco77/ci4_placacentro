<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Leaves_model;
use App\Models\Users_model;
use App\Models\LeaveTypes_model;

class Leaves extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Leaves_model = new Leaves_model;
      $this->Users_model = new Users_model;
      $this->LeaveTypes_model = new LeaveTypes_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Leaves',
         'host' => site_url('admin/leaves/')
      ];
      echo view('admin/leaves/list', $data);
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

         $recordsTotal = $this->Leaves_model->countTotal();
         $data = $this->Leaves_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Leaves_model->countFilter($search);

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
         'data_user_data'   => $this->Users_model->select('users.id AS U_id, users.ic, users.first_name, users.last_name, user_data.id, user_data.id_user, user_data.address_1, user_data.gender')
            ->join('user_data', 'users.id = user_data.id_user')->findAll(),
         'data_leave_types' => $this->LeaveTypes_model->findAll(),
         'action' => 'new'
      ];
      echo view('admin/leaves/form', $data);
   }

   public function create()
   {
      $response = array();
      $request['id']            = $this->request->getPost('id');
      $request['id_user']            = $this->request->getPost('id_user');
      $request['id_type']            = $this->request->getPost('id_type');
      $request['leave_time']            = $this->request->getPost('leave_time');
      $request['start_date']            = $this->request->getPost('start_date');
      $request['end_date']            = $this->request->getPost('end_date');
      $request['hours_leave']            = $this->request->getPost('hours_leave');
      $request['reason']            = $this->request->getPost('reason');
      $request['apply_date']            = date("Y-m-d h:i:s");
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->Leaves_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Leaves_model->errors());
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
         $data = $this->Leaves_model->showLeave($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<b>Empleado</b>', $data['first_name'] . ' ' . $data['last_name']]);
            $this->table->addRow(['<b>Categoria del permiso</b>', $data['name']]);
            if ($data['leave_time'] == 'Half Day') :
               $this->table->addRow(['<b>Tiempo del permiso</b>', 'Medio día']);
            elseif ($data['leave_time'] == 'Full Day') :
               $this->table->addRow(['<b>Tiempo del permiso</b>', 'Dia Completo']);
            else :
               $this->table->addRow(['<b>Tiempo del permiso</b>', 'Mas De Un Dia']);
            endif;
            $this->table->addRow(['<b>Fecha Inicio</b>', $data['start_date']]);
            if ($data['end_date'] != '') :
               $this->table->addRow(['<b>Fecha Final</b>', $data['end_date']]);
            endif;
            if ($data['hours_leave'] != '') :
               $this->table->addRow(['<b>Horas de licencia</b>', $data['hours_leave']]);
            endif;
            $this->table->addRow(['<b>Fecha de aplicado</b>', $data['apply_date']]);
            $this->table->addRow(['<b>Rasones del permiso</b>', $data['reason']]);
            $this->table->addRow(['<b>Status</b>', $data['status']]);
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
         $data = $this->Leaves_model->find($id);

         if ($data) {
            $data = [
               'data_user_data' => $this->Users_model->select('users.id AS U_id, users.ic, users.first_name, users.last_name, user_data.id, user_data.id_user, user_data.address_1, user_data.gender')
                  ->join('user_data', 'users.id = user_data.id_user')->findAll(),
               'data_leave_types' => $this->LeaveTypes_model->findAll(),
               'data_leaves' => $data,
               'action' => 'edit'
            ];

            echo view('admin/leaves/form', $data);
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
            $update = $this->Leaves_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Leaves_model->errors());
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
         $data = $this->Leaves_model->find($id);
         if ($data) {
            $this->Leaves_model->delete($id);
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
         'id_type' => [
            'label' => 'Id Type',
            'rules' => 'required|numeric|max_length[11]'
         ],
         'leave_time' => [
            'label' => 'Leave Time',
            'rules' => 'required|string|max_length[120]'
         ],
         'start_date' => [
            'label' => 'Start Date',
            'rules' => 'required|string|max_length[64]'
         ],
         'hours_leave' => [
            'label' => 'Hours Leave',
            'rules' => 'required|string|max_length[128]'
         ],
         'reason' => [
            'label' => 'Reason',
            'rules' => 'required|string|max_length[1024]'
         ]
      ]);
   }
}