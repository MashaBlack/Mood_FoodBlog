<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$path = "";
include 'php/config.php';
$rec= mysqli_query($con,'SELECT * FROM recipe LIMIT 6');
include 'template/main.tpl';
?>