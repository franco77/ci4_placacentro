<?php
namespace App\Models;
use CodeIgniter\Model;

class CatExIn_model extends Model{
   protected $table      = 'cat_ex_in';
   protected $primaryKey = 'id';
   protected $allowedFields = ['title', 'description', 'type', 'created_at'];
   protected $searchFields = ['title', 'description', 'type', 'created_at', ];

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
      $builder->select('id, title, description, type, created_at, ')
              ->orderBy($orderField, $orderDir)
              ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['description'] = strlen($query[$index]['description']) > 50 ? substr($query[$index]['description'], 0, 50).'...' : $query[$index]['description'];
         
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="'.$query[$index][$this->primaryKey].'">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="'.$query[$index][$this->primaryKey].'" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="'.$query[$index][$this->primaryKey].'">Editar</button>';
      }
      return $query;
   }

   public function countTotal(){
      return $this->table($this->table)
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

      return $builder->countAllResults();
   }

}