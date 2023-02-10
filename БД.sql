-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 20 2021 г., 11:54
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `t90463h6_cb`
--

DELIMITER $$
--
-- Процедуры
--
DROP PROCEDURE IF EXISTS `add_chosen`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `add_chosen` (IN `us_id` INT(3), IN `rec_id` INT(3))  BEGIN
INSERT INTO `user_recipe`(`user_id`, `recipe_id`)
VALUES (us_id, rec_id);
END$$

DROP PROCEDURE IF EXISTS `del_chosen`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `del_chosen` (IN `us_id` INT(3), IN `rec_id` INT(3))  BEGIN
DELETE FROM `user_recipe`
WHERE `user_id` = us_id AND `recipe_id` = rec_id;
END$$

DROP PROCEDURE IF EXISTS `find_user`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `find_user` (IN `log` VARCHAR(40), IN `pas` VARCHAR(20))  BEGIN
SELECT *
FROM `user`
WHERE `login` = log AND `password` = pas;
END$$

DROP PROCEDURE IF EXISTS `get_category`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `get_category` (IN `rec_id` INT(3))  BEGIN
SELECT `category`.`category_name`
FROM category JOIN recipe_category 
ON category.category_id = recipe_category.category_id
WHERE recipe_category.recipe_id = rec_id;
END$$

DROP PROCEDURE IF EXISTS `get_chosen`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `get_chosen` (IN `us_id` INT(3))  BEGIN
SELECT `recipe`.`recipe_id`, `recipe`.`recipe_name`,`recipe`.`image`, `recipe`.`calories`
FROM `user_recipe` JOIN `recipe`
ON `user_recipe`.`recipe_id` = `recipe`.`recipe_id`
WHERE `user_recipe`.`user_id` = us_id;
END$$

DROP PROCEDURE IF EXISTS `get_products`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `get_products` (IN `rec_id` INT(3))  BEGIN
SELECT `product`.`name`, `recipe_product`.`quantity`
FROM `product` JOIN `recipe_product`
ON `product`.`id` = `recipe_product`.`product_id`
WHERE `recipe_product`.`recipe_id` = rec_id;
END$$

DROP PROCEDURE IF EXISTS `get_recipe`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `get_recipe` (IN `rec_id` INT(3))  BEGIN
SELECT *
FROM `recipe`
WHERE `recipe_id` = rec_id;
END$$

DROP PROCEDURE IF EXISTS `is_user`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `is_user` (IN `log` VARCHAR(20))  BEGIN
SELECT `login`
FROM `user`
WHERE `login` = log;
END$$

DROP PROCEDURE IF EXISTS `new_user`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` PROCEDURE `new_user` (IN `log` VARCHAR(40), IN `name` VARCHAR(20), IN `pas` VARCHAR(20))  BEGIN
INSERT INTO `user`(`login`, `user_name`, `password`, `status`)
VALUES (log, name, pas, 'simple');
END$$

--
-- Функции
--
DROP FUNCTION IF EXISTS `get_method`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` FUNCTION `get_method` (`rec_id` INT(3)) RETURNS VARCHAR(1000) CHARSET utf8mb4 BEGIN
DECLARE method VARCHAR(1000);
SELECT `cooking_method` INTO method
FROM `recipe`
WHERE `recipe_id` = rec_id;
RETURN method;
END$$

DROP FUNCTION IF EXISTS `get_name`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` FUNCTION `get_name` (`us_id` INT(3)) RETURNS VARCHAR(20) CHARSET utf8mb4 BEGIN
DECLARE name VARCHAR(20);
SELECT `user_name` INTO name
FROM `user`
WHERE `user_id` = us_id;
RETURN name;
END$$

DROP FUNCTION IF EXISTS `get_user`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` FUNCTION `get_user` (`log` VARCHAR(40), `pas` VARCHAR(20)) RETURNS INT(3) BEGIN
DECLARE id INT;
SELECT `user_id` INTO id
FROM `user`
WHERE `login` = log AND `password` = pas;
RETURN id;
END$$

DROP FUNCTION IF EXISTS `ischosen`$$
CREATE DEFINER=`t90463h6_cb`@`localhost` FUNCTION `ischosen` (`us_id` INT(3), `rec_id` INT(3)) RETURNS INT(3) BEGIN
DECLARE c INT;
SELECT COUNT(*) INTO c
FROM `user_recipe`
WHERE `user_id` = us_id AND `recipe_id` = rec_id;
RETURN c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--
-- Создание: Май 20 2021 г., 01:57
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(3) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Десерты'),
(2, 'Мясо и птица'),
(3, 'Рыба'),
(4, 'Горячие блюда'),
(5, 'Салаты'),
(6, 'Низкокалорийные рецепты'),
(7, 'Веганские рецепты'),
(8, 'Напитки');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--
-- Создание: Май 20 2021 г., 01:57
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `calories` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `calories`) VALUES
(1, 'яйцо', 150),
(2, 'пшеничная мука', 364),
(3, 'сахар', 387),
(4, 'кокосовое масло', 862),
(5, 'оливковое масло', 884),
(6, 'сироп топинамбура', 267),
(7, 'арахисовая паста', 588),
(8, 'консервированный нут', 121),
(9, 'рисовая мука', 366),
(10, 'разрыхлитель', 79),
(11, 'овсяные хлопья', 68),
(12, 'какао-порошок', 228),
(13, 'кокосовая стружка', 520),
(14, 'вода', 0),
(15, 'кукурузный крахмал', 381),
(16, 'клубника', 33),
(17, 'яблоко', 52),
(18, 'сода', 0),
(19, 'малина', 53),
(20, 'апельсиновый сок', 45),
(21, 'апельсиновая цедра', 16),
(22, 'кабачок', 24),
(23, 'финик', 282),
(24, 'кокосовое молоко', 230),
(25, 'миндальное молоко', 17),
(26, 'агар-агар', 26),
(27, 'тростниковый сахар', 398),
(28, 'ванильный экстракт', 288),
(29, 'корица', 247),
(30, 'миндаль', 645),
(31, 'мёд', 304),
(32, 'чёрная смородина', 44),
(33, 'соль', 0),
(34, 'сливочное масло', 717),
(35, 'сыр', 354),
(36, 'ветчина', 145),
(37, 'треска', 82),
(38, 'репчатый лук', 40),
(39, 'сладкий перец', 27),
(40, 'помидоры', 24),
(41, 'зелень', 315),
(42, 'цветная капуста', 25),
(43, 'картофель', 76),
(44, 'молоко', 42),
(45, 'филе индейки', 189),
(46, 'сливки 33%', 322),
(47, 'шампиньоны', 28),
(48, 'макароны', 371),
(49, 'специи', 251),
(50, 'мускатный орех', 525),
(51, 'молотый имбирь', 335),
(52, 'кипяток', 0),
(53, 'шоколад', 550),
(54, 'сметана', 249),
(55, 'ореховая паста', 550),
(56, 'капуста', 0),
(57, 'чеснок', 1),
(58, 'кунжутная паста', 1),
(59, 'горчица', 1),
(60, 'лимонный сок', 1),
(61, 'куриные бёдра', 1),
(62, 'соевый соус', 1),
(63, 'томатная паста', 1),
(64, 'копчёная паприка', 1),
(65, 'паприка', 1),
(66, 'сухой чеснок', 1),
(67, 'куриное филе', 1),
(68, 'салат Айсберг', 1),
(69, 'сухари', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe`
--
-- Создание: Май 20 2021 г., 01:57
--

DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `recipe_id` int(3) NOT NULL,
  `recipe_name` varchar(50) NOT NULL,
  `cooking_method` varchar(1000) NOT NULL,
  `image` varchar(50) NOT NULL,
  `calories` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `recipe_name`, `cooking_method`, `image`, `calories`) VALUES
(1, 'Vegan американское печенье', 'Нут хорошо промыть.<br>\r\nВсе ингредиенты кроме шоколада взбить в блендере до однородности.<br>\r\nДобавить в тесто шоколад.<br>\r\nМокрыми руками сформировать печеньки, немного придавить. Сверху украсить оставшимся шоколадом.<br>\r\nДуховку разогреть до 180 градусов. Выпекать 20-25 минут до румяного цвета.<br>', 'american_biscuit.jpg', 330),
(2, 'Апельсиновый пирог', 'Смешать муку, соду и сахар в миске.<br>\r\nСмешать 200 мл воды, 100 мл апельсинового сока, масло и цедру.<br>\r\nСоединить все ингредиенты, вымесить влажное тесто, выпекать 30 – 35 минут при 180°С.<br>\r\nДля сиропа соединить 100 мл воды, 100 г сахара и 100 мл апельсинового сока.<br>\r\nГотовый пирог пропитать сиропом.', 'orange_pie.jpg', 244),
(3, 'Овсяное печенье', 'Овсяные хлопья немного измельчить в блендере и смешать с мукой.<br>\r\nКокосовое масло растопить, смешать с подсластителем и яйцами, взбить венчиком.<br>\r\nДобавить сухие ингредиенты и замешать тесто.<br>\r\nПорубить шоколад и добавить в тесто. <br>\r\nСкатать шарики (они должны легко скатываться в руках, если нет, добавьте немного растительного молока или воды). <br>\r\nВыпекать в разогретой духовке при 180°С 6-10 минут.', 'oatmeal_biscuit.jpg', 338),
(4, 'Клубничная галета', 'В миске смешать муку, добавляем щепотку соли и разрыхлитель.\r\nСмешать растительное масло и кипяток, вылить в мучную смесь. Замешать тесто, оно получается довольно мягкое, но не липнет к рукам. Муку больше не добавлять. Оставить отдыхать на 20 мин.\r\nДля начинки помыть клубнику и нарезать ломтиками (довольно крупными).\r\nРаскатать тесто до толщины 3 мм.\r\nВыложить на тесто клубнику и посыпать сахаром.\r\nКрая поднять, защипать. Можно смазать краешки теста растительным маслом и посыпать сахаром.\r\nВыпекать 40 мин при температуре 180°С. Полностью остудить, чтобы начинка стабилизировалась.', 'strawberry_galet.jpg', 199),
(5, 'Кабачковая запеканка', 'Кабачок натереть на крупной тёрке, посолить, отжать.\r\nСыр натереть, ветчину порезать кубиками.\r\nСмешать все ингредиенты до однородности, вылить в форму для запекания.\r\nВыпекать при 200°С 40-45 минут.\r\nДать немного остыть и достать из формы.', 'zucchini_pie.jpg', 142),
(6, 'Рубленые котлеты из трески', 'Мелко нарезать треску и лук.\r\nСмешать с яйцом, сметаной, мукой и крахмалом.\r\nДобавить специи и зелень, хорошо перемешать.\r\nОбжарить с двух сторон на масле под крышкой.\r\nВыложить на бумажное полотенце и слегка остудить перед подачей.', 'cod_cotlet.jpg', 149),
(7, 'Ароматное какао', 'Молоко с какао довести до кипения.<br>\r\nПомешивая, добавить шоколад, корицу и подержать 2 минуты.<br> \r\nНалить в кружку, добавить ореховую пасту, перемешать.', 'cacao.jpg', 77),
(8, 'Стейк из капусты', 'Капусту нарезать ломтиками толщиной 1 см.\r\nКаждый ломтик натереть чесноком и смазать оливковым маслом.\r\nЗапекать капусту около 25 мин при 200°С.\r\nДля соуса смешать в блендере кунжутную пасту, лимонный сок, горчицу, кокосовое молоко, соль и перец.\r\nГотовые стейки смазать соусом.', 'cabbage.jpg', 74),
(9, 'Цветная капуста в заливке', 'Цветную капусту помыть, разобрать на соцветия, положить в глубокую тарелку, залить водой.<br>\r\nПоставить в микроволновку на 7 мин при мощности 800Вт (можно накрыть крышкой).<br>\r\nС готовой капусты слить воду.<br>\r\nДля заливки смешать йогурт, горчицу, мелко нарубленный лук и соль.<br>\r\nЗалить горячую капусту, перемешать. Посыпать тёртым сыром и специями. Поставить в микроволновку ещё на 3 мин.<br>\r\nПодать блюдо горячим, украсив зеленью.', 'cauliflower.jpg', 56),
(10, 'Печенье кокосанка', 'Взбить яйца с сахаром.<br>\r\nДобавить кокосовую стружку, перемешать, дать постоять 5 минут.<br>\r\nВлажными руками сформировать кокосовые шарики. Можно сделать любую другую форму.<br>\r\nВыложить на противень и запекать в духовке при 180°С градусах 15-20 минут.<br>', 'cocosanka.jpg', 479),
(11, 'Куриные бёдра в соевом маринаде', 'Смешать все ингредиенты для маринада.<br>\r\nПеремешать с курицей.<br>\r\nОставить на 2 часа в холодильнике (лучше на ночь).<br>\r\nВыпекать около 30 мин при 180°С.', 'chicken_legs.jpg', 173),
(12, 'Салат Цезарь', 'Для соуса положить в кипяток яйца и держать там 1 минуту, остудить. <br>\r\nВ чаше блендера смешать пропущенный через чеснокодавку чеснок, лимонный сок, натёртый сыр (50 г), горчицу и оливковое масло.<br>\r\nСухари пропитать смесью из масла и чеснока, немного подсушить в духовке.<br>\r\nКуриное филе помыть и нарезать пополам вдоль, а затем на кусочки длиной около 10 см. Посолить и поперчить, обжарить на небольшом количестве масла с двух сторон до появления золотистого цвета, нарезать на небольшие кусочки.<br>\r\nЛистья салата нарвать руками, а помидоры нарезать на небольшие дольки, остатки сыра  нарезать на тонкие ломтики.<br>\r\nСмешать все ингредиенты.\r\n', 'cezar.jpg', 44);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_category`
--
-- Создание: Май 20 2021 г., 01:57
-- Последнее обновление: Май 20 2021 г., 01:57
--

DROP TABLE IF EXISTS `recipe_category`;
CREATE TABLE `recipe_category` (
  `recipe_id` int(3) NOT NULL,
  `category_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_category`
--

INSERT INTO `recipe_category` (`recipe_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(10, 1),
(11, 2),
(6, 3),
(5, 4),
(8, 4),
(9, 4),
(11, 4),
(12, 5),
(4, 6),
(5, 6),
(8, 6),
(9, 6),
(12, 6),
(1, 7),
(2, 7),
(4, 7),
(8, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `recipe_product`
--
-- Создание: Май 20 2021 г., 01:57
-- Последнее обновление: Май 20 2021 г., 01:57
--

DROP TABLE IF EXISTS `recipe_product`;
CREATE TABLE `recipe_product` (
  `recipe_id` int(3) NOT NULL,
  `product_id` int(3) NOT NULL,
  `quantity` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `recipe_product`
--

INSERT INTO `recipe_product` (`recipe_id`, `product_id`, `quantity`) VALUES
(1, 6, '50 г'),
(1, 7, '70 г'),
(1, 8, '260 г'),
(1, 9, '40 г'),
(1, 10, '5 г'),
(2, 2, '260 г'),
(2, 3, '300 г'),
(2, 4, '100 мл'),
(2, 14, '300 мл'),
(2, 18, '10 г'),
(2, 20, '150 мл'),
(2, 21, '100г'),
(3, 1, '2 шт'),
(3, 2, '60 г'),
(3, 4, '50 г'),
(3, 6, '50 г'),
(3, 11, '200 г'),
(3, 53, '100 г'),
(4, 2, '110 г'),
(4, 3, '30 г'),
(4, 4, '35 мл'),
(4, 10, '5 г'),
(4, 16, '200 г'),
(4, 52, '35 мл'),
(5, 1, '2 шт'),
(5, 9, '100 г'),
(5, 22, '400 г'),
(5, 35, '150 г'),
(5, 36, '180 г'),
(6, 1, '1 шт'),
(6, 2, '1 ст.л'),
(6, 37, '300 г'),
(6, 38, '0,5 шт'),
(6, 41, 'по вкусу'),
(6, 49, 'по вкусу'),
(6, 54, '2 ст.л'),
(7, 12, '2 ч.л'),
(7, 29, 'щепотка'),
(7, 44, '200 мл'),
(7, 53, '10 г'),
(7, 55, '1 ч.л'),
(8, 5, '0,5 ст.л'),
(8, 24, '3 ст.л'),
(8, 56, '1/2c качана'),
(8, 57, '1 зубчик'),
(8, 58, '2 ст.л'),
(8, 59, '1 ст.л'),
(8, 60, '0,5 ст.л'),
(9, 35, '50 г'),
(9, 38, '1/2 шт'),
(9, 41, 'по вкусу'),
(9, 42, '300 г'),
(9, 49, 'по вкусу'),
(9, 54, '100 г'),
(9, 59, '1 ч.л'),
(10, 1, '2 шт'),
(10, 3, '70 г'),
(10, 13, '120г'),
(11, 5, '1 ст.л'),
(11, 27, '1 ч.л'),
(11, 61, '700 г'),
(11, 62, '6 ст.л'),
(11, 63, '1 ст.л'),
(11, 64, '0,5 ч.л'),
(11, 65, '1 ч.л'),
(11, 66, '0,5 ч.л'),
(12, 1, '2 шт'),
(12, 5, '6 ст.л'),
(12, 35, '150 г'),
(12, 57, '4 зубчика'),
(12, 59, '2 ч.л'),
(12, 60, '3 ст.л'),
(12, 67, '400 г'),
(12, 68, '1 кочан'),
(12, 69, '150 г');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--
-- Создание: Май 20 2021 г., 02:04
-- Последнее обновление: Май 20 2021 г., 08:19
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(3) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `login`, `password`, `user_name`, `status`) VALUES
(1, 'admin', 'MYadmin10', 'Admin', 'admin'),
(2, 'user', 'user123', 'UserName', 'user'),
(3, 'user1', 'user234', 'user1', 'lokh'),
(4, 'user2', 'user345', 'user2', 'user'),
(9, 'maria.black1229@gmail.com', 'дз90', 'Мария', 'simple'),
(10, 'masha.black12@yandex.ru', 'lp90', 'Маша', 'simple'),
(13, 'berestova_tanya-28@mail.ru', 'tanya', 'tanya', 'simple'),
(14, 'michaelsam120900@gmail.com', '1234567890', 'Врушка Какашкин', 'simple'),
(15, 'ekom@yandex.ru', '123', 'elka', 'simple');

-- --------------------------------------------------------

--
-- Структура таблицы `user_recipe`
--
-- Создание: Май 20 2021 г., 01:57
-- Последнее обновление: Май 20 2021 г., 08:24
--

DROP TABLE IF EXISTS `user_recipe`;
CREATE TABLE `user_recipe` (
  `user_id` int(3) NOT NULL,
  `recipe_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_recipe`
--

INSERT INTO `user_recipe` (`user_id`, `recipe_id`) VALUES
(14, 1),
(2, 2),
(9, 2),
(13, 2),
(3, 3),
(10, 3),
(13, 3),
(9, 4),
(10, 4),
(15, 4),
(4, 6),
(9, 6),
(14, 6),
(2, 7),
(4, 7),
(2, 8),
(10, 10),
(3, 12),
(13, 12),
(15, 12);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Индексы таблицы `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `recipe_product`
--
ALTER TABLE `recipe_product`
  ADD PRIMARY KEY (`recipe_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_recipe`
--
ALTER TABLE `user_recipe`
  ADD PRIMARY KEY (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `recipe_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `recipe_category_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

--
-- Ограничения внешнего ключа таблицы `recipe_product`
--
ALTER TABLE `recipe_product`
  ADD CONSTRAINT `recipe_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `recipe_product_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

--
-- Ограничения внешнего ключа таблицы `user_recipe`
--
ALTER TABLE `user_recipe`
  ADD CONSTRAINT `user_recipe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_recipe_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
