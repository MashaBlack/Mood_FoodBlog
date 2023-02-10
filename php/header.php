<?php 
include("connection/connect.php");  //include connection file

?>
<!DOCTYPE html>
<html lang="rus">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Dvo Food Express</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="css/animsition.min.css" rel="stylesheet"> -->
    <link href="../css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"> </head>
    <link rel="icon" href="../images/favicon/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

    <body>
        
        <div class="site-wrapper animsition" >
            <!--header starts-->
            <header id="header" class="header-scroll top-header headrom sticky-top">
                <!-- .navbar -->
                <nav class="navbar sticky-top navbar-dark ">
                    <div class="container">
                        <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                        <a class="navbar-brand" href="../index.php"> <h4 style="color:#ffffff">MOOD        <span style="color:orange; font-size: 50%">вкусный блог</span></h4> </a>
                        <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                            <ul class="nav navbar-nav">
                            <li class="nav-item"> <a class="nav-link active" href="../index.php">Главная <span class="sr-only">(current)</span></a> </li>
                                <li class="nav-item"> <a class="nav-link active" href="../restaurants.php">Рецепты <span class="sr-only"></span></a> </li>
                                
                                <?php
                            if(empty($_SESSION["user_id"]))
                                echo '<li class="nav-item"><a href="login.php" class="nav-link active">Вход</a> </li>';
                            else
                            {
                                echo '<li class="nav-item"><a href="../your_orders.php" class="nav-link active">&#128722</a> </li>';
                                echo ')">Sign out</a> </li> <br>';
                                        //echo $_SESSION['username'];
                            }
                            ?>
                                 
                            </ul>
                        </div>
                    
                    </div>
                </nav>
                <!-- /.navbar -->
            </header>
