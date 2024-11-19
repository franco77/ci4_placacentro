<?php

namespace App\Models;

use CodeIgniter\Model;

class Task_model extends Model
{
    protected $table = 'task_list';
    protected $primaryKey = 'id';
    protected $allowedFields = ['user_id', 'task_details', 'task_status'];
}