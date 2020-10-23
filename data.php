<?php
require "koneksi.php";

class Data extends Koneksi{
    
    public function __construct() {
        parent::__construct();
    }

    public function get_all() {
        $data = $this->get_data("SELECT * FROM oauth_email");
        $temp = array();
        $i    = 0; 
        foreach($data as $row) {
            $temp[$i]['destination'] = $row['destination'];
            $temp[$i]['msg_body'] = $row['msg_body'];
            $i++;
        }

        $result['data'] = $temp;

        return $result;
    }
    
}

?>