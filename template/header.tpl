<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mood</title>
    <link href="<?= $path ?>css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= $path ?>css/font-awesome.min.css" rel="stylesheet">
    <link href="<?= $path ?>css/animate.css" rel="stylesheet">
    <link href="<?= $path ?>css/style.css" rel="stylesheet"> </head>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<body>
<div class="site-wrapper animsition" >
    <header id="header" class="header-scroll top-header headrom sticky-top">
        <nav class="navbar sticky-top navbar-dark ">
            <div class="container">
                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                <a class="navbar-brand" href="<?= $path ?>index.php"> <h4 style="color:#ffffff">MOOD        <span style="color:orange; font-size: 50%">вкусный блог</span></h4> </a>
                <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                    <ul class="nav navbar-nav">
                        <li class="nav-item"> <a class="nav-link active" href="<?= $path ?>index.php">Главная <span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link active" href="<?= $path ?>php/recipes.php">Рецепты <span class="sr-only"></span></a> </li>
                        <?php if(empty($_SESSION["user_id"])) { ?>
                        <li class="nav-item"><a href="<?= $path ?>php/login.php" class="nav-link active">Вход</a> </li>
                        <?php } elseif ($_SESSION["user_id"] == 1) { ?>
                        <li class="nav-item"><a href="<?= $path ?>php/edit_users.php" class="nav-link active">Пользователи</a> </li>
                        <li class="nav-item"><a href="<?= $path ?>php/logout.php" class="nav-link active" onclick="return confirm('Вы уверены?\')">Выход</a> </li> <br>
                        <?php } else { ?>
                        <li class="nav-item"><a href="<?= $path ?>php/chosen.php" class="nav-link active">Сохранённые</a> </li>
                        <li class="nav-item"><a href="<?= $path ?>php/logout.php" class="nav-link active" onclick="return confirm('Вы уверены?\')">Выход</a> </li> <br>
                        <?php }  ?>
                    </ul>
                </div>
            </div>
        </nav>
    </header>