<?php

$servername = "localhost";
$username = "t90463h6_cb";
$password = "CulinaryBlog20";
$db = "t90463h6_cb";

// Create connection
$con = mysqli_connect($servername,$username,$password, $db);
// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
