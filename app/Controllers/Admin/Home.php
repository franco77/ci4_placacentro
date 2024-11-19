<?php

namespace App\Controllers\Admin;

class Home extends BaseController
{
    public function index(): string
    {
        return view('error-403');
    }
}