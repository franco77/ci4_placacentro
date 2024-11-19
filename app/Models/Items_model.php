<?php

namespace App\Models;

use CodeIgniter\Model;

class Items_model extends Model
{
   protected $table      = 'items';
   protected $primaryKey = 'id';
   protected $allowedFields = ['item_code', 'item_name', 'item_description', 'quantity', 'buy_price', 'status', 'category', 'id_brand', 'created_at', 'updated_at'];
   protected $searchFields = ['item_code', 'item_name', 'quantity', 'status', 'category'];

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
      $builder->select('*')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {

         $query[$index]['item_code'] = '<span class="badge text-bg-primary"> #-' . $query[$index]['item_code'] . '</span>';
         $query[$index]['status'] = ($query[$index]['status'] == 'ACTIVO') ? '<span class="badge text-bg-success">Activo</span>' : '<span class="badge text-bg-danger">Inactivo</span>';


         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn  btn-sm btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn  btn-sm btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
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


   public function showItems($id)
   {
      $builder = $this->db->table('items')
         ->select('items.id, items.item_code, items.item_name, items.item_description, items.quantity, items.buy_price, items.status, items.category, items.id_brand, items.created_at, items.updated_at, brands.id AS BR_id, brands.brand')
         ->join('brands', 'brands.id=items.id_brand')
         ->where('items.id', $id);

      return $builder->get()->getRowArray();
   }
}