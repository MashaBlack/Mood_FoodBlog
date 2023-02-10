<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$path = "../";
include 'config.php';
$usid = $_SESSION['user_id'];
$rec= $con->query("CALL get_chosen($usid)");
//$gname = mysqli_query($con, "SELECT get_name($usid) as 're'");
//$uname = mysqli_fetch_array($gname);
//$name = $uname['re'];
//$check = $con->query("SELECT user_name FROM user WHERE user_id = ".$usid);
//$sql = "SELECT get_name(" . $usid . ") as 're'";
//$tname = mysqli_fetch_array($check);
//$name = $check['user_name'];
include '../template/chosen.tpl';
?>