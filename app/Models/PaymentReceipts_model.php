<?php
namespace App\Models;
use CodeIgniter\Model;

class PaymentReceipts_model extends Model{
   protected $table      = 'payment_receipts';
   protected $primaryKey = 'receipt_id';
   protected $allowedFields = ['id_user', 'amount_paid', 'payment_date'];
   protected $searchFields = ['id_user', 'amount_paid', 'payment_date', ];

   public function filter($search = null, $limit = null, $start = null, $orderField = null, $orderDir = null){
      $builder = $this->table($this->table);

      $i = 0;
      foreach ($this->searchFields as $column)
      {
            if($search)
            {
               if($i == 0)
               {
                  $builder->groupStart()
                          ->like($column, $search);
               }
               else
               {
                  $builder->orLike($column, $search);
               }

               if(count($this->searchFields) - 1 == $i) $builder->groupEnd();

            }
            $i++;
      }

      // Secara bawaan menampilkan data sebanyak kurang dari
      // atau sama dengan 6 kolom pertama.
      $builder->select('receipt_id, id_user, amount_paid, payment_date, ')
              ->join('user_data', 'user_data.id = payment_receipts.id_user')
              ->orderBy($orderField, $orderDir)
              ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="'.$query[$index][$this->primaryKey].'">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="'.$query[$index][$this->primaryKey].'" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="'.$query[$index][$this->primaryKey].'">Editar</button>';
      }
      return $query;
   }

   public function countTotal(){
      return $this->table($this->table)
                  ->join('user_data', 'user_data.id = payment_receipts.id_user')
                  ->countAll();
   }

   public function countFilter($search){
      $builder = $this->table($this->table);

      $i = 0;
      foreach ($this->searchFields as $column)
      {
            if($search)
            {
               if($i == 0)
               {
                  $builder->groupStart()
                          ->like($column, $search);
               }
               else
               {
                  $builder->orLike($column, $search);
               }

               if(count($this->searchFields) - 1 == $i) $builder->groupEnd();

            }
            $i++;
      }

      return $builder->join('user_data', 'user_data.id = payment_receipts.id_user')
                     ->countAllResults();
   }

}