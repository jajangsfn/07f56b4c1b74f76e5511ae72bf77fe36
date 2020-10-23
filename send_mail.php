<?php
session_start();
//check HTTP method
$method = $_SERVER['REQUEST_METHOD'];
//get all data
if($method == "GET") {
    require("data.php");//get all data

    // if he is not login
    if (!isset($_SESSION['is_login'])) {
        echo json_encode(array("result" => "failed", "msg" => "Please Login!"));
        die();
    }
    
    $data = new Data();
    echo json_encode($data->get_all());

}else if ($method =="POST"){
    require("koneksi.php"); // koneksi to db
    require("mail.php"); // function for email
    require("token.php"); // get token

    // if he is not login
    if (!isset($_SESSION['is_login'])) {
        echo json_encode(array("result" => "failed", "msg" => "Please Login!"));
        die();
    }

    $post= $_POST;
    $qry = new Koneksi();

    if (!isset($post['to'])) {
        echo json_encode(array("result"=>"failed","msg"=>"Please fill to parameter"));
    }else if (!isset($post['msg'])) {
        echo json_encode(array("result"=>"failed","msg"=>"Please fill message parameter"));
    }else {
        //send mail
        $email = new Mail($post['to'], $post['msg']);
        $email->send_mail();

        $arr['to']      = $post['to'];
        $arr['msg']     =  $post['msg'];
        $arr['user_id'] = $_SESSION['user_id'];
        $qry->insert_data($arr);
    }
    
}else {
    echo "method not allowed!";
}



?>