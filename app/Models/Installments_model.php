<?php

namespace App\Models;

use CodeIgniter\Model;

class Installments_model extends Model
{
   protected $table      = 'installments';
   protected $primaryKey = 'id';
   protected $allowedFields = ['cod_cut', 'title', 'type', 'description', 'amount', 'status', 'ip_address', 'created_by', 'updated_by', 'created_at', 'time', 'updated_at', 'deleted_at'];
   protected $searchFields = ['cod_cut', 'title', 'type', 'description', 'amount'];

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
      $builder->select('installments.id, installments.cod_cut, installments.title, installments.type, installments.description, installments.amount, installments.status, installments.ip_address, installments.created_by,installments. updated_by, installments.created_at, installments.time, installments.updated_at, installments.deleted_at, cuts.id AS CUT_id, cuts.machine_id, cuts.customer_id, cuts.notes AS Cuts_notes, cuts.productcode, cuts.items, cuts.qty, cuts.category, cuts.price, cuts.express, cuts.status AS St_Cut, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, users.id AS U_id, customers.address, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'users.id=installments.created_by')
         ->join('cuts', 'cuts.id=installments.cod_cut')
         ->join('customers', 'customers.id=cuts.customer_id')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['description'] = strlen($query[$index]['description']) > 50 ? substr($query[$index]['description'], 0, 50) . '...' : $query[$index]['description'];



         $query[$index]['status'] = '<label class="switch">' .
            ($query[$index]['status'] == 'Activo' ?
               '<input id="cheak" data-id="' . $query[$index][$this->primaryKey] . '" value="Activo" type="checkbox" checked>' :
               '<input id="cheak" data-id="' . $query[$index][$this->primaryKey] . '" value="Inactivo" type="checkbox">') .
            '<span class="slider round"></span>
</label>';


         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button> <a href="' . base_url('admin/installments/pdf/') . $query[$index][$this->primaryKey] . '" target="_blank" class="btn btn-danger btn-sm">Pdf</a>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
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


   public function pdf($id)
   {
      $builder = $this->db->table('installments')
         ->select('installments.id, installments.cod_cut, installments.title, installments.type, installments.description, installments.amount, installments.status, installments.ip_address, installments.created_by,installments. updated_by, installments.created_at, installments.time, installments.updated_at, installments.deleted_at, cuts.id AS CUT_id, cuts.machine_id, cuts.customer_id, cuts.notes AS Cuts_notes, cuts.productcode, cuts.items, cuts.qty, cuts.category, cuts.price, cuts.express, cuts.status AS St_Cut, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, users.id AS U_id, customers.address, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'users.id=installments.created_by')
         ->join('cuts', 'cuts.id=installments.cod_cut')
         ->join('customers', 'customers.id=cuts.customer_id')
         ->where('installments.id', $id);
      return $builder->get()->getRowArray();
   }


   public function showInstallments($id)
   {
      $builder = $this->db->table('installments')
         ->select('installments.id, installments.cod_cut, installments.title, installments.type, installments.description, installments.amount, installments.status, installments.ip_address, installments.created_by,installments. updated_by, installments.created_at, installments.time, installments.updated_at, installments.deleted_at, users.id AS U_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'users.id=installments.created_by')
         ->where('installments.id', $id);

      return $builder->get()->getRowArray();
   }
}