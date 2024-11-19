<?php

namespace App\Models;

use CodeIgniter\Model;

class Estimates_model extends Model
{
   protected $table      = 'estimates';
   protected $primaryKey = 'id';
   protected $allowedFields = ['customer_id', 'notes', 'productcode', 'items', 'price', 'qty', 'total', 'category', 'status', 'created_by', 'expiry_date', 'registered_on', 'updated_on'];
   protected $searchFields = ['customer_id', 'notes', 'productcode', 'items', 'price'];

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
      $builder->select('estimates.id, estimates.customer_id, estimates.notes, estimates.productcode, estimates.items, estimates.price, estimates.qty, estimates.total, estimates.category, estimates.status, estimates.created_by, estimates.expiry_date, estimates.registered_on, estimates.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone,')
         ->join('customers', 'customers.id = estimates.customer_id')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['expiry_date'] = dates_format($query[$index]['expiry_date']);

         $query[$index]['registered_on'] = dates_format($query[$index]['registered_on']);

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button> <a href="' . base_url('admin/estimates/pdf/') . $query[$index][$this->primaryKey] . '" target="_blank" class="btn btn-danger btn-sm">Pdf</a>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->join('customers', 'customers.id = estimates.customer_id')
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

      return $builder->join('customers', 'customers.id = estimates.customer_id')
         ->countAllResults();
   }
   public function showEstimates($id)
   {
      $builder = $this->db->table('estimates')
         ->select('estimates.id, estimates.customer_id, estimates.notes, estimates.productcode, estimates.items, estimates.price, estimates.qty, estimates.total, estimates.category, estimates.status, estimates.created_by, estimates.expiry_date, estimates.registered_on, estimates.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone, customers.city, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('customers', 'customers.id = estimates.customer_id')
         ->join('users', 'users.id=estimates.created_by')
         ->where('estimates.id', $id);

      return $builder->get()->getRowArray();
   }
   public function pdf($id)
   {
      $builder = $this->db->table('estimates')
         ->select('estimates.id, estimates.customer_id, estimates.notes, estimates.productcode, estimates.items, estimates.price, estimates.qty, estimates.total, estimates.category, estimates.status, estimates.created_by, estimates.expiry_date, estimates.registered_on, estimates.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.gender, customers.address, customers.phone, customers.city')
         ->join('customers', 'customers.id = estimates.customer_id')
         ->where('estimates.id', $id);
      return $builder->get()->getRowArray();
   }
}
