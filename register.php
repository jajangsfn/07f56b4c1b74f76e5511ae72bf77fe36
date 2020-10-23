<?php
session_start();
require("koneksi.php");

class Register extends Koneksi{

    public function __construct() {
        parent::__construct();
    }

    public function register($post) {
        
        if (!isset($post['username'])) {
            echo  json_encode(array("result"=>"failed","msg"=>"please fill username parameter"));
        }else if (!isset($post['password'])) {
            echo  json_encode(array("result"=>"failed","msg"=>"please fill password parameter"));
        }else if (!isset($post['firstname'])) {
            echo  json_encode(array("result"=>"failed","msg"=>"please fill firstname parameter"));
        }else if (!isset($post['lastname'])) {
            echo  json_encode(array("result"=>"failed","msg"=>"please fill lastname parameter"));
        }else if (!isset($post['email'])) {
            echo  json_encode(array("result"=>"failed","msg"=>"please fill email parameter"));
        }else {

            $data['username']   = $post['username'];
            $data['password']   = $post['password'];
            $data['first_name'] = $post['firstname'];
            $data['last_name']  = $post['lastname'];
            $data['email']      = $post['email'];

            //check account 
            $email = $post['email'];
            $check = $this->get_data("SELECT * FROM oauth_users WHERE email='$email'");
            
            if ($check->fetch()) {
                echo  json_encode(array("result"=>"failed","msg"=>"failed, email is exists!"));
            }else {
                $this->insert_account($data);
                echo  json_encode(array("result"=>"success","msg"=>"berhasil insert"));
            }
            
        }
    }

    public function get_account() {
        $data = $this->get_data("SELECT * FROM oauth_users");
        $temp = array();
        $i = 1;
        foreach($data as $row) {
            $temp[$i]['firstname']  = $row['first_name'];
            $temp[$i]['lastname']   = $row['last_name'];
            $temp[$i]['email']      = $row['email'];
            $temp[$i]['password']   = $row['password'];
            $i++;
        }

        return $temp;

    }

    public function verify_account($data) {
        $username   = trim($data['username']);
        $password   = trim($data['password']);
        $qry        = "SELECT * FROM oauth_users WHERE email='$username' or username='$username'";

        $stmt       = $this->get_data($qry);
        $is_exist   = $stmt->fetch();
        if ($is_exist) {
            //check password
            $verify = password_verify($password, $is_exist['password']);
            
            if ($verify) {
                //get access_token
                //check token
                $username2            = $username;
                require("token.php");
                $_SESSION['result']   = "success";
                $_SESSION['username'] = $username2;
                $_SESSION['email']    = $is_exist['email'];
                $_SESSION['user_id']  = $is_exist['id'];
                $_SESSION['is_login'] = true;
                $_SESSION['msg']      = "You have been login!";

                echo json_encode($_SESSION);

            }else {
                echo  json_encode(array("result"=>"failed","msg"=>"password is wrong!"));
            }

        }else {
            echo  json_encode(array("result"=>"failed","msg"=>"account not found!"));
        }
    }
}

?>