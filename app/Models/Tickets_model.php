<?php

namespace App\Models;

use CodeIgniter\Model;

class Tickets_model extends Model
{
   protected $table      = 'tickets';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'id_category', 'ticket_title', 'ticket_description', 'priority', 'status', 'created_on', 'created_by', 'updated_on', 'updated_by'];
   protected $searchFields = ['tickets.id_user', 'tickets.id_category', 'tickets.ticket_title', 'tickets.ticket_description', 'tickets.priority'];

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
      $builder->select('tickets.id, tickets.id_user, tickets.id_category, tickets.ticket_title, tickets.ticket_description, tickets.priority, category.id AS CAT_id, category.title, category.description, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('category', 'category.id = tickets.id_category')
         ->join('users', 'tickets.id_user = users.id')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $query[$index]['ticket_description'] = strlen($query[$index]['ticket_description']) > 50 ? substr($query[$index]['ticket_description'], 0, 50) . '...' : $query[$index]['ticket_description'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }






   public function myfilter($search = null, $limit = null, $start = null, $orderField = null, $orderDir = null, $user_id = null)
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
      $builder->select('tickets.id, tickets.id_user, tickets.id_category, tickets.ticket_title, tickets.ticket_description, tickets.priority, tickets.status, tickets.created_on, tickets.created_by, category.id AS CAT_id, category.title, category.description, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln, users.email')
         ->join('category', 'category.id = tickets.id_category')
         ->join('users', 'tickets.created_by = users.id')
         ->where('tickets.id_user', $user_id)
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         $d = date("Y-m-d, h:i:s");
         $query[$index]['ticket_description'] = '<div class="d-flex" style="padding: 14px;">
         <img
           src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
           alt="John Doe"
           class="me-3 rounded-circle"
           style="width: 60px; height: 60px;"
         /><div>
           <p class="fs-6 fw-semibold">
           ' . $query[$index]['U_fn'] . ' ' . $query[$index]['U_ln'] . ' - <i class="fa fa-envelope"></i>
            ' . $query[$index]['email'] . '
           </p>
           
           <p>' . $query[$index]['ticket_description'] . '</p>
           <span class="meta"><i class="fa fa-calendar"></i> Publicado el  ' . time_elapsed($query[$index]['created_on'], $d) . '</span>
           <span class="meta ms-2"><i class="fa fa-tags"></i>  ' . $query[$index]['title'] . '</span>
           <span class="meta ms-2"><i class="fa fa-window-maximize"></i> ' . $query[$index]['status'] . '</span></div>
       </div><hr>';
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm  btn-primary form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail"><i class="fa fa-eye"></i>
         </button> <button class="btn btn-sm  btn-dark form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '"><i class="fa fa-pencil"></i>
         </button>';
      }
      return $query;
   }






   public function countTotal()
   {
      return $this->table($this->table)
         ->join('category', 'category.id = tickets.id_category')
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

      return $builder->join('category', 'category.id = tickets.id_category')
         ->countAllResults();
   }



   public function showTickets($id)
   {
      $builder = $this->db->table('tickets')
         ->select('*, category.id AS CAT_id, category.title, category.description, users.id AS US_id, users.first_name AS U_fn, users.last_name AS U_ln')
         ->join('category', 'category.id = tickets.id_category')
         ->join('users', 'tickets.id_user = users.id')
         ->where('tickets.id', $id);

      return $builder->get()->getRowArray();
   }
}
