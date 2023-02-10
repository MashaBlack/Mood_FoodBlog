<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$path = "../";
include 'config.php';
$ctg = mysqli_query($con,"SELECT * FROM category");
$rec= $con->query("select * from recipe");
include '../template/recipes.tpl';
?>