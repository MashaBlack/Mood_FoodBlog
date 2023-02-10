<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
include 'config.php';
$message = "";
$heading = "Выполните вход";
if(isset($_POST['submit']))
{
	$login = $_POST["login"];
	$password = $_POST["password"];
	if(empty($login) || empty($password)) {
	    $message = "Заполните все поля";
    }
	else {
        $sql = "CALL find_user('$login','$password')";
        $res = $con->query($sql)->fetch_array();
        if($res) {
            $_SESSION["user_id"] = $res['user_id'];
            $_SESSION["login"] = $res['login'];
            $_SESSION["name"] = $res['user_name'];
            $_SESSION["status"] = $res['status'];
            //$query= $con->query("CALL get_chosen($usid)");
            //$arr = [];
            //while($r = $query->fetch_array()) {
              //  $arr[$r['recipe_id']] = $r['recipe_name'];
            //}
            //$_SESSION["chosen"] = $arr;
            if ($res['user_id'] == 1) {
                header('Location:../admin.php');
            }
            else {
                $heading = "Вход выполнен! <p>Переход на главную через <span id='counter'>3</span> секунд.</p>
														<script type='text/javascript'>
														function countdown() {
															var i = document.getElementById('counter');
															if (parseInt(i.innerHTML)<=0) {
																location.href = '../index.php';
															}
															i.innerHTML = parseInt(i.innerHTML)-1;
														}
														setInterval(function(){ countdown(); },1000);
														</script>";
            }
        }
        else {
            $message = "Неправильный логин или пароль";
        }
    }
}
include '../template/login.tpl';
?>