<span style="color:red;"><?= $message; ?></span><br><br>
<form action="" method="post">
    <div class="container">
    <select class="form-control" name="suser">
        <option disabled selected>Выберите пользователя</option>
        <?php while($r=$res->fetch_array()) { ?>
        <option value="<?= $r['user_id'] ?>"><?= $r['login'] ?></option>
        <?php } ?>
    </select><br><br>
    </div>
    <div class="container">
    <label class="control-label">Статус</label>
        <input type="radio" class="form" name="stat" value="simple">Обычный</input><br><br>
        <input type="radio" class="form" name="stat" value="lokh">Лох</input>
    </div>
   <br><br>
    <div class="container">
        <input type="submit" class="btn" name="edit" value="Изменить статус" />
        <input type="submit" class="btn" name="del" value="Удалить пользователя" />
    </div>

</form>