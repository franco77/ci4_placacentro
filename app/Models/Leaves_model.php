<?php

namespace App\Models;

use CodeIgniter\Model;

class Leaves_model extends Model
{
   protected $table      = 'leaves';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'id_type', 'leave_time', 'start_date', 'end_date', 'hours_leave', 'apply_date', 'reason', 'status'];
   protected $searchFields = ['id_user', 'id_type', 'leave_time', 'start_date', 'end_date'];

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
      $builder->select('leaves.id, leaves.id_user, leaves.id_type, leaves.leave_time, leaves.start_date, leaves.end_date, leaves.hours_leave, leaves.apply_date, leaves.reason, leaves.status, leave_types.id, leave_types.name, leave_types.leave_day, leave_types.status AS TY_st, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = leaves.id_user')
         ->join('leave_types', 'leave_types.id = leaves.id_type')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {
         if ($query[$index]['leave_time'] == 'Half Day') {
            $query[$index]['leave_time'] = '<span class="badge text-bg-primary">Medio Dia</span>';
         } elseif ($query[$index]['leave_time'] == 'Full Day') {
            $query[$index]['leave_time'] = '<span class="badge text-bg-warning">Dia Completo</span>';
         } else {
            $query[$index]['leave_time'] = '<span class="badge text-bg-danger">Mas de un Dia</span>';
         }

         if ($query[$index]['status'] == 'Desaprovado') {
            $query[$index]['status'] = '<span class="badge text-bg-warning">Desaprovado <i class="fa fa-exclamation-circle"></i></span>';
         } elseif ($query[$index]['status'] == 'Aprovado') {
            $query[$index]['status'] = '<span class="badge text-bg-success">Aprovado <i class="fa fa-check-circle-o"></i>
            </span>';
         } else {
            $query[$index]['status'] = '<span class="badge text-bg-danger">Rechazada <i class="fa fa-ban"></i>
            </span>';
         }

         $query[$index]['first_name'] = $query[$index]['first_name'] . ' ' . $query[$index]['last_name'];
         $query[$index]['id_type'] = $query[$index]['name'];
         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
      }
      return $query;
   }

   public function countTotal()
   {
      return $this->table($this->table)
         ->join('user_data', 'user_data.id = leaves.id_user')
         ->join('leave_types', 'leave_types.id = leaves.id_type')
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

      return $builder->join('user_data', 'user_data.id = leaves.id_user')
         ->join('leave_types', 'leave_types.id = leaves.id_type')
         ->countAllResults();
   }

   public function showLeave($id)
   {
      $builder = $this->db->table('leaves')
         ->select('leaves.id, leaves.id_user, leaves.id_type, leaves.leave_time, leaves.start_date, leaves.end_date, leaves.hours_leave, leaves.apply_date, leaves.reason, leaves.status, leave_types.id, leave_types.name, leave_types.leave_day, leave_types.status AS TY_st, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = leaves.id_user')
         ->join('leave_types', 'leave_types.id = leaves.id_type')
         ->where('leaves.id', $id);
      return $builder->get()->getRowArray();
   }
}