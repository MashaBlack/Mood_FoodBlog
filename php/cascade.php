<?php
if (isset($_POST['add'.$r['recipe_id']])) {
    $sql = "call add_chosen(" . $_SESSION['user_id']. ", " .$r['recipe_id'] . ")";
}
if (isset($_POST['delete'.$r['recipe_id']])) {
    $sql = "call del_chosen(" . $_SESSION['user_id']. ", " .$r['recipe_id'] . ")";
}

if (isset($_POST['delete'.$r['recipe_id']]) || isset($_POST['add'.$r['recipe_id']])) {
    while($con->more_results()) $con->store_result();
    $res = mysqli_query($con, $sql);;
    if(!$res) {
        echo "ОШИБКА: " . $sql . mysqli_error($con);
    }
}
?>