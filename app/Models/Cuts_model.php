<?php

namespace App\Models;

use CodeIgniter\Model;

class Cuts_model extends Model
{
   protected $table      = 'cuts';
   protected $primaryKey = 'id';
   protected $allowedFields = ['machine_id', 'customer_id', 'notes', 'productcode', 'items', 'price', 'qty', 'total', 'category', 'express', 'status', 'total_days', 'date_generated_delivery', 'date_delivered', 'qty_boards', 'qty_perforations', 'quantity_cuts', 'total_meters_edge', 'stiff_edge', 'name_edge_bander', 'created_by', 'registered_on', 'updated_on'];
   protected $searchFields = ['cuts.id', 'cuts.machine_id', 'cuts.qty_boards', 'cuts.status', 'cuts.express', 'cuts.productcode'];

   public function filter($search = null, $limit = null, $start = null, $orderField = null, $orderDir = null)
   {
      $builder = $this->table($this->table);

      $i = 0;
      foreach ($this->searchFields as $column) {
         if ($search) {
            if ($i == 0) {
               $builder->groupStart()
                  ->like($column, $search);
            } else {
               $builder->orLike($column, $search);
            }

            if (count($this->searchFields) - 1 == $i) $builder->groupEnd();
         }
         $i++;
      }

      // Secara bawaan menampilkan data sebanyak kurang dari
      // atau sama dengan 6 kolom pertama.
      $builder->select('cuts.id, cuts.machine_id, cuts.customer_id, cuts.notes AS Cuts_notes, cuts.productcode, cuts.items, cuts.qty, cuts.category, cuts.express, cuts.status AS St_Cut, cuts.total_days, cuts.date_generated_delivery, cuts.date_delivered, cuts.qty_boards, cuts.qty_perforations, cuts.quantity_cuts, cuts.total_meters_edge, cuts.stiff_edge, cuts.name_edge_bander, cuts.created_by, cuts.registered_on, cuts.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone, customers.notes, machines.id AS M_id,  machines.name_machine, machines.cod, machines.status')
         //->from('cuts')
         ->join('customers', 'customers.id = cuts.customer_id')
         ->join('machines', 'machines.id=cuts.machine_id')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {


         $query[$index]['notes'] = strlen($query[$index]['notes']) > 50 ? substr($query[$index]['notes'], 0, 50) . '...' : $query[$index]['notes'];

         $query[$index]['items'] = strlen($query[$index]['items']) > 50 ? substr($query[$index]['items'], 0, 50) . '...' : $query[$index]['items'];

         $query[$index]['registered_on'] = $query[$index]['registered_on'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->select('*, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone, customers.notes, machines.id AS M_id,  machines.name_machine, machines.cod, machines.status, users.id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('customers', 'customers.id = cuts.customer_id')
         ->join('machines', 'machines.id = cuts.machine_id')
         ->countAll();
   }

   public function countFilter($search)
   {
      $builder = $this->table($this->table);

      $i = 0;
      foreach ($this->searchFields as $column) {
         if ($search) {
            if ($i == 0) {
               $builder->groupStart()
                  ->like($column, $search);
            } else {
               $builder->orLike($column, $search);
            }

            if (count($this->searchFields) - 1 == $i) $builder->groupEnd();
         }
         $i++;
      }

      return $builder->countAllResults();
   }


   public function showCuts($id)
   {
      $builder = $this->db->table('cuts')
         ->select('cuts.id, cuts.machine_id, cuts.customer_id, cuts.notes AS Cuts_notes, cuts.productcode, cuts.items, cuts.qty, cuts.category, cuts.price, cuts.express, cuts.status AS St_Cut, cuts.total_days, cuts.date_generated_delivery, cuts.date_delivered, cuts.qty_boards, cuts.qty_perforations, cuts.quantity_cuts, cuts.total_meters_edge, cuts.stiff_edge, cuts.name_edge_bander, cuts.created_by, cuts.registered_on, cuts.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone, customers.notes, machines.id AS M_id, machines.name_machine, machines.cod, machines.status AS ST_Machine, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('customers', 'customers.id = cuts.customer_id')
         ->join('machines', 'machines.id = cuts.machine_id')
         ->join('users', 'users.id=cuts.created_by')
         ->where('cuts.id', $id);

      return $builder->get()->getRowArray();
   }
}