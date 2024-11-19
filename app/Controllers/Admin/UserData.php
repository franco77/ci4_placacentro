<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\UserData_model;
use App\Models\Users_model;

class UserData extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->UserData_model = new UserData_model;
      $this->Users_model = new Users_model();
   }

   function index()
   {
      $data = [
         'title' => 'Data User Data',
         'host' => site_url('admin/userdata/')
      ];
      echo view('admin/user_data/list', $data);
   }

   public function data()
   {
      try {
         $request = esc($this->request->getPost());
         $search  = $request['search']['value'];
         $limit   = $request['length'];
         $start   = $request['start'];

         $orderIndex = $request['order'][0]['column'];
         $orderFields = $request['columns'][$orderIndex]['data'];
         $orderDir = $request['order'][0]['dir'];

         $recordsTotal = $this->UserData_model->countTotal();
         $data = $this->UserData_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->UserData_model->countFilter($search);

         $callback = [
            'draw' => $request['draw'],
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data
         ];

         return $this->respond($callback);
      } catch (\Exception $e) {
         return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
      }
   }

   public function new()
   {
      $data = [
         'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
         'action' => 'new'
      ];

      echo view('admin/user_data/form', $data);
   }

   public function create()
   {
      $response = array();

      $request['id']               = $this->request->getPost('id');
      $request['id_user']          = $this->request->getPost('id_user');
      $request['address_1']        = $this->request->getPost('address_1');
      $request['contact_number_2'] = $this->request->getPost('contact_number_2');
      $request['gender']           = $this->request->getPost('gender');
      $request['experience']       = $this->request->getPost('experience');
      $request['disabilities']     = $this->request->getPost('disabilities');
      $request['number_children']  = $this->request->getPost('number_children');
      $request['names_children']   = json_encode($this->request->getPost('names_children[]'));
      $request['age_children']     = json_encode($this->request->getPost('age_children[]'));
      $request['civil_status']     = $this->request->getPost('civil_status');
      $request['name_couple']      = $this->request->getPost('name_couple');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status'   => 400,
            'error'    => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $insert = $this->UserData_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status'  => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->UserData_model->errors());
            }
         } catch (\Exception $e) {
            return $this->failServerError('Sorry, an error occurred. Please contact the administrator.');
         }
      }
   }

   public function show($id = null)
   {
      try {
         $data = $this->UserData_model->showUsersData($id);
         if ($data) {


            $names_children = json_decode($data['names_children']);
            $age_children   = json_decode($data['age_children']);

            $this->table->addRow(['<b>Nombre</b>', $data['first_name'] . ' ' . $data['last_name']]);
            $this->table->addRow(['<b>Cedula</b>', $data['ic']]);
            $this->table->addRow(['<b>Address</b>', $data['address_1']]);
            $this->table->addRow(['<b>Telefono</b>', $data['phone']]);
            $this->table->addRow(['<b>Gender</b>', $data['gender']]);
            $this->table->addRow(['<b>Email</b>', $data['email']]);
            if ($data['active'] == 1) :
               $this->table->addRow(['<b>Estatus</b>', 'Activo']);
            else :
               $this->table->addRow(['<b>Estatus</b>', 'Inactivo']);
            endif;
            $this->table->addRow(['<b>Fecha Nacimiento</b>', $data['birthdate']]);
            $this->table->addRow(['<b>Cargo</b>', $data['company']]);
            $this->table->addRow(['<b>Experience</b>', $data['experience']]);
            $this->table->addRow(['<b>Discapacidades</b>', $data['disabilities']]);
            $this->table->addRow(['<b>Estado Civil</b>', $data['civil_status']]);
            $this->table->addRow(['<b>Nombre Pareja</b>', $data['name_couple']]);
            if ($data['names_children'] != '') :
               $cell = ['style' => 'padding: 7px;text-align: center', 'colspan' => 2, 'data' => '<strong>Hijos</strong>',];
               $this->table->addRow([$cell]);

               $cell2 = ['style' => 'width: 50%', 'data' => '<strong>Nombres</strong>'];
               $this->table->addRow([$cell2, '<strong>Edad</strong>']);
               for ($i = 0; $i < count($names_children); $i++) :
                  $this->table->addRow([$names_children[$i], $age_children[$i]]);
               endfor;
            endif;



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
         $data = $this->UserData_model->find($id);

         if ($data) {
            $data = [
               'data_user_data' => $data,
               'assigned_to' => $this->Users_model->where('active', 1)->findAll(),
               'action' => 'edit'
            ];

            echo view('admin/user_data/form', $data);
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

      $request['id']               = $this->request->getPost('id');
      $request['id_user']          = $this->request->getPost('id_user');
      $request['address_1']        = $this->request->getPost('address_1');
      $request['contact_number_2'] = $this->request->getPost('contact_number_2');
      $request['gender']           = $this->request->getPost('gender');
      $request['experience']       = $this->request->getPost('experience');
      $request['disabilities']     = $this->request->getPost('disabilities');
      $request['number_children']  = $this->request->getPost('number_children');
      $request['names_children']   = json_encode($this->request->getPost('names_children[]'));
      $request['age_children']     = json_encode($this->request->getPost('age_children[]'));
      $request['civil_status']     = $this->request->getPost('civil_status');
      $request['name_couple']      = $this->request->getPost('name_couple');
      $this->rules();

      if ($this->validation->run($request) != TRUE) {
         return $this->respond([
            'status' => 400,
            'error' => 400,
            'messages' => $this->validation->getErrors()
         ], 400);
      } else {
         try {
            $update = $this->UserData_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->UserData_model->errors());
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
         $data = $this->UserData_model->find($id);
         if ($data) {
            $this->UserData_model->delete($id);
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
            'label' => 'Empleado',
            'rules' => 'required|is_unique[user_data.id_user]'
         ],
         'address_1' => [
            'label' => 'Direccion 2',
            'rules' => 'required'
         ],
         'contact_number_2' => [
            'label' => 'Numero de un familiar',
            'rules' => 'required'
         ],
         'gender' => [
            'label' => 'Genero',
            'rules' => 'required'
         ],
         'experience' => [
            'label' => 'Experiencia',
            'rules' => 'required|string'
         ],
         'disabilities' => [
            'label' => 'Discapacidades',
            'rules' => 'required|string'
         ],
         'number_children' => [
            'label' => 'Cantidad de hijos',
            'rules' => 'required'
         ],
         'names_children' => [
            'label' => 'Nombre de los hijos',
            'rules' => 'required|string'
         ],
         'age_children' => [
            'label' => 'Edad Hijo',
            'rules' => 'required'
         ],
         'civil_status' => [
            'label' => 'Estado Civil',
            'rules' => 'required'
         ]
      ]);
   }
}