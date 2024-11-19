<?php

namespace App\Models;

use CodeIgniter\Model;

class Mop_model extends Model
{
   protected $table      = 'mop';
   protected $primaryKey = 'id';
   protected $allowedFields = ['code', 'item_code', 'item_name', 'quantity', 'price', 'total', 'category', 'type', 'created_by', 'created_at'];
   protected $searchFields = ['code', 'item_code', 'item_name', 'quantity', 'category', 'type'];

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
      $builder->select('mop.id, mop.code, mop.item_code, mop.item_name, mop.quantity, mop.price, mop.total, mop.category, mop.type, mop.created_by, mop.created_at, users.id AS Uid, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('users', 'users.id = mop.created_by')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['item_code'] = strlen($query[$index]['item_code']) > 50 ? substr($query[$index]['item_code'], 0, 50) . '...' : $query[$index]['item_code'];

         $query[$index]['item_name'] = strlen($query[$index]['item_name']) > 50 ? substr($query[$index]['item_name'], 0, 50) . '...' : $query[$index]['item_name'];

         $query[$index]['quantity'] = strlen($query[$index]['quantity']) > 50 ? substr($query[$index]['quantity'], 0, 50) . '...' : $query[$index]['quantity'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button>';
         // <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
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
}