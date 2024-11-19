<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\Customers_model;
use App\Models\Cities_model;

class Customers extends BaseController
{
    use ResponseTrait;

    public function __construct()
    {
        $this->Customers_model = new Customers_model;
        $this->Cities_model = new Cities_model();
    }

    function index()
    {
        $data = [
            'title' => 'Clientes',
            'controller' => 'Customers',
            'host' => site_url('admin/customers/')
        ];
        echo view('admin/customers/list', $data);
    }


    public function selectAjaxCustomer()
    {
        $postData = $this->request->getPost('depcustomerID');
        $result   = $this->Customers_model->find($postData);
        echo json_encode($result);
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

            $recordsTotal = $this->Customers_model->countTotal();
            $data = $this->Customers_model->filter($search, $limit, $start, $orderFields, $orderDir);
            $recordsFiltered = $this->Customers_model->countFilter($search);

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
            'department' => $this->Cities_model->getDepartment(),
            'action' => 'new'

        ];

        echo view('admin/customers/form', $data);
    }



    public function getDepartment()
    {

        $postData = $this->request->getPost('dep');
        $data = $this->Cities_model->getDepartmentCity($postData);
        echo json_encode($data);
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
                $insert = $this->Customers_model->insert($request);

                if ($insert) {
                    return $this->respondCreated([
                        'status' => 201,
                        'message' => 'Data created.'
                    ]);
                } else {
                    return $this->fail($this->Customers_model->errors());
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
            $data = $this->Customers_model->showCustomers($id);
            if ($data) {
                // Secara bawaan menampilkan data dari tabel utama saja.
                $this->table->addRow(['<strong>Cedula</strong>', $data['ic']]);
                $this->table->addRow(['<strong>Nombre</strong>', $data['Cm_fname']]);
                $this->table->addRow(['<strong>Apellido</strong>', $data['Cm_lname']]);
                $this->table->addRow(['<strong>Correo electrónico</strong>', $data['email']]);
                $this->table->addRow(['<strong>Fecha de nacimiento</strong>', $data['birthdate']]);
                $this->table->addRow(['<strong>Género</strong>', $data['gender']]);
                $this->table->addRow(['<strong>Direccion</strong>', $data['address']]);
                $this->table->addRow(['<strong>Departamento</strong>', $data['depart_name']]);
                $this->table->addRow(['<strong>Ciudad</strong>', $data['city']]);
                $this->table->addRow(['<strong>Teléfono</strong>', $data['phone']]);
                $this->table->addRow(['<strong>Notas</strong>', $data['notes']]);
                $this->table->addRow(['<strong>Registrado Por</strong>', $data['U_fn'] . ' ' . $data['U_ln']]);
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
            $data = $this->Customers_model->find($id);

            if ($data) {
                $data = [
                    'data_customers' => $data,
                    'department' => $this->Cities_model->getDepartment(),
                    'action' => 'edit'
                ];

                echo view('admin/customers/form', $data);
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
                $update = $this->Customers_model->update($id, $request);

                if ($update) {
                    return $this->respondNoContent('Data updated');
                } else {
                    return $this->fail($this->Customers_model->errors());
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
            $data = $this->Customers_model->find($id);
            if ($data) {
                $this->Customers_model->delete($id);
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
            'ic' => [
                'label' => 'Cedula',
                'rules' => 'trim|required|is_unique[customers.ic]'
            ],
            'first_name' => [
                'label' => 'First Name',
                'rules' => 'required|string|max_length[50]'
            ],
            'last_name' => [
                'label' => 'Last Name',
                'rules' => 'required|string|max_length[50]'
            ],
            'email' => [
                'label' => 'Email',
                'rules' => 'required|string|max_length[50]'
            ],
            'birthdate' => [
                'label' => 'Birthdate',
                'rules' => 'required|valid_date[Y-m-d]'
            ],
            'gender' => [
                'label' => 'Gender',
                'rules' => 'required|string|max_length[50]'
            ],
            'address' => [
                'label' => 'Address',
                'rules' => 'required|string|max_length[50]'
            ],
            'department' => [
                'label' => 'Department',
                'rules' => 'required|string|max_length[250]'
            ],
            'city' => [
                'label' => 'City',
                'rules' => 'required|string|max_length[250]'
            ],
            'phone' => [
                'label' => 'Phone',
                'rules' => 'required|string|max_length[50]'
            ]
        ]);
    }
}