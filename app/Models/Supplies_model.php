<?php

namespace App\Models;

use CodeIgniter\Model;

class Supplies_model extends Model
{
   protected $table      = 'supplies';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'subject', 'productcode', 'items', 'price', 'qty', 'total', 'category', 'notes', 'deliver_date', 'created_by', 'created_at', 'updated_at'];
   protected $searchFields = ['id_user', 'subject', 'productcode', 'items', 'qty'];

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
      $builder->select('supplies.id, supplies.id_user, supplies.subject, supplies.productcode, supplies.items, supplies.price, supplies.qty, supplies.total, supplies.notes, supplies.deliver_date, supplies.created_by, supplies.created_at, supplies.updated_at, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'supplies.id_user = users.id')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['items'] = strlen($query[$index]['items']) > 50 ? substr($query[$index]['items'], 0, 50) . '...' : $query[$index]['items'];

         $query[$index]['qty'] = strlen($query[$index]['qty']) > 50 ? substr($query[$index]['qty'], 0, 50) . '...' : $query[$index]['qty'];

         $query[$index]['notes'] = strlen($query[$index]['notes']) > 50 ? substr($query[$index]['notes'], 0, 50) . '...' : $query[$index]['notes'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
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


   public function showSupplies($id)
   {
      $builder = $this->db->table('supplies')
         ->select('supplies.id, supplies.id_user, supplies.subject, supplies.productcode, supplies.items, supplies.price, supplies.qty, supplies.total, supplies.notes, supplies.deliver_date, supplies.created_by, supplies.created_at, supplies.updated_at, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'users.id = supplies.id_user')
         ->where('supplies.id', $id);

      return $builder->get()->getRowArray();
   }
}
