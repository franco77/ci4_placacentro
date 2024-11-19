<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;
use App\Models\Task_model;

class Task extends BaseController
{
    public function __construct()
    {
        $this->Task_model = new Task_model;
    }
    public function index()
    {
        $data = [
            'title' => 'Tareas',
            'host' => site_url('admin/task/'),
            'task' => $this->Task_model->where('user_id', $this->currentUser->id)->findAll(),
        ];
        echo view('admin/task/task', $data);
    }

    public function add()
    {
        $data = [];

        if ($this->request->getPost("task_name")) {

            $newTask = [
                'user_id'       => $this->currentUser->id,
                'task_details'  => $this->request->getPost("task_name"),
                'task_status'   => 'no'
            ];

            $this->Task_model->insert($newTask);

            $id = $this->Task_model->insertID();
            $output = '<a href="#" class="list-group-item" id="list-group-item-' . $id . '" data-id="' . $id . '">' . $this->request->getPost("task_name") . ' <span class="badge bg-danger" data-id="' . $id . '">X</span></a>';

            return $this->response->setJSON(['output' => $output]);
        }
        $data['task_list'] = $this->Task_model->where('user_id', $this->currentUser->id)
            ->orderBy('id', 'DESC')
            ->findAll();

        return view('todo_list', $data);
    }



    public function update()
    {
        $taskListId = $this->request->getPost('id');
        if (!empty($taskListId)) {
            $data = [
                'task_status' => 'yes',
            ];
            $updated = $this->Task_model->update($taskListId, $data);
            if ($updated) {
                echo 'done';
            }
        }
    }


    public function delete()
    {
        $id = $this->request->getPost('id');

        if ($id) {
            if ($this->Task_model->delete($id)) {
                echo 'done';
            }
        }
    }
}
