<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
include 'config.php';
$message = "";
$heading = "Регистрация";
if (isset($_POST['submit'] ))
{
    $login = $_POST["login"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $repassword = $_POST["repassword"];
    $emailValidation = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$/";
    $check_login = $con->query("SELECT login FROM user WHERE login = '".$login."'");
    $count = mysqli_num_rows($check_login);
    //echo $check_login;
    if (empty($login) || empty($username) || empty($password) || empty($repassword)) {
        $message = "Все поля должны быть заполнены!";
    }
    elseif (!preg_match($emailValidation, $login)) {
        $message = "Неправильный формат электронной почты";
    }
    elseif ($count > 0) {
        $message = "Учётная запись на данную почту уже зарегестрирована";
    }
    else if ($password != $repassword) {
        $message = "Пароли не совпадают";
    }
    else {
        $sql = "call new_user('$login', '$username', '$password')";
        $res = $con->query($sql);
        if($res) {
            $heading = "Учётная запись создана! <p>Переход на страницу входа через <span id='counter'>5</span> секунд.</p>
														<script type='text/javascript'>
														function countdown() {
															var i = document.getElementById('counter');
															if (parseInt(i.innerHTML)<=0) {
																location.href = 'login.php';
															}
															i.innerHTML = parseInt(i.innerHTML)-1;
														}
														setInterval(function(){ countdown(); },1000);
														</script>";
        }
        else {
            $message = "ОШИБКА: " . $sql . mysqli_error($con);
        }
    }
}
include '../template/registration.tpl';
?>