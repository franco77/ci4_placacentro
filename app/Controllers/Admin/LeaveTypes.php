<?php
namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\LeaveTypes_model;
class LeaveTypes extends BaseController{
   use ResponseTrait;

   public function __construct() {
      $this->LeaveTypes_model = new LeaveTypes_model;

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
         'title' => 'Data Leave Types',
         'host' => site_url('admin/leavetypes/')
      ];
      echo view('admin/leave_types/list', $data);
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

         $recordsTotal = $this->LeaveTypes_model->countTotal();
         $data = $this->LeaveTypes_model->filter($search, $limit, $start, $orderFields, $orderDir);
         $recordsFiltered = $this->LeaveTypes_model->countFilter($search);

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
      $data = [];

      echo view('admin/leave_types/form', $data);
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
            $insert = $this->LeaveTypes_model->insert($request);

            if ($insert)
            {
               return $this->respondCreated([
                  'status' => 201,
                  'message' => 'Data created.'
               ]);
            }
            else
            {
               return $this->fail($this->LeaveTypes_model->errors());
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
         $data = $this->LeaveTypes_model->find($id);
         if ($data)
         {
            // Secara bawaan menampilkan data dari tabel utama saja.
            $this->table->addRow(['Name', ':', $data['name']]);
            $this->table->addRow(['Leave Day', ':', $data['leave_day']]);
            $this->table->addRow(['Status', ':', $data['status']]);
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
         $data = $this->LeaveTypes_model->find($id);

         if ($data)
         {
            $data = [
               'data_leave_types' => $data
            ];

            echo view('admin/leave_types/form', $data);
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
            $update = $this->LeaveTypes_model->update($id, $request);

            if ($update)
            {
               return $this->respondNoContent('Data updated');
            }
            else {
               return $this->fail($this->LeaveTypes_model->errors());
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
         $data = $this->LeaveTypes_model->find($id);
         if ($data)
         {
            $this->LeaveTypes_model->delete($id);
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
         'name' => [
            'label' => 'Name',
            'rules' => 'required|string|max_length[64]'
         ],
         'leave_day' => [
            'label' => 'Leave Day',
            'rules' => 'required|string|max_length[255]'
         ],
         'status' => [
            'label' => 'Status',
            'rules' => 'required|numeric|max_length[1]'
         ],
      ]);
   }

}