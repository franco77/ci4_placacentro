<?php

namespace App\Models;

use CodeIgniter\Model;

class UserData_model extends Model
{
   protected $table      = 'user_data';
   protected $primaryKey = 'id';
   protected $allowedFields = ['id_user', 'address_1', 'contact_number_2', 'gender', 'experience', 'disabilities', 'number_children', 'names_children', 'age_children', 'civil_status', 'name_couple'];
   protected $searchFields = ['id_user', 'address_1', 'contact_number_2', 'gender', 'experience'];

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
      $builder->select('user_data.id, user_data.id_user, user_data.address_1, user_data.contact_number_2, user_data.gender, user_data.experience, user_data.disabilities, user_data.number_children, user_data.names_children, user_data.age_children, user_data.civil_status, user_data.name_couple, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = user_data.id_user')
         ->orderBy($orderField, $orderDir)
         ->limit($limit, $start);

      $query = $builder->get()->getResultArray();

      foreach ($query as $index => $value) {


         $query[$index]['active'] = ($query[$index]['active'] == 1) ? 'Activo' : 'Inactivo';

         $query[$index]['first_name'] = $query[$index]['first_name'] . ' ' . $query[$index]['last_name'];

         $query[$index]['column_bulk'] = '<input type="checkbox" class="bulk-item" value="' . $query[$index][$this->primaryKey] . '">';
         $query[$index]['column_action'] = '<button class="btn btn-sm btn-xs btn-success form-action" item-id="' . $query[$index][$this->primaryKey] . '" purpose="detail">Ver</button> <button class="btn btn-sm btn-xs btn-warning form-action" purpose="edit" item-id="' . $query[$index][$this->primaryKey] . '">Editar</button>';
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

   public function showUserEmpl()
   {
      $builder = $this->db->table('user_data')
         ->select('user_data.id, user_data.id_user, user_data.address_1, user_data.gender, users.id AS U_id, users.ic, users.first_name, users.last_name')
         ->join('users', 'users.id = user_data.id_user');
      return $builder->get()->getRowArray();
   }

   public function showUsersData($id)
   {
      $builder = $this->db->table('user_data')
         ->select('user_data.id, user_data.id_user, user_data.address_1, user_data.contact_number_2, user_data.gender, user_data.experience, user_data.disabilities, user_data.number_children, user_data.names_children, user_data.age_children, user_data.civil_status, user_data.name_couple, users.id AS U_id, users.ic, users.email, users.photo, users.active, users.first_name, users.last_name, users.birthdate, users.company, users.phone, users.admission_date')
         ->join('users', 'users.id = user_data.id_user')
         ->where('user_data.id', $id);

      return $builder->get()->getRowArray();
   }
}