<?php

namespace App\Models;

use CodeIgniter\Model;

class Expenses_model extends Model
{
   protected $table      = 'expenses';
   protected $primaryKey = 'id';
   protected $allowedFields = ['ex_in_cat_id', 'title', 'amount', 'description', 'created_by', 'created_at', 'updated_at'];
   protected $searchFields = ['expenses.id', 'expenses.title', 'expenses.amount', 'expenses.description', 'expenses.created_at'];

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
      $builder->select('expenses.id, expenses.ex_in_cat_id, expenses.title, expenses.amount, expenses.description, expenses.created_by, expenses.created_at, expenses.updated_at, cat_ex_in.id AS CAT_in, cat_ex_in.title AS CAT_title, cat_ex_in.description, cat_ex_in.type, users.id AS U_id, users.first_name, users.last_name')
         ->join('cat_ex_in', 'cat_ex_in.id = expenses.ex_in_cat_id')
         ->join('users', 'users.id = expenses.created_by')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['description'] = strlen($query[$index]['description']) > 50 ? substr($query[$index]['description'], 0, 50) . '...' : $query[$index]['description'];

         $query[$index]['first_name'] = $query[$index]['first_name'] . ' ' . $query[$index]['last_name'];

         $query[$index]['amount'] = monies_format($query[$index]['amount']);

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->join('cat_ex_in', 'cat_ex_in.id = expenses.ex_in_cat_id')
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

      return $builder->join('cat_ex_in', 'cat_ex_in.id = expenses.ex_in_cat_id')
         ->countAllResults();
   }


   public function showExpenses($id)
   {
      $builder = $this->db->table('expenses')
         ->select('expenses.id, expenses.ex_in_cat_id, expenses.title, expenses.amount, expenses.description, expenses.created_by, expenses.created_at, expenses.updated_at, cat_ex_in.id AS CAT_in, cat_ex_in.title AS CAT_title, cat_ex_in.description, cat_ex_in.type, users.id AS U_id, users.first_name, users.last_name')
         ->join('cat_ex_in', 'cat_ex_in.id = expenses.ex_in_cat_id')
         ->join('users', 'users.id = expenses.created_by')
         ->where('expenses.id', $id);

      return $builder->get()->getRowArray();
   }
}