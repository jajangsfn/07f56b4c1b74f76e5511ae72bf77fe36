<?php
//check HTTP method
$method = $_SERVER['REQUEST_METHOD'];
require "register.php";

if ($method == "GET") {
    $data = new Register();
    echo json_encode($data->get_account());

}else if ($method == "POST") {
    $post = $_POST;
    $register = new Register();
    $register->register($post);
}else {
    echo json_encode(array("result"=>"failed", "msg"=>"method not allowed!"));
}

?>