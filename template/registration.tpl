<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="../css/login.css">
    <style type="text/css">
        #buttn{
            color:#fff;
            background-color: #ff3300;
        }
    </style>
</head>
<body>
<div class="pen-title">
    <h3><?= $heading ?></h3>
</div>
<div class="module form-module">
    <div class="toggle">
    </div>
    <div class="form">
        <h2>Регистрация</h2>
        <span style="color:red;"><?= $message; ?></span>
        <form action="" method="post">
            <input type="text" placeholder="Email"  name="login"/>
            <input type="text" placeholder="Имя"  name="username"/>
            <input type="password" placeholder="Пароль" name="password"/>
            <input type="password" placeholder="Повторите пароль" name="repassword"/>
            <input type="submit" id="buttn" name="submit" value="Регистрация" />
            <div class="cta"><a href="../index.php" style="color:#f30;">На главную</a></div>
        </form>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>