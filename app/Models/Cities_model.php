<?php
 
namespace App\Models;
 
use CodeIgniter\Model;
 
class Cities_model extends Model {
 
     
    public function __construct() {
        parent::__construct();
        $db = \Config\Database::connect();
    }
 
   function getDepartment()
  {

    $query = $this->db->query('select * from departamentos');
       return $query->getResultArray();
  }
  
  function getDepartmentCity($postData)
  {

    $sql = 'select * from municipios where depart_id ='.$postData;
      $query =  $this->db->query($sql);
      return $query->getResult();
  }
 
   
 
 
}