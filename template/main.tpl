<?php include 'template/header.tpl'; ?>
<section class="hero bg-image" data-image-src="images/main.jpg">
    <div class="hero-inner">
        <div class="container text-center hero-text font-white">
            <h1>Готовьте с любовью... </h1>
            <h1>к себе ;)</h1>
            <div class="banner-form">
                <form class="form-inline">
                    <div class="form-group">
                        <label class="sr-only" for="exampleInputAmount">Хочу приготовить...</label>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-lg" id="exampleInputAmount" placeholder="Хочу приготовить..."> </div>
                    </div>
                    <button onclick="location.href='php/recipes.php'" type="button" class="btn btn-lg" style="color:#ffff;background-color:orange;border:none">Найти</button>
                </form>
            </div>
        </div>
    </div>
</section>
<section class="popular">
    <div class="container">
        <div class="title text-xs-center m-b-30">
            <h2>Рецепты</h2>
            <p class="lead">на любой вкус</p>
        </div>
        <div class="row">
            <?php while($r=$rec->fetch_array()) { ?>
                            <div class="col-xs-12 col-sm-6 col-md-4 food-item" data-aos="fade-up">
            <div class="food-item-wrap">
                <div class="figure-wrap bg-image" data-image-src="images/recipe/<?= $r['image'] ?>"></div>
                <div class="content">
                    <h5><a href="php/recipe.php?rec_id=<?= $r['recipe_id'] ?>"><?= $r['recipe_name'] ?></a></h5>
                    <div class="price-btn-block"> <span class="price"><?= $r['calories'] ?>ккал/100г</span></div>
                </div>

            </div>
        </div>
        <?php } ?>
    </div>
    </div>
</section>
<section class="how-it-works" data-aos="fade-up">
    <div class="container">
        <div class="text-xs-center">
            <div class="row how-it-works-solution">
                <div class="col-xs-12 col-sm-12 col-md-4 how-it-works-steps white-txt col1">
                    <div class="how-it-works-wrap">
                        <div class="step step-1">
                            <h3>Выбери рецепт</h3>
                            <p>Любой понравившийся ;)</p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 how-it-works-steps white-txt col2">
                    <div class="step step-2">
                        <h3>Следуй инструкциям</h3>
                        <p>Не отступай от рецепта!</p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 how-it-works-steps white-txt col3">
                    <div class="step step-3">
                        <h3>Наслаждайся!</h3>
                        <p>Порадуй себя и своих близких</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php include 'template/footer.tpl'; ?>