<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use App\Models\Users_model;
use App\Models\Messages_model;
use CodeIgniter\API\ResponseTrait;

class Chat extends BaseController
{
    use ResponseTrait;
    public function __construct()
    {
        $this->Users_model = new Users_model();
        $this->Messages_model = new Messages_model();
    }
    public function index()
    {
        helper(['form']);
        $data = ['title' => 'Data Holidays',];
        if ($this->request->getPost()) {
            $rules = [
                'username' => 'required'
            ];

            if (!$this->validate($rules)) {
                $data['validation'] = $this->validator;
            } else {
                $this->Users_model = new Users_model();
                $check_username = $this->Users_model->where('username', $this->request->getVar('username'))->first();
                if ($check_username) {
                    $userdata = [
                        'username' => $check_username['username']
                    ];
                    session()->set($userdata);
                    return redirect()->to('admin/chat/chat');
                }
                $save = [
                    'username' => $this->request->getVar('username')
                ];

                $this->Users_model->save($save);
                $userdata = [
                    'username' => $save['username']
                ];
                session()->set($userdata);
                return redirect()->to('admin/chat/chat');
            }
        }
        return view('admin/chat/index', $data);
    }

    public function chat()
    {
        if (!session()->get('username'))
            return redirect()->to('/');

        $data = ['title' => 'Data Holidays',];

        if ($this->request->getPost()) {
            $rules = [
                'message' => 'required'
            ];

            if (!$this->validate($rules)) {
                return $this->fail($this->validator->getErrors());
            } else {
                $msg = [
                    'username' => session()->get('username'),
                    'message' => $this->request->getVar('message')
                ];
                $this->Messages_model->save($msg);
                return $this->respondCreated($msg);
            }
        }
        return view('admin/chat/chat', $data);
    }

    public function msg()
    {
        $data = $this->Messages_model->orderBy('id', 'DESC')->findAll();
        return $this->respond($data);
    }
}