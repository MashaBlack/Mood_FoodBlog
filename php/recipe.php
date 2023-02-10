<?php session_start();
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$path = "../";
include 'config.php';
require '../phpmailer/PHPMailerAutoload.php';
$recid = $_GET['rec_id'];
$sql = "select * from recipe where recipe_id=".$recid;
$res = mysqli_query($con, $sql);
if($res) {
    $r = mysqli_fetch_array($res);
} else {
    echo "ОШИБКА: " . $sql . mysqli_error($con);
}

//$ctg = mysqli_query($con,"CALL get_category(".$recid.")");
//while($con->more_results()) $con->store_result();

//$con->store_result();
$sql1 = "CALL get_products($_GET[rec_id])";
$getpr = mysqli_query($con, $sql1);
$ingredients = "";
if($getpr) {
    while ($pr = $getpr->fetch_array()) {
        $ingredients .= $pr['name'] . " – " . $pr['quantity'] . "<br>";
    }
} else {
    echo "ОШИБКА: " . $sql1 . mysqli_error($con);
}
if(isset($_POST['save_file'])) {
    $message = "Рецепт  ". $r['recipe_name'] . ":\nИнгредиенты:\n".str_replace("<br>", "\n", $ingredients) . "\n" .
    "Способ приготовления:\n" . str_replace("<br>", "\n", $r['cooking_method']);
    $handler = fopen("../txt/recipes.txt", "w");
    fwrite($handler, $message);
    fclose($handler);
    $file = '../txt/recipes.txt';
    $filename = 'recipes.txt';
    header('Content-Type: charset=utf-8');
    //header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    //header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-Disposition: attachment; filename=\"{$filename}\"");
    header("Content-Length: " . filesize($file));
    readfile($file);
}
if(isset($_POST['send_to_email'])) {
    $message_mail = '<p>' . $_SESSION['name'] . ', лови рецепт от MOOD!</p><p><b>' . $r['recipe_name'] . '</b></p><br><p><i>Ингредиенты:</i></p><p>'.
str_replace('<br>', '</p><p>', $ingredients) . '</p><br><p><i>Способ приготовления:</i></p><p>' . str_replace('<br>', '</p><p>', $r['cooking_method']) .
'</p><br><p><b>Приятного аппетита!</b></p>';
$mail = new PHPMailer;
    $mail->isSMTP();
    $mail->Host = 'smtp.mail.ru';
    $mail->SMTPAuth = true;
    $mail->Username = 'maria.kurashkina@mail.ru';
    $mail->Password = 'Piglu9ho'; 
    $mail->SMTPSecure = 'ssl';
    $mail->Port = '465';
    $mail->CharSet = 'UTF-8';
    $mail->From = 'maria.kurashkina@mail.ru';
    $mail->FromName = 'Мария Курашкина';
    $mail->addAddress($_SESSION['login'], $_SESSION['name']); 
    $mail->isHTML(true);
    $mail->Subject = 'MOOD вкусный блог';
    $mail->Body =  $message_mail;

    $mail->send();
    /*if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'The email message was sent.';
}*/
}
include '../template/recipe.tpl';
?>