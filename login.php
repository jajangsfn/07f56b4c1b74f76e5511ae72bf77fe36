<?php
//check HTTP method
$method = $_SERVER['REQUEST_METHOD'];
require "register.php";

if ($method == "GET") {
    $data = new Register();
    echo json_encode($data->get_account());

}else if ($method == "POST") {
    $post = $_POST;

    if (!isset($post['username']))
    {
        echo json_encode(array("result"=>"failed","msg" => "please fill username"));
    }else if (!isset($post['password'])) {
        echo json_encode(array("result"=>"failed","msg" => "please fill password"));
    }else {
        $register = new Register();
        $register->verify_account($post);
    }
    
}

?>