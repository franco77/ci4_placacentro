<?php

namespace App\Controllers\Payments;

use App\Controllers\Payments\BaseController;

class Dashboard extends BaseController
{
    public function __construct()
    {
    }
    public function index()
    {
        $data = ['title'      => 'dashboard'];
        return view('payments/dashboard/index', $data);
    }
}
