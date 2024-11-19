<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Providers_model;

class Providers extends BaseController
{
   use ResponseTrait;

   public function __construct()
   {
      $this->Providers_model = new Providers_model;
   }

   function index()
   {
      $data = [
         'title' => 'Data Providers',
         'host' => site_url('admin/providers/')
      ];
      echo view('admin/providers/list', $data);
   }


   function cards()
   {
      $data = [
         'title' => 'Data Providers',
         'host' => site_url('admin/providers/'),
         'providers' => $this->Providers_model->findAll()
      ];
      echo view('admin/providers/cards', $data);
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

         $recordsTotal = $this->Providers_model->countTotal();
         $data = $this->Providers_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->Providers_model->countFilter($search);

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

      echo view('admin/providers/form', $data);
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
            $insert = $this->Providers_model->insert($request);

            if ($insert) {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            } else {
               return $this->fail($this->Providers_model->errors());
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
         $data = $this->Providers_model->find($id);
         if ($data) {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['<b>Compañia</b>', $data['company']]);
            $this->table->addRow(['<b>Nombre</b>', $data['contact_name']]);
            $this->table->addRow(['<b>Titulo Contacto</b>', $data['contact_title']]);
            $this->table->addRow(['<b>Direccion</b>', $data['address']]);
            $this->table->addRow(['<b>Ciudad</b>', $data['city']]);
            $this->table->addRow(['<b>Region</b>', $data['region']]);
            $this->table->addRow(['<b>Pais</b>', $data['country']]);
            $this->table->addRow(['<b>Telefono</b>', $data['phone']]);
            $this->table->addRow(['<b>Email</b>', $data['email']]);
            $this->table->addRow(['<b>Website</b>', $data['website']]);
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
         $data = $this->Providers_model->find($id);

         if ($data) {
            $data = [
               'data_providers' => $data
            ];

            echo view('admin/providers/form', $data);
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
            $update = $this->Providers_model->update($id, $request);

            if ($update) {
               return $this->respondNoContent('Data updated');
            } else {
               return $this->fail($this->Providers_model->errors());
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
         $data = $this->Providers_model->find($id);
         if ($data) {
            $this->Providers_model->delete($id);
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
         'company' => [
            'label' => 'Company',
            'rules' => 'required|string|max_length[40]'
         ],
         'contact_name' => [
            'label' => 'Contact Name',
            'rules' => 'required|string|max_length[30]'
         ],
         'contact_title' => [
            'label' => 'Contact Title',
            'rules' => 'required|string|max_length[30]'
         ],
         'address' => [
            'label' => 'Address',
            'rules' => 'required|string|max_length[60]'
         ],
         'city' => [
            'label' => 'City',
            'rules' => 'required|string|max_length[15]'
         ],
         'region' => [
            'label' => 'Region',
            'rules' => 'required|string|max_length[15]'
         ],
         'country' => [
            'label' => 'Country',
            'rules' => 'required|string|max_length[15]'
         ],
         'phone' => [
            'label' => 'Phone',
            'rules' => 'required|string|max_length[24]'
         ],
         'website' => [
            'label' => 'Website',
            'rules' => 'required|string|max_length[255]'
         ],
      ]);
   }
}
