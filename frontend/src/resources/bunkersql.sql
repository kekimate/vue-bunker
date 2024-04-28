-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 28. 22:12
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bunkersql`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `billdetails`
--

CREATE TABLE `billdetails` (
  `bill_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `billstatus`
--

CREATE TABLE `billstatus` (
  `bill_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `bill_address` text DEFAULT NULL,
  `bill_when` varchar(255) DEFAULT NULL,
  `bill_method` varchar(255) DEFAULT NULL,
  `bill_discount` int(11) DEFAULT NULL,
  `bill_delivery` int(11) DEFAULT NULL,
  `bill_total` int(11) DEFAULT NULL,
  `bill_paid` varchar(255) DEFAULT NULL,
  `bill_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `booktable`
--

CREATE TABLE `booktable` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_phone` varchar(255) DEFAULT NULL,
  `book_people` int(11) DEFAULT NULL,
  `book_tables` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_when` varchar(255) DEFAULT NULL,
  `book_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `cart`
--

INSERT INTO `cart` (`user_id`, `food_id`, `item_qty`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `food_star` varchar(255) DEFAULT NULL,
  `food_vote` varchar(255) DEFAULT NULL,
  `food_price` varchar(255) DEFAULT NULL,
  `food_discount` varchar(255) DEFAULT NULL,
  `food_desc` varchar(255) DEFAULT NULL,
  `food_status` varchar(255) DEFAULT NULL,
  `food_type` varchar(255) DEFAULT NULL,
  `food_category` varchar(255) DEFAULT NULL,
  `food_src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `food`
--

INSERT INTO `food` (`food_id`, `food_name`, `food_star`, `food_vote`, `food_price`, `food_discount`, `food_desc`, `food_status`, `food_type`, `food_category`, `food_src`) VALUES
(1, 'Margaréta', '4.5', '999', '2400', '0.00', 'paradicsomos alap, sajt, paradicsom karika (32cm)', 'best seller', 'meat', 'pizza', 'pizza/margareta.png'),
(2, 'Kukoricás', '4.5', '999', '2800', '0.00', 'paradicsomos alap, sajt, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/kukoricas.png'),
(3, 'Gombás', '4.5', '500', '2500', '0.00', 'paradicsomos alap, sajt, gomba (32cm)', 'best seller', 'meat', 'pizza', 'pizza/gombas.png'),
(4, 'Sonkás', '4.5', '999', '2700', '0.00', 'paradicsomos alap, sajt, sonka (32cm)', 'best seller', 'meat', 'pizza', 'pizza/sonkas.png'),
(5, 'Szalámis', '4', '500', '2800', '0.00', 'paradicsomos alap, sajt, szalámi (32cm)', 'normal', 'meat', 'pizza', 'pizza/szalamis.png'),
(6, 'Kolbászos', '4', '500', '2700', '0.00', 'paradicsomos alap, sajt, kolbász (32cm)', 'normal', 'meat', 'pizza', 'pizza/kolbaszos.png'),
(7, 'Tarjás', '4.5', '500', '3000', '0.00', 'paradicsomos alap, sajt, tarja (32cm)', 'normal', 'meat', 'pizza', 'pizza/tarjas.png'),
(8, 'Sonkás-kukoricás', '4.5', '100', '2700', '0.00', 'paradicsomos alap, sajt, sonka, kukorica (32cm)', 'normal', 'meat', 'pizza', 'pizza/sonkas-kukoricas.png'),
(9, 'Sonkás-gombás', '4.5', '600', '2800', '0.00', 'paradicsomos alap, sajt, sonka, gomba (32cm)', 'normal', 'meat', 'pizza', 'pizza/sonkas-gombas.png'),
(10, 'Gombás-kukoricás', '4.5', '999', '2500', '0.00', 'paradicsomos alap, sajt, gomba, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/gombas-kukoricas.png'),
(11, 'Songoku', '4.5', '999', '3000', '0.00', 'paradicsomos, alap, sajt, sonka, gomba, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/songoku.png'),
(12, 'Baconos', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, bacon (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/baconos.png'),
(13, 'Vegetáriánus', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, paradicsom karika, gomba, kukorica (32cm)', 'normal', 'vegan', 'pizza', 'pizza/vegetarianus.png'),
(14, 'Tojásos', '4', '400', '2550', '0.00', 'paradicsomos alap, sajt, sonka, tojás (32cm)', 'seasonal dishes', 'meat', 'pizza', 'pizza/tojasos.png'),
(15, 'Jalapennos', '4', '699', '2500', '0.00', 'paradicsomos alap, sajt, sonka, jalapenno (32cm)', 'normal', 'meat', 'pizza', 'pizza/jalapennos.png'),
(16, 'Hawaii', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, sonka, ananász (32cm)', 'normal', 'meat', 'pizza', 'pizza/hawaii.png'),
(17, 'Bunker Blast', '4.5', '999', '4000', '0.00', 'paradicsomos alap, sajt, sonka, tarja, kolbász, bacon, tojás (32cm)', 'best seller', 'meat', 'pizza', 'pizza/bunkerblast.png'),
(18, 'San Marino', '4.5', '999', '2800', '0.00', 'paradicsomos alap, sajt, paradicsom karika, szalámi (32cm)', 'normal', 'meat', 'pizza', 'pizza/sanmarino.png'),
(19, 'Falusi', '4', '999', '3200', '0.00', 'paradicsomos alap, sajt, lilahagyma, sonka, kolbász, bacon, tojás (32cm)', 'normal', 'meat', 'pizza', 'pizza/falusi.png'),
(20, 'Parasztos', '4.5', '999', '3600', '0.00', 'paradicsomos alap, sajt, tarja, lilahagyma, bacon, kolbász, jalapenno (32cm)', 'best seller', 'meat', 'pizza', 'pizza/parasztos.png'),
(21, 'Böllér', '4', '699', '3900', '0.00', 'paradicsomos alap, sajt, sonka, kolbász, bacon, szalámi (32cm)', 'best seller', 'meat', 'pizza', 'pizza/boller.png'),
(22, 'Adria', '4.5', '499', '2800', '0.00', 'paradicsomos alap, sajt, tonhal, citrom karika (32cm)', 'seasonal dishes', 'meat', 'pizza', 'pizza/adria.png'),
(23, 'Fetás', '4.5', '999', '2700', '0.00', 'paradicsomos alap, fetasajt, sonka, paradicsom karika (32cm)', 'best seller', 'meat', 'pizza', 'pizza/fetas.png'),
(24, 'Négysajtos', '4.5', '699', '3300', '0.00', 'paradicsomos alap, trapista sajt, fetasajt, modzarella, cheddar sajt, sonka (32cm)', 'best seller', 'meat', 'pizza', 'pizza/negysajtos.png'),
(25, 'Bad boy', '3.5', '699', '2900', '0.00', 'paradicsomos alap, sajt, szalámi, kukorica, lilahagyma (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/badboy.png'),
(26, 'Bad girl', '4.5', '999', '2900', '0.00', 'paradicsomos alap, sajt, grillezett csirkemell, olivabogyó (32cm)', 'best seller', 'meat', 'pizza', 'pizza/badgirl.png'),
(27, 'Olivás', '4', '200', '2700', '0.00', 'paradicsomos alap, sajt, sonka, olivabogyó (32cm)', 'normal', 'meat', 'pizza', 'pizza/olivas.png'),
(28, 'Hagymakarikás', '4', '100', '2800', '0.00', 'paradicsomos alap, sajt, sonka, hagymakarika (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/hagymakarikas.png'),
(29, 'Chicken', '3.5', '299', '2800', '0.00', 'tejfölös alap, csirkemell csíkok, brokkoli, sajt (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/chicken.png'),
(30, 'Brokkolis', '4.5', '999', '2600', '0.00', 'paradicsomos alap, sajt, sonka, brokkoli (32cm)', 'normal', 'meat', 'pizza', 'pizza/brokkolis.png'),
(31, 'Gyros tál', '4.5', '999', '2900', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita', 'best seller', 'meat', 'gyros', 'gyros/gyrostal.png'),
(32, 'Fetás gyros tál', '4.5', '500', '3100', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, feta', 'normal', 'meat', 'gyros', 'gyros/fetasgyrostal.png'),
(33, 'Sajtos gyros tál', '3', '599', '3300', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, sajt', 'normal', 'meat', 'gyros', 'gyros/sajtosgyrostal.png'),
(34, 'Fetás-olivás gyros tál', '4', '199', '3400', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, feta, olivabogyó', 'normal', 'meat', 'gyros', 'gyros/fetas-olivasgyrostal.png'),
(35, 'Jalapennos tál', '4', '299', '3000', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, jalapenno', 'normal', 'meat', 'gyros', 'gyros/jalapennostal.png'),
(36, 'Négysajtos tál', '4.5', '999', '3600', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, trapista sajt, feta, modzarella, cheddar', 'normal', 'meat', 'gyros', 'gyros/negysajtosgyrostal.png'),
(37, 'Vegetáriánus tál', '4.5', '999', '2600', '0.00', 'hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, sajt', 'normal', 'vegan', 'gyros', 'gyros/vegetarianustal.png'),
(38, 'Fitness tál', '4.5', '999', '2600', '0.00', 'gyros hús, tzatziki öntet, lilahagyma, paradicsom, saláta, pita', 'best seller', 'meat', 'gyros', 'gyros/fitnesstal.png'),
(39, 'Dupla gyros tál', '4.5', '599', '3600', '0.00', 'dupla gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita', 'new dishes', 'meat', 'gyros', 'gyros/duplagyrostal.png'),
(40, 'Olivás gyros tál', '4', '999', '3100', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, olivabogyó', 'normal', 'meat', 'gyros', 'gyros/olivasgyrostal.png'),
(41, 'Cheddar sajtos gyros tál', '3.5', '999', '3300', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, cheddar sajt', 'best seller', 'meat', 'gyros', 'gyros/cheddarsajtosgyrostal.png'),
(42, 'Gombás gyros tál', '4.5', '999', '3000', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, gomba', 'normal', 'meat', 'gyros', 'gyros/gombasgyrostal.png'),
(43, 'Kukoricás gyros tál', '4.5', '999', '3000', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, kukorica saláta', 'normal', 'meat', 'gyros', 'gyros/kukoricasgyrostal.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_birth` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_password`, `user_birth`, `user_gender`) VALUES
(1, 'Keki Mate', 'kekimate@gmail.com', '+36209124515', 'Kekimate1*', '2003-04-13', 'male');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`bill_id`,`food_id`);

--
-- A tábla indexei `billstatus`
--
ALTER TABLE `billstatus`
  ADD PRIMARY KEY (`bill_id`);

--
-- A tábla indexei `booktable`
--
ALTER TABLE `booktable`
  ADD PRIMARY KEY (`book_id`);

--
-- A tábla indexei `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`food_id`);

--
-- A tábla indexei `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `booktable`
--
ALTER TABLE `booktable`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
