<?php

namespace App\Models;

use CodeIgniter\Model;

class Messages_model extends Model
{
    protected $table                = 'messages';
    protected $primaryKey           = 'id';

    protected $allowedFields        = ['username', 'message', 'created_at'];
}