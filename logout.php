<?php 
include "bdd_connection.php";
$userSession = new UserSession();
$userSession->destroy();
header('Location: index.php');
exit(); 