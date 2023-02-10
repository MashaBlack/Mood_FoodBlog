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
        <h2>Вход</h2>
        <span style="color:red;"><?= $message; ?></span>
        <form action="" method="post">
            <input type="text" placeholder="Логин/почта"  name="login"/>
            <input type="password" placeholder="Пароль" name="password"/>
            <input type="submit" id="buttn" name="submit" value="Вход" />
            <div class="cta"><a href="../index.php" style="color:#f30;">На главную</a></div>
        </form>
    </div>
    <div class="cta">Впервые здесь? <a href="registration.php" style="color:#f30;">Создать аккаунт</a></div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>
