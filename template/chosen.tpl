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
        <h1><?= $_SESSION['name'] ?>, ваши сохранённые рецепты</h1>
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-9">
                <div class="bg-gray restaurant-entry">
                    <div class="row">
                            <?php while($r=$rec->fetch_array()) { ?>
                            <form action="" method="post">
                            <div class="col-sm-12 col-md-12 col-lg-8 text-xs-center text-sm-left">
                                <div class="entry-logo">
                                    <a class="img-fluid" href="recipe.php?rec_id=<?= $r['recipe_id'] ?>" > <img src="../images/recipe/<?= $r['image'] ?>" alt="Food logo"></a>
                                </div>
                                <div class="entry-dscr">
                                    <h5><a href="recipe.php?rec_id=<?= $r['recipe_id'] ?>"><?= $r['recipe_name'] ?></a></h5> <span><?= $r['calories'] ?>ккал/100г</span>
                                </div>
                            </div>
                        </form>
                            <?//php include 'cascade.php';
                            //if (isset($_POST['delete'.$r['recipe_id']])) {
                             //header('Location: chosen.php'); } 
                             } ?>
                    </div>
                </div>
            </div>
        </div>
</section>
</div>
<?php include '../template/footer.tpl'; ?>