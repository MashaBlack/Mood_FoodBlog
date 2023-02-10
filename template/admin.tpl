<!DOCTYPE html>
<html lang="ru" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>
    <link href="<?= $path ?>css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= $path ?>css/style.css" rel="stylesheet">
</head>

<body>
<header>
    <form action='' method='post'>
    <div class="container">
        <h2 class="navbar-brand">Администратор</h2>
        <div class="collapse navbar-toggleable-md  float-lg-right">
        <input type="submit" name="logout" class="btn" value="Выход"></div>
    </div>
    <div class="text-xs-center">
            <input type="submit" name="table" class="btn-outline-primary" value="Таблица">
            <input type="submit" name="graph" class="btn-outline-primary" value="Диаграмма">
            <input type="submit" name="users" class="btn-outline-primary" value="Пользователи">
    </div><br>
    </form>
</header>
    <div class="container" style="width: 50%" >
            <div class="card card-outline-primary">
                <div class="card-header">
                    <h4 class="m-b-0 text-dark"><?= $heading ?></h4>
                </div>
                <div class="card-body">
                        <div class="form-body">
                            <?php include $choose; ?>
                            <hr>
                            </div>
            </div>
    </div>
</body>
<script src="js/tablesort.js"></script>
</html>