<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$path = "";
include 'php/config.php';
$sql = "SELECT recipe.recipe_name AS 'recipe', COUNT(user_recipe.user_id) AS 'count' FROM recipe JOIN user_recipe ON recipe.recipe_id = user_recipe.recipe_id GROUP BY user_recipe.recipe_id";
$query = $con->query($sql);
$arr = [];
while($r = $query->fetch_array()) {
    $arr[$r['recipe']] = $r['count'];
}

if (isset($_POST['table'])) {
    $choose = 'template/table.tpl';
    $heading = "Распределение сохранённых рецептов";
} elseif (isset($_POST['graph'])) {
    $choose = 'template/diagram.tpl';
    $heading = "Круговая диаграмма";
} else {
    $choose = 'template/edit.tpl';
    $heading = "Редактирование пользователей";
}
if (isset($_POST['logout'])) {
    session_destroy();
    header('Location: index.php');
}
$message = "";
$sql1 = "select * from user WHERE user_id != 1";
$res = $con->query($sql1);
if(!$res) {
    $message = "Пользователи не найдены";
}
if (isset($_POST['edit'])) {
    $con->query("UPDATE user SET status = " .$_POST['stat'] . " WHERE user_id = " . $_POST['suser']);
    $message = "Статус изменён";
}
if (isset($_POST['del'])) {
    $con->query("DELETE FROM user WHERE user_id = " . $_POST['suser']);
    $message = "Пользователь удалён";
}
include 'template/admin.tpl';
?>