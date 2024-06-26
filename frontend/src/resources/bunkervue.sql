-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 01. 12:04
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
-- Adatbázis: `bunkervue`
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

--
-- A tábla adatainak kiíratása `billdetails`
--

INSERT INTO `billdetails` (`bill_id`, `food_id`, `item_qty`) VALUES
(1, 1, 1),
(1, 81, 1),
(2, 32, 1),
(2, 45, 1),
(3, 28, 1),
(3, 44, 1),
(3, 94, 1),
(4, 2, 1);

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

--
-- A tábla adatainak kiíratása `billstatus`
--

INSERT INTO `billstatus` (`bill_id`, `user_id`, `bill_phone`, `bill_address`, `bill_when`, `bill_method`, `bill_discount`, `bill_delivery`, `bill_total`, `bill_paid`, `bill_status`) VALUES
(1, 1, '+36209124515', 'Szeged, Retek utca 10', '2024-05-01T11:34', 'cash', 0, 15, 3715, 'false', 1),
(2, 2, '+36209124515', 'Szeged, Fecske utca 4', '2024-05-01T11:39', 'cash', 0, 15, 5615, 'false', 1),
(3, 3, '+36209124515', 'Szeged, Rigó utca 12', '2024-05-01T11:51', 'cash', 0, 15, 5615, 'false', 1),
(4, 3, '+36209124515', 'Szeged, Hajó utca 2', '2024-05-01T12:03', 'card', 0, 15, 2815, 'true', 1);

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

--
-- A tábla adatainak kiíratása `booktable`
--

INSERT INTO `booktable` (`book_id`, `book_name`, `book_phone`, `book_people`, `book_tables`, `user_id`, `book_when`, `book_note`) VALUES
(1, 'Kéki Máté', '36209124515', 2, 1, NULL, '2024-06-30T18:00', ''),
(2, 'Miskolczi Nándor', '36209124515', 5, 2, NULL, '2024-06-22T19:30', '');

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
(1, 71, 1),
(2, 4, 1),
(2, 132, 1),
(3, 66, 1);

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
(1, 'Margaréta pizza', '4.5', '999', '2400', '0.00', 'paradicsomos alap, sajt, paradicsom karika (32cm)', 'best seller', 'meat', 'pizza', 'pizza/margareta.png'),
(2, 'Kukoricás pizza', '4.5', '999', '2800', '0.00', 'paradicsomos alap, sajt, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/kukoricas.png'),
(3, 'Gombás pizza', '4.5', '500', '2500', '0.00', 'paradicsomos alap, sajt, gomba (32cm)', 'best seller', 'meat', 'pizza', 'pizza/gombas.png'),
(4, 'Sonkás pizza', '4.5', '999', '2700', '0.00', 'paradicsomos alap, sajt, sonka (32cm)', 'best seller', 'meat', 'pizza', 'pizza/sonkas.png'),
(5, 'Szalámis pizza', '4', '500', '2800', '0.00', 'paradicsomos alap, sajt, szalámi (32cm)', 'normal', 'meat', 'pizza', 'pizza/szalamis.png'),
(6, 'Kolbászos pizza', '4', '500', '2700', '0.00', 'paradicsomos alap, sajt, kolbász (32cm)', 'normal', 'meat', 'pizza', 'pizza/kolbaszos.png'),
(7, 'Tarjás pizza', '4.5', '500', '3000', '0.00', 'paradicsomos alap, sajt, tarja (32cm)', 'normal', 'meat', 'pizza', 'pizza/tarjas.png'),
(8, 'Sonkás-kukoricás pizza', '4.5', '100', '2700', '0.00', 'paradicsomos alap, sajt, sonka, kukorica (32cm)', 'normal', 'meat', 'pizza', 'pizza/sonkas-kukoricas.png'),
(9, 'Sonkás-gombás pizza', '4.5', '600', '2800', '0.00', 'paradicsomos alap, sajt, sonka, gomba (32cm)', 'normal', 'meat', 'pizza', 'pizza/sonkas-gombas.png'),
(10, 'Gombás-kukoricás pizza', '4.5', '999', '2500', '0.00', 'paradicsomos alap, sajt, gomba, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/gombas-kukoricas.png'),
(11, 'Songoku pizza', '4.5', '999', '3000', '0.00', 'paradicsomos, alap, sajt, sonka, gomba, kukorica (32cm)', 'best seller', 'meat', 'pizza', 'pizza/songoku.png'),
(12, 'Baconos pizza', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, bacon (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/baconos.png'),
(13, 'Vegetáriánus pizza', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, paradicsom karika, gomba, kukorica (32cm)', 'normal', 'vegan', 'pizza', 'pizza/vegetarianus.png'),
(14, 'Tojásos pizza', '4', '400', '2550', '0.00', 'paradicsomos alap, sajt, sonka, tojás (32cm)', 'seasonal dishes', 'meat', 'pizza', 'pizza/tojasos.png'),
(15, 'Jalapennos pizza', '4', '699', '2500', '0.00', 'paradicsomos alap, sajt, sonka, jalapenno (32cm)', 'normal', 'meat', 'pizza', 'pizza/jalapennos.png'),
(16, 'Hawaii pizza', '4.5', '999', '2650', '0.00', 'paradicsomos alap, sajt, sonka, ananász (32cm)', 'normal', 'meat', 'pizza', 'pizza/hawaii.png'),
(17, 'Bunker Blast pizza', '4.5', '999', '4000', '0.00', 'paradicsomos alap, sajt, sonka, tarja, kolbász, bacon, tojás (32cm)', 'best seller', 'meat', 'pizza', 'pizza/bunkerblast.png'),
(18, 'San Marino pizza', '4.5', '999', '2800', '0.00', 'paradicsomos alap, sajt, paradicsom karika, szalámi (32cm)', 'normal', 'meat', 'pizza', 'pizza/sanmarino.png'),
(19, 'Falusi pizza', '4', '999', '3200', '0.00', 'paradicsomos alap, sajt, lilahagyma, sonka, kolbász, bacon, tojás (32cm)', 'normal', 'meat', 'pizza', 'pizza/falusi.png'),
(20, 'Parasztos pizza', '4.5', '999', '3600', '0.00', 'paradicsomos alap, sajt, tarja, lilahagyma, bacon, kolbász, jalapenno (32cm)', 'best seller', 'meat', 'pizza', 'pizza/parasztos.png'),
(21, 'Böllér pizza', '4', '699', '3900', '0.00', 'paradicsomos alap, sajt, sonka, kolbász, bacon, szalámi (32cm)', 'best seller', 'meat', 'pizza', 'pizza/boller.png'),
(22, 'Adria pizza', '4.5', '499', '2800', '0.00', 'paradicsomos alap, sajt, tonhal, citrom karika (32cm)', 'seasonal dishes', 'meat', 'pizza', 'pizza/adria.png'),
(23, 'Fetás pizza', '4.5', '999', '2700', '0.00', 'paradicsomos alap, fetasajt, sonka, paradicsom karika (32cm)', 'best seller', 'meat', 'pizza', 'pizza/fetas.png'),
(24, 'Négysajtos pizza', '4.5', '699', '3300', '0.00', 'paradicsomos alap, trapista sajt, fetasajt, modzarella, cheddar sajt, sonka (32cm)', 'best seller', 'meat', 'pizza', 'pizza/negysajtos.png'),
(25, 'Bad boy pizza', '3.5', '699', '2900', '0.00', 'paradicsomos alap, sajt, szalámi, kukorica, lilahagyma (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/badboy.png'),
(26, 'Bad girl pizza', '4.5', '999', '2900', '0.00', 'paradicsomos alap, sajt, grillezett csirkemell, olivabogyó (32cm)', 'best seller', 'meat', 'pizza', 'pizza/badgirl.png'),
(27, 'Olivás pizza', '4', '200', '2700', '0.00', 'paradicsomos alap, sajt, sonka, olivabogyó (32cm)', 'normal', 'meat', 'pizza', 'pizza/olivas.png'),
(28, 'Hagymakarikás pizza', '4', '100', '2800', '0.00', 'paradicsomos alap, sajt, sonka, hagymakarika (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/hagymakarikas.png'),
(29, 'Chicken pizza', '3.5', '299', '2800', '0.00', 'tejfölös alap, csirkemell csíkok, brokkoli, sajt (32cm)', 'new dishes', 'meat', 'pizza', 'pizza/chicken.png'),
(30, 'Brokkolis pizza', '4.5', '999', '2600', '0.00', 'paradicsomos alap, sajt, sonka, brokkoli (32cm)', 'normal', 'meat', 'pizza', 'pizza/brokkolis.png'),
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
(43, 'Kukoricás gyros tál', '4.5', '999', '3000', '0.00', 'gyros hús, hasáb, tzatziki öntet, lilahagyma, paradicsom, saláta, pita, kukorica saláta', 'normal', 'meat', 'gyros', 'gyros/kukoricasgyrostal.png'),
(44, 'Classic hamburger', '4.5', '999', '2300', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma', 'normal', 'meat', 'hamburger', 'hamburger/classichamburger.png'),
(45, 'Csirkés hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, bacon', 'normal', 'meat', 'hamburger', 'hamburger/csirkeshamburger.png'),
(46, 'Baconos hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, sajt', 'normal', 'meat', 'hamburger', 'hamburger/baconoshamburger.png'),
(47, 'Sajtos hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, sajt', 'normal', 'meat', 'hamburger', 'hamburger/sajtoshamburger.png'),
(48, 'Gombás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, gomba', 'normal', 'meat', 'hamburger', 'hamburger/gombashamburger.png'),
(49, 'Kukoricás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, kukorica saláta', 'normal', 'meat', 'hamburger', 'hamburger/kukoricashamburger.png'),
(50, 'Dupla hamburger', '4.5', '999', '2800', '0.00', 'buci, dupla húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma', 'normal', 'meat', 'hamburger', 'hamburger/duplahamburger.png'),
(51, 'Bunker blast hamburger', '4.5', '999', '3100', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, bacon, tükörtojás, sajt', 'best seller', 'meat', 'hamburger', 'hamburger/bunkerblasthamburger.png'),
(52, 'Taco hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, csemegeuborka, pirított hagyma, sajt', 'best seller', 'meat', 'hamburger', 'hamburger/tacohamburger.png'),
(53, 'Dupla sajtos hamburger', '4.5', '999', '2600', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, dupla sajt', 'best seller', 'meat', 'hamburger', 'hamburger/duplasajtoshamburger.png'),
(54, 'Vegetáriánus hamburger', '3.5', '999', '2500', '0.00', 'buci, sajt, koktélszósz, saláta, paradicsom, uborka, lilahagyma, kukorica saláta, uborka', 'normal', 'vegan', 'hamburger', 'hamburger/vegetarianushamburger.png'),
(55, 'Jalapennos hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, jalapenno', 'normal', 'meat', 'hamburger', 'hamburger/jalapennoshamburger.png'),
(56, 'Hawaii hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, ananász', 'seasonal dishes', 'meat', 'hamburger', 'hamburger/hawaiihamburger.png'),
(57, 'Tarjás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, tarja', 'best seller', 'meat', 'hamburger', 'hamburger/tarjashamburger.png'),
(58, 'Tojásos hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, tükörtojás', 'normal', 'meat', 'hamburger', 'hamburger/tojasoshamburger.png'),
(59, 'Szalámis hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, szalámi', 'normal', 'meat', 'hamburger', 'hamburger/szalamishamburger.png'),
(60, 'Gombás-kukoricás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, gomba, kukorica saláta', 'normal', 'meat', 'hamburger', 'hamburger/gombas-kukoricashamburger.png'),
(61, 'Sajtos-gombás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, sajt, gomba', 'normal', 'meat', 'hamburger', 'hamburger/sajtos-gombashamburger.png'),
(62, 'Sajtos-kukoricás hamburger', '4.5', '999', '2600', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, sajt, kukorica', 'normal', 'meat', 'hamburger', 'hamburger/sajtos-kukoricashamburger.png'),
(63, 'Olivás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, olivabogyó', 'normal', 'meat', 'hamburger', 'hamburger/olivashamburger.png'),
(64, 'Hagymakarikás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, hagymakarika', 'normal', 'meat', 'hamburger', 'hamburger/hagymakarikashamburger.png'),
(65, 'Cheddar sajtos hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, cheddar sajt', 'normal', 'meat', 'hamburger', 'hamburger/cheddarsajtoshamburger.png'),
(66, 'Négysajtos hamburger', '4.5', '999', '3200', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, trapista sajt, modzarella, feta, cheddar sajt', 'best seller', 'meat', 'hamburger', 'hamburger/negysajtoshamburger.png'),
(67, 'Görög hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, tzatziki alap, saláta, paradicsom, uborka, lilahagyma, feta, olivabogyó', 'normal', 'meat', 'hamburger', 'hamburger/goroghamburger.png'),
(68, 'Fetás hamburger', '4.5', '999', '2500', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, feta', 'normal', 'meat', 'hamburger', 'hamburger/fetashamburger.png'),
(69, 'Magyaros hamburger', '4.5', '999', '2800', '0.00', 'buci, húspogácsa, koktélszósz, saláta, paradicsom, uborka, lilahagyma, bacon, kolbász, tojás', 'normal', 'meat', 'hamburger', 'hamburger/magyaroshamburger.png'),
(70, 'Csirkés tortilla', '4.5', '999', '2200', '0.00', 'tortilla lap, gyros hús, hasáb, lilahagyma, paradicsom, saláta, tzatziki öntet', 'best seller', 'meat', 'tortilla', 'tortilla/csirkes.png'),
(71, 'Fetás tortilla', '4.5', '999', '2200', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, feta', 'normal', 'meat', 'tortilla', 'tortilla/fetas.png'),
(72, 'Sajtos tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, sajt', 'normal', 'meat', 'tortilla', 'tortilla/sajtos.png'),
(73, 'Olivás tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, olivabogyó', 'normal', 'meat', 'tortilla', 'tortilla/olivas.png'),
(74, 'Jalapennos tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, jalapenno', 'normal', 'meat', 'tortilla', 'tortilla/jalapennos.png'),
(75, 'Fetás-olivás tortilla', '4.5', '999', '2500', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, feta, olivabogyó', 'normal', 'meat', 'tortilla', 'tortilla/fetas-olivas.png'),
(76, 'Vegetáriánus tortilla', '4.5', '999', '2350', '0.00', 'tortilla, hasáb, saláta, paradicsom, lilahagyma, tzatziki, sajt', 'normal', 'vegan', 'tortilla', 'tortilla/vegetarianus.png'),
(77, 'Kukoricás tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, kukorica', 'normal', 'meat', 'tortilla', 'tortilla/kukoricas.png'),
(78, 'Gombás tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, hasáb, saláta, paradicsom, lilahagyma, tzatziki, gomba', 'normal', 'meat', 'tortilla', 'tortilla/gombas.png'),
(79, 'Fitness tortilla', '4.5', '999', '2350', '0.00', 'tortilla, gyros hús, saláta, paradicsom, lilahagyma, tzatziki', 'normal', 'meat', 'tortilla', 'tortilla/fitness.png'),
(80, 'Mogyorókrémes palacsinta', '4.5', '999', '1100', '0.00', 'palacsinta, mogyorókrém, csoki öntet, földimogyoró (34cm)', 'best seller', 'vegan', 'desszert', 'desszert/mogyorokremes.png'),
(81, 'Mogyorókrémes-banános palacsinta', '4.5', '999', '1300', '0.00', 'palacsinta, mogyorókrém, banán, csoki öntet, földimogyoró (34cm)', 'normal', 'vegan', 'desszert', 'desszert/mogyorokremes-bananos.png'),
(82, 'Oreo palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, oreo (34cm)', 'normal', 'vegan', 'desszert', 'desszert/oreo.png'),
(83, 'Duplo palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, földimogyoró, csoki öntet, duplo (34cm)', 'normal', 'vegan', 'desszert', 'desszert/duplo.png'),
(84, 'KitKat palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, KitKat (34cm)', 'normal', 'vegan', 'desszert', 'desszert/kitkat.png'),
(85, 'M&Ms palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, M&Ms (34cm)', 'normal', 'vegan', 'desszert', 'desszert/m&ms.png'),
(86, 'Snickers palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, Snickers (34cm)', 'normal', 'vegan', 'desszert', 'desszert/snickers.png'),
(87, 'Twix palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, Twix (34cm)', 'normal', 'vegan', 'desszert', 'desszert/twix.png'),
(88, 'Twix palacsinta', '4.5', '999', '1800', '0.00', 'palacsinta, mogyorókrém, csoki öntet, Kinder Maxi King (34cm)', 'normal', 'vegan', 'desszert', 'desszert/kindermaxiking.png'),
(89, 'Gesztenyepüré', '4.5', '999', '1500', '0.00', '', 'normal', 'vegan', 'desszert', 'desszert/gesztenyepure.png'),
(90, 'Coca-Cola', '4.5', '999', '500', '0.00', '190/dl', 'best seller', 'vegan', 'ital', 'ital/coca-cola.png'),
(91, 'Coca-Cola Zero', '4.5', '999', '500', '0.00', '190/dl', 'normal', 'vegan', 'ital', 'ital/cola-zero.png'),
(92, 'Fanta', '4.5', '999', '500', '0.00', '190/dl', 'normal', 'vegan', 'ital', 'ital/fanta.png'),
(93, 'Kinley Gyömbér', '4.5', '999', '500', '0.00', '190/dl', 'normal', 'vegan', 'ital', 'ital/kinleygyomber.png'),
(94, 'Kinley Tonic', '4.5', '999', '500', '0.00', '190/dl', 'normal', 'vegan', 'ital', 'ital/kinleytonic.png'),
(95, 'Sprite', '4.5', '999', '190', '0.00', '', 'normal', 'vegan', 'ital', 'ital/sprite.png'),
(96, 'Naturaqua szénsavas/ mentes', '4.5', '999', '400', '0.00', '', 'normal', 'vegan', 'ital', 'ital/naturaqua.png'),
(97, 'Xixo Citrom', '4.5', '999', '400', '0.00', '', 'best seller', 'vegan', 'ital', 'ital/xixocitrom.png'),
(98, 'Xixo Eper', '4.5', '999', '400', '0.00', '', 'normal', 'vegan', 'ital', 'ital/xixoeper.png'),
(99, 'Xixo Korte', '4.5', '999', '350', '0.00', '', 'normal', 'vegan', 'ital', 'ital/xixokorte.png'),
(100, 'Xixo Málna-Áfonya', '4.5', '999', '350', '0.00', '', 'normal', 'vegan', 'ital', 'ital/xixomalna-afonya.png'),
(101, 'Xixo Mojito', '4.5', '999', '350', '0.00', '', 'seasonal dishes', 'vegan', 'ital', 'ital/xixomojito.png'),
(102, 'Xixo Őszibarack', '4.5', '999', '350', '0.00', '', 'best seller', 'vegan', 'ital', 'ital/xixooszibarack.png'),
(103, 'Xixo Tutti Fruity', '4.5', '999', '350', '0.00', '', 'best seller', 'vegan', 'ital', 'ital/xixotuttifruity.png'),
(104, 'Cappy Alma', '4.5', '999', '600', '0.00', '', 'normal', 'vegan', 'ital', 'ital/cappyalma.png'),
(105, 'Cappy Ananász', '4.5', '999', '600', '0.00', '', 'normal', 'vegan', 'ital', 'ital/cappyananasz.png'),
(106, 'Cappy Eper', '4.5', '999', '600', '0.00', '', 'normal', 'vegan', 'ital', 'ital/cappyeper.png'),
(107, 'Cappy Körte', '4.5', '999', '600', '0.00', '', 'normal', 'vegan', 'ital', 'ital/cappykorte.png'),
(108, 'Cappy Őszibarack', '4.5', '999', '600', '0.00', '', 'normal', 'vegan', 'ital', 'ital/cappyoszibarack.png'),
(109, 'Sió Alma', '4.5', '999', '260/dl', '0.00', '', 'normal', 'vegan', 'ital', 'ital/sioalma.png'),
(110, 'Sió Lime', '4.5', '999', '260/dl', '0.00', '', 'normal', 'vegan', 'ital', 'ital/siolime.png'),
(111, 'Sió Narancs', '4.5', '999', '260/dl', '0.00', '', 'normal', 'vegan', 'ital', 'ital/sionarancs.png'),
(112, 'Sió Szőlő', '4.5', '999', '260/dl', '0.00', '', 'normal', 'vegan', 'ital', 'ital/sioszolo.png'),
(113, 'Sió Barack', '4.5', '999', '260/dl', '0.00', '', 'normal', 'vegan', 'ital', 'ital/siobarack.png'),
(114, 'Hell Classic', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellclassic.png'),
(115, 'Hell Zero', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellzero.png'),
(116, 'Hell Zero Grape', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellzerogrape.png'),
(117, 'Hell Focus+', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellfocus+.png'),
(118, 'Hell Strong Apple', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellstrongapple.png'),
(119, 'Hell Strong Water Melon', '4.5', '999', '450', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hellstrongwatermelon.png'),
(120, 'Red Bull', '4.5', '999', '850', '0.00', '', 'normal', 'vegan', 'ital', 'ital/redbull.png'),
(121, 'Loyd piramis zöldtea', '4.5', '999', '400', '0.00', '', 'normal', 'vegan', 'ital', 'ital/loydpiramiszoldtea.png'),
(122, 'Loyd earl grey', '4.5', '999', '400', '0.00', '', 'normal', 'vegan', 'ital', 'ital/loydearlgrey.png'),
(123, 'Loyd piramis gyümölcs tea több ízben', '4.5', '999', '400', '0.00', '', 'normal', 'vegan', 'ital', 'ital/loydpiramisgyumolcs.png'),
(124, 'Méz', '4.5', '999', '100', '0.00', '', 'normal', 'vegan', 'ital', 'ital/mez.png'),
(125, 'Ristretto', '4.5', '999', '490', '0.00', '', 'normal', 'vegan', 'ital', 'ital/ristretto.png'),
(126, 'Espresso', '4.5', '999', '490', '0.00', '', 'normal', 'vegan', 'ital', 'ital/espresso.png'),
(127, 'Doppio', '4.5', '999', '670', '0.00', '', 'normal', 'vegan', 'ital', 'ital/doppio.png'),
(128, 'Hosszúkávé', '4.5', '999', '490', '0.00', '', 'normal', 'vegan', 'ital', 'ital/hosszukave.png'),
(129, 'Cappuccino', '4.5', '999', '610', '0.00', '', 'normal', 'meat', 'ital', 'ital/cappuccino.png'),
(130, 'Latte Macchiato', '4.5', '999', '700', '0.00', '', 'normal', 'meat', 'ital', 'ital/lattemacchiato.png'),
(131, 'Melange', '4.5', '999', '800', '0.00', '', 'normal', 'meat', 'ital', 'ital/melange.png'),
(132, 'Hugi kedvence', '4.5', '999', '650', '0.00', 'hosszú kávé, csokiöntet, tejszínhab, fahéj', 'best seller', 'meat', 'ital', 'ital/hugikedvence.png'),
(133, 'Tej', '4.5', '999', '120', '0.00', '', 'normal', 'meat', 'ital', 'ital/tej.png'),
(134, 'Fahéj', '4.5', '999', '100', '0.00', '', 'normal', 'vegan', 'ital', 'ital/fahej.png'),
(135, 'Tejszínhab', '4.5', '999', '150', '0.00', '', 'normal', 'meat', 'ital', 'ital/tejszinhab.png'),
(136, 'Méz', '4.5', '999', '100', '0.00', '', 'normal', 'vegan', 'ital', 'ital/mez.png'),
(137, 'Misztikum Mákpálinka', '4.5', '999', '800 2cl', '0.00', '1100 4cl', 'normal', 'vegan', 'ital', 'ital/misztikummakpalinka.png'),
(138, 'Bombay Sapphire', '4.5', '999', '600 2cl', '0.00', '900 4cl', 'normal', 'vegan', 'ital', 'ital/bombaysapphire.png'),
(139, 'Beefeater', '4.5', '999', '550 2cl', '0.00', '790 4cl', 'normal', 'vegan', 'ital', 'ital/beefeater.png'),
(140, 'Hendricks', '4.5', '999', '800 2cl', '0.00', '1500 4cl', 'normal', 'vegan', 'ital', 'ital/hendricks.png'),
(141, 'Baileys', '4.5', '999', '430 2cl', '0.00', '780 4cl', 'normal', 'vegan', 'ital', 'ital/baileys.png'),
(142, 'Tatratea 72%', '4.5', '999', '400 2cl', '0.00', '1350 4cl', 'normal', 'vegan', 'ital', 'ital/tatratea72.png'),
(143, 'Tatratea 42%', '4.5', '999', '750 2cl', '0.00', '1050 4cl', 'normal', 'vegan', 'ital', 'ital/tatratea42.png'),
(144, 'Jägermeister', '4.5', '999', '550 2cl', '0.00', '880 4cl', 'normal', 'vegan', 'ital', 'ital/jagermeister.png'),
(145, 'Jägermeister Scharf', '4.5', '999', '600 2cl', '0.00', '920 4cl', 'normal', 'vegan', 'ital', 'ital/jagermeisterscharf.png'),
(146, 'St. Hubertus', '4.5', '999', '450 2cl', '0.00', '650 4cl', 'normal', 'vegan', 'ital', 'ital/sthubertus.png'),
(147, 'Zwack Unicum', '4.5', '999', '600 2cl', '0.00', '800 4cl', 'normal', 'vegan', 'ital', 'ital/zwackunicum.png'),
(148, 'Zwack Unicum Szilva', '4.5', '999', '600 2cl', '0.00', '800 4cl', 'normal', 'vegan', 'ital', 'ital/zwackunicumszilva.png'),
(149, 'Malibu', '4.5', '999', '500 2cl', '0.00', '750 4cl', 'normal', 'vegan', 'ital', 'ital/malibu.png'),
(150, 'Captain Morgan', '4.5', '999', '550 2cl', '0.00', '800 4cl', 'normal', 'vegan', 'ital', 'ital/captainmorgan.png'),
(151, 'Bacardi Spiced', '4.5', '999', '600 2cl', '0.00', '850 4cl', 'normal', 'vegan', 'ital', 'ital/bacardispiced.png'),
(152, 'Sierra Silver', '4.5', '999', '650 2cl', '0.00', '900 4cl', 'normal', 'vegan', 'ital', 'ital/sierrasilver.png'),
(153, 'Sierra Gold', '4.5', '999', '650 2cl', '0.00', '900 4cl', 'normal', 'vegan', 'ital', 'ital/sierragold.png'),
(154, 'Martini Bianco', '4.5', '999', '820 1dl', '0.00', '6500 1 üveg', 'normal', 'vegan', 'ital', 'ital/martinibianco.png'),
(155, 'Martini Rosso', '4.5', '999', '820 1dl', '0.00', '6500 1 üveg', 'normal', 'vegan', 'ital', 'ital/martinirosso.png'),
(156, 'Romanoff', '4.5', '999', '430 2cl', '0.00', '600 4cl', 'normal', 'vegan', 'ital', 'ital/romanoff.png'),
(157, 'Absolut', '4.5', '999', '650 2cl', '0.00', '850 4cl', 'normal', 'vegan', 'ital', 'ital/absolut.png'),
(158, 'Finlandia', '4.5', '999', '470 2cl', '0.00', '670 4cl', 'normal', 'vegan', 'ital', 'ital/finlandia.png'),
(159, 'Royal', '4.5', '999', '450 2cl', '0.00', '650 4cl', 'normal', 'vegan', 'ital', 'ital/royal.png');

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
(1, 'Kéki Máté', 'kekimate@gmail.com', '+36209124515', 'Kekimate1*', '2003-04-13', 'male'),
(2, 'Miskolczi Nándor', 'miskolczinandor@gmail.com', '+36209124515', 'Miskolczinandor1*', '2003-04-13', 'male'),
(3, 'Agócs Ármin', 'agocsarmin@gmail.com', '+36209124515', 'Agocsarmin1*', '2003-04-13', 'male');

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
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
