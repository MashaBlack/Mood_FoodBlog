<?php include '../template/header.tpl'; ?>
<div class="page-wrapper">
    <div class="top-links">
        <div class="container">
            <ul class="row links">
                <li class="col-xs-12 col-sm-4"><span>1</span>Выбери рецепт</li>
                <li class="col-xs-12 col-sm-4"><span>2</span>Следуй инструкциям</li>
                <li class="col-xs-12 col-sm-4"><span>3</span>Наслаждайся!</li>
            </ul>
        </div>
    </div>
    <section class="inner-page-hero bg-image" data-image-src="../images/recipe/<?= $r['image'] ?>">
        <div class="profile">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12  col-md-4 col-lg-4 profile-img">
                        <div class="image-wrap">
                            <figure><img src="../images/recipe/<?= $r['image'] ?>" alt="Restaurant logo"></figure>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 profile-desc">
                        <div class="pull-left right-text white-txt">
                            <h1><?= $r['recipe_name'] ?></h1>
                        </div>
                        <?php  if(!empty($_SESSION["user_id"]) && $_SESSION["status"] != "lokh") { ?>
                        <form action="" method="post">
                        <div class="pull-left right-text white-txt">
                            <input class="btn theme-btn-dash" type="submit" id="buttn" name="send_to_email" value="Отправить на почту" />
                        </div>
                        <div class="pull-left right-text white-txt">
                            <input class="btn theme-btn-dash" type="submit" id="buttn" name="save_file" value="Сохранить в файл" />
                        </div>
                        </form>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="restaurants-page">
        <div class="container m-t-30">
            <div class="row">

                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-9">
                    <div class="bg-gray restaurant-entry">
                        <div class="row">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                <div class="menu-widget" id="2">
                                    <div class="widget-heading">
                                        <h3 class="widget-title text-dark">Ингредиенты <a class="btn btn-link pull-right" data-toggle="collapse" href="#popular2" aria-expanded="true">
                                                <i class="fa fa-angle-right pull-right"></i>
                                                <i class="fa fa-angle-down pull-right"></i>
                                            </a>
                                        </h3>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="collapse in" id="popular2">
                                        <div class="food-item">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-lg-8">
                                                        <p><?= $ingredients ?></p>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                <div class="widget clearfix">
                                    <div class="widget-heading">
                                        <h3 class="widget-title text-dark">Способ приготовления</h3>
                                        <div class="clearfix"></div>
                                    </div>
                                        <div class="food-item">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-lg-8" style="margin-left: 20px; margin-top: 5px">
                                                        <p><?= $r['cooking_method'] ?></p>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>
<?php include '../template/footer.tpl';?>