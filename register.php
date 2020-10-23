<?php
session_start();
require("koneksi.php");

class Register extends Koneksi{
    public $client_id       = "testclient";
    public $client_secret   = "testpass";

    public function __construct() {
        parent::__construct();
    }

    public function register($post) {
        
        if (!isset($post['username'])) {
            echo "please fill username parameter";
        }else if (!isset($post['password'])) {
            echo "please fill password parameter";
        }else if (!isset($post['firstname'])) {
            echo "please fill firstname parameter";
        }else if (!isset($post['lastname'])) {
            echo "please fill lastname parameter";
        }else if (!isset($post['email'])) {
            echo "please fill email parameter";
        }else {
            $data['username'] = $post['username'];
            $data['password'] = $post['password'];

            $data['first_name'] = $post['firstname'];
            $data['last_name'] = $post['lastname'];
            $data['email'] = $post['email'];

            //check account 
            $email = $post['email'];
            $check = $this->get_data("SELECT * FROM oauth_users WHERE email='$email'");
            
            if ($check->fetch()) {
                echo "failed, email is exists!";
            }else {
                $this->insert_account($data);
                echo "berhasil insert";
            }
            
        }
    }

    public function get_account() {
        $data = $this->get_data("SELECT * FROM account");
        $temp = array();
        $i = 1;
        foreach($data as $row) {
            $temp[$i]['firstname'] = $row['firstname'];
            $temp[$i]['lastname'] = $row['lastname'];
            $temp[$i]['email'] = $row['email'];
            $temp[$i]['password'] = $row['password'];
            $temp[$i]['created_date'] = $row['created_date'];
            $temp[$i]['updated_date'] = $row['updated_date'];
            $i++;
        }

        return $temp;

    }

    public function verify_account($data) {
        // require_once('server.php');
        $username= trim($data['username']);
        $password = trim($data['password']);
        $qry = "SELECT * FROM oauth_users WHERE email='$username' or username='$username'";

        $stmt = $this->get_data($qry);
        $is_exist = $stmt->fetch();
        if ($is_exist) {
            //check password
            // echo $is_exist['password'];exit;
            $verify = password_verify($password, $is_exist['password']);
            
            if ($verify) {
                //get access_token
                //check token
                $username2 = $username;
                require("token.php");

                $_SESSION['username'] = $username2;
                $_SESSION['email']    = $is_exist['email'];
                $_SESSION['user_id']    = $is_exist['id'];
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