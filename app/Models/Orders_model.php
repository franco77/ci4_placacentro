<?php

namespace App\Models;

use CodeIgniter\Model;

class Orders_model extends Model
{
   protected $table      = 'orders';
   protected $primaryKey = 'id';
   protected $allowedFields = ['customer_id', 'productcode', 'items', 'price', 'qty', 'total', 'category', 'notes', 'status', 'delivery', 'created_by', 'registered_on', 'updated_on'];
   protected $searchFields = ['customer_id', 'productcode', 'items', 'qty', 'notes'];

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
      $builder->select('orders.id, orders.customer_id, orders.productcode,orders.items, orders.qty, orders.notes, orders.status, orders.delivery, orders.created_by, orders.registered_on, orders.updated_on, customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, users.id AS Uid, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('customers', 'customers.id=orders.customer_id')
         ->join('users', 'users.id = orders.created_by')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {


         $query[$index]['notes'] = strlen($query[$index]['notes']) > 50 ? substr($query[$index]['notes'], 0, 50) . '...' : $query[$index]['notes'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item"
    value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action"
    item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button
    class="btn btn-sm btn-xs btn-warning form-action" purpose="edit"
    item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
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


   public function updateStatus($itemId, $newStatus)
   {
      $data = ['status' => $newStatus];
      $this->update($itemId, $data);
      return $this->affectedRows() > 0;
   }


   public function showOrders($id)
   {
      $builder = $this->db->table('orders')
         ->select('orders.id, orders.customer_id, orders.productcode,orders.items, orders.price, orders.qty, orders.total,
orders.notes, orders.status, orders.delivery, orders.created_by, orders.registered_on, orders.updated_on, customers.id
AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, users.id AS Uid,
users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('customers', 'customers.id=orders.customer_id')
         ->join('users', 'users.id = orders.created_by')
         ->where('orders.id', $id);

      return $builder->get()->getRowArray();
   }
}