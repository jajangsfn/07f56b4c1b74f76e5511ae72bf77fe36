<?php
require_once("server.php");
$_POST['client_id']  = 'testclient'; //default for test
$_POST['client_secret']= 'testpass'; //default for test
$_POST['grant_type'] = 'client_credentials'; // default for test
// Handle a request for an OAuth2.0 Access Token and send the response to the client
$server->handleTokenRequest(OAuth2\Request::createFromGlobals())->send();
?>