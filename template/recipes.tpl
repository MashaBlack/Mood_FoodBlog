<?php include '../template/header.tpl'; ?>
<div class="page-wrapper" >
    <!-- top Links -->
    <div class="top-links">
        <div class="container">
            <ul class="row links">
                <li class="col-xs-12 col-sm-4"><span>1</span>Выбери рецепт</li>
                <li class="col-xs-12 col-sm-4"><span>2</span>Следуй инструкциям</li>
                <li class="col-xs-12 col-sm-4"><span>3</span>Наслаждайся!</li>
            </ul>
        </div>
    </div>
    <div class="inner-page-hero bg-image" data-image-src="../images/recipes_page.jpg"></div></div
    <section class="restaurants-page">
        <div class="container m-t-30">
            <div class="row">
                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3">
                    <div class="widget clearfix">
                        <div class="widget-heading">
                            <h3 class="widget-title text-dark">Категории</h3>
                            <div class="clearfix"></div>
                        </div>
                        <div class="widget-body">
                            <ul class="tags">
                                <li> <a href="#" class="tag">Все</a></li>
                                <?php
                                while($r=mysqli_fetch_array($ctg)) { ?>
                                <li> <a href="#" class="tag"><?= $r['category_name'] ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-9">
                    <div class="bg-gray restaurant-entry">
                        <div class="row">
                            <form action="" method="post">
                            <?php while($r=$rec->fetch_array()) { ?>
							<div class="col-sm-12 col-md-12 col-lg-8 text-xs-center text-sm-left">
                                <div class="entry-logo">
                                    <a class="img-fluid" href="recipe.php?rec_id=<?= $r['recipe_id'] ?>" > <img src="../images/recipe/<?= $r['image'] ?>" alt="Food logo"></a>
                                </div>
                                <div class="entry-dscr">
                                    <h5><a href="recipe.php?rec_id=<?= $r['recipe_id'] ?>"><?= $r['recipe_name'] ?></a></h5> <span><?= $r['calories'] ?>ккал/100г</span>
                            </div>
                            </div>
                            <?php if(!empty($_SESSION["user_id"])) {
                            include 'cascade.php';
                            $us = $_SESSION['user_id']; $resid = $r['recipe_id'];
                              $sql = "SELECT ischosen($us, $resid) as 're'";
                               //while($con->more_results()) $con->store_result();
                                $chos = $con->query($sql);
                               $ischos = $chos->fetch_array();
                                if ($ischos['re'] > 0) {
                                $btname = 'delete' . $r['recipe_id']; $btnval = 'Удалить'; }
                                else {
                                $btname = 'add' . $r['recipe_id']; $btnval = 'Добавить'; } ?>
                                <div class="col-sm-12 col-md-12 col-lg-4 text-xs-center">
                                    <div class="right-content bg-white">
                                        <div class="right-review">
                                            <input class="btn theme-btn-dash" href="recipes.php" type="submit" id="buttn" name="<?= $btname ?>" value="<?= $btnval ?>" />
                                        </div>
                                    </div>
                                </div>
                        <?php
                               } } ?>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<?php include '../template/footer.tpl'; ?>