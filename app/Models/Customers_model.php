<?php

namespace App\Models;

use CodeIgniter\Model;

class Customers_model extends Model
{
    protected $table      = 'customers';
    protected $primaryKey = 'id';
    protected $allowedFields = ['ic', 'first_name', 'last_name', 'email', 'birthdate', 'gender', 'address', 'department', 'city', 'phone', 'notes', 'registered_by', 'registered_on', 'updated_on'];
    protected $searchFields = ['ic', 'first_name', 'last_name', 'email', 'birthdate'];

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
            $query[$index]['notes'] = strlen($query[$index]['notes']) > 50 ? substr($query[$index]['notes'], 0, 50) . '...' : $query[$index]['notes'];

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






    public function showCustomers($id)
    {
        $builder = $this->db->table('customers')
            ->select('customers.id AS Cm_id, customers.ic, customers.first_name AS Cm_fname, customers.last_name AS Cm_lname, customers.email, customers.birthdate, customers.gender, customers.address, customers.department, customers.city, customers.phone, customers.notes, customers.registered_by, users.id AS U_id, users.first_name AS U_fn, users.last_name AS U_ln, departamentos.id AS DP_id, departamentos.depart_name')
            ->join('users', 'users.id=customers.registered_by')
            ->join('departamentos', 'departamentos.id=customers.department')
            ->where('customers.id', $id);

        return $builder->get()->getRowArray();
    }
}