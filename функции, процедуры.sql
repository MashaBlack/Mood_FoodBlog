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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
