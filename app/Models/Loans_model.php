<?php

namespace App\Models;

use CodeIgniter\Model;

class Loans_model extends Model
{
   protected $table      = 'loans';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'loan_amount', 'total_installments', 'interests', 'fee_amount', 'loan_date', 'loan_end_date', 'status', 'created_by', 'registered_on', 'updated_on'];
   protected $searchFields = ['id_user', 'loan_amount', 'loan_date',];

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
      $builder->select('loans.id, loans.id_user, loans.loan_amount, loans.total_installments, loans.interests, loans.fee_amount, loans.loan_date, loans.loan_end_date, loans.status, loans.created_by, loans.registered_on, loans.updated_on, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = loans.id_user')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['first_name'] = $query[$index]['first_name'] . ' ' . $query[$index]['last_name'];
         $query[$index]['loan_amount'] = monies_format($query[$index]['loan_amount']);
         $query[$index]['fee_amount'] = monies_format($query[$index]['fee_amount']);
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->join('user_data', 'user_data.id = loans.id_user')
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

      return $builder->join('user_data', 'user_data.id = loans.id_user')
         ->countAllResults();
   }
}