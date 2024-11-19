<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\BaseController;



class Dashboard extends BaseController
{

    public function __construct()
    {
    }
    public function index()
    {



        $db = \Config\Database::connect();
        $builder = $db->table('mop');
        $query = $builder->select("item_name, SUM(quantity) AS total_quantity");
        $query = $builder->where("category", "TABLEROS");
        $query = $builder->limit(4);
        $query = $builder->groupBy("item_name")->get();
        $record = $query->getResult();
        $products = [];
        foreach ($record as $row) {
            $products[] = array(
                'producto'   => $row->item_name,
                'total' => floatval($row->total_quantity)
            );
        }
        $data['products'] = ($products);



        $builder1 = $db->table('cuts');
        $query1 = $builder1->select("cuts.id, cuts.machine_id, cuts.status, machines.id, machines.name_machine, SUM(cuts.quantity_cuts) AS total_cuts");
        $query1 = $builder1->join("machines", "machines.id=cuts.machine_id");
        $query = $builder->where("cuts.status", "activo");
        $query1 = $builder1->groupBy("cuts.machine_id")->get();
        $record1 = $query1->getResult();
        $cuts = [];
        foreach ($record1 as $row) {
            $cuts[] = array(
                'machine'   => $row->name_machine,
                'total' => floatval($row->total_cuts)
            );
        }
        $data['cuts'] = ($cuts);



        $query = $db->table('customers');
        $totalCustomers = $query->countAllResults();

        $query = $db->table('cuts');
        $totalCuts = $query->selectSum('quantity_cuts')->get()->getRow()->quantity_cuts;


        $query = $db->table('items');
        $totalItemas = $query->countAllResults();




        $data = [
            'user' => $this->currentUser->username,
            'products' => ($products),
            'cuts' => ($cuts),
            'title'      => 'dashboard',
            'total_customers' => $totalCustomers,
            'total_cuts' => $totalCuts,
            'total_items' => $totalItemas

        ];

        return view('admin/dashboard/index', $data);
    }
}