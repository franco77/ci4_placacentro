<?php

namespace App\Models;

use CodeIgniter\Model;

class Salaries_model extends Model
{
   protected $table      = 'salaries';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'amount', 'deductions', 'bonuses', 'net_salary', 'pay_biweekly', 'created_on', 'created_by', 'updated_by'];
   protected $searchFields = ['id_user', 'amount', 'deductions', 'bonuses', 'net_salary'];

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
      $builder->select('salaries.id, salaries.id_user, salaries.amount, salaries.deductions, salaries.bonuses, salaries.net_salary, salaries.pay_biweekly, salaries.created_on, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = salaries.id_user')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {


         $query[$index]['first_name'] = $query[$index]['first_name'] . ' ' . $query[$index]['last_name'];
         $query[$index]['amount'] = monies_format($query[$index]['amount']);
         $query[$index]['deductions'] = monies_format($query[$index]['deductions']);
         $query[$index]['net_salary'] = monies_format($query[$index]['net_salary']);
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->join('user_data', 'user_data.id = salaries.id_user')
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

      return $builder->join('user_data', 'user_data.id = salaries.id_user')
         ->countAllResults();
   }


   public function showSalaries($id)
   {
      $builder = $this->db->table('salaries')
         ->select('salaries.id, salaries.id_user, salaries.amount, salaries.deductions, salaries.bonuses, salaries.net_salary, salaries.pay_biweekly, salaries.created_on, salaries.created_by, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = salaries.id_user')
         ->where('salaries.id', $id);
      return $builder->get()->getRowArray();
   }
}