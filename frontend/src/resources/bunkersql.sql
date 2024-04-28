-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 28. 14:50
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
(1, 'carne asada tacos', '4.5', '999', '12.00', '0.00', '03 pieces per serving', 'best seller', 'meat', 'pizza', 'pizza/taco-1.png'),
(2, 'shrimp tacos', '4.5', '999', '15.00', '3.00', '03 pieces per serving', 'best seller', 'meat', 'pizza', 'pizza/taco-2.png'),
(3, 'barbacoa tacos', '4.5', '500', '12.00', '0.00', '03 pieces per serving', 'best seller', 'meat', 'pizza', 'pizza/taco-3.png'),
(4, 'tacos al pastor', '4.5', '999', '13.00', '2.00', '03 pieces per serving', 'best seller', 'meat', 'pizza', 'pizza/taco-4.png'),
(5, 'tinga tacos', '4', '500', '11.00', '0.00', '03 pieces per serving', 'normal', 'meat', 'pizza', 'pizza/taco-5.png'),
(6, 'campechanos tacos', '4', '500', '11.00', '1.00', '03 pieces per serving', 'new dishes', 'meat', 'pizza', 'pizza/taco-6.png'),
(7, 'carnitas tacos', '4.5', '500', '14.00', '2.00', '03 pieces per serving', 'seasonal dishes online only', 'meat', 'pizza', 'pizza/taco-7.png'),
(8, 'vegan tacos', '4.5', '100', '9.00', '2.00', '03 pieces per serving', 'new dishes', 'vegan', 'pizza', 'pizza/taco-8.png'),
(9, 'wet burrito', '4.5', '600', '14.00', '0.00', '01 roll per serving', 'new dishes', 'meat', 'gyros', 'gyros/burrito-1.png'),
(10, 'poncho burrito', '4.5', '999', '15.00', '3.00', '01 roll per serving', 'best seller', 'meat', 'gyros', 'gyros/burrito-2.png'),
(11, 'bean & cheese burrito', '4.5', '999', '14.00', '0.00', '01 roll per serving', 'best seller', 'vegan', 'gyros', 'gyros/burrito-3.png'),
(12, 'breakfast burrito', '4.5', '999', '12.00', '2.00', '01 roll per serving', 'new dishes', 'meat', 'gyros', 'gyros/burrito-4.png'),
(13, 'california burrito', '4.5', '999', '14.00', '0.00', '01 roll per serving', 'best seller', 'meat', 'gyros', 'gyros/burrito-5.png'),
(14, 'chimichanga', '4', '400', '12.00', '2.00', '01 roll per serving', 'seasonal dishes', 'meat', 'gyros', 'gyros/burrito-6.png'),
(15, 'nacho tots', '4', '699', '12.00', '2.00', '01 tray per serving', 'best seller', 'meat', 'hamburger', 'hamburger/nachos-1.png'),
(16, 'root beer pork nachos', '4.5', '999', '12.00', '0.00', '01 tray per serving', 'best seller', 'meat', 'hamburger', 'hamburger/nachos-2.png'),
(17, 'shrimp nachos', '4.5', '999', '17.00', '2.00', '01 tray per serving', 'best seller', 'meat', 'hamburger', 'hamburger/nachos-3.png'),
(18, 'chicken nachos', '4.5', '999', '11.00', '0.00', '01 tray per serving', 'best seller', 'meat', 'hamburger', 'hamburger/nachos-4.png'),
(19, 'only nachos', '4', '999', '7.00', '2.00', '01 tray per serving', 'normal', 'vegan', 'hamburger', 'hamburger/nachos-5.png'),
(20, 'pico de gallo', '4.5', '999', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 'hamburger', 'hamburger/salsa-1.png'),
(21, 'salsa guille', '4', '699', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 'hamburger', 'hamburger/salsa-2.png'),
(22, 'tomatillo salsa', '4.5', '499', '5.00', '2.00', '01 bowl per serving', 'seasonal dishes', 'vegan', 'hamburger', 'hamburger/salsa-3.png'),
(23, 'roasted tomato salsa', '4.5', '999', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 'hamburger', 'hamburger/salsa-4.png'),
(24, 'guacamole', '4.5', '699', '5.00', '2.00', '01 bowl per serving', 'best seller', 'vegan', 'hamburger', 'hamburger/salsa-5.png'),
(25, 'corn salad', '3.5', '699', '5.00', '1.00', '01 bowl per serving', 'new dishes seasonal dishes', 'vegan', 'tortilla', 'tortilla/side-1.png'),
(26, 'keto taquitos', '4.5', '999', '9.00', '0.00', '05 pieces per serving', 'best seller', 'meat', 'tortilla', 'tortilla/side-2.png'),
(27, 'mexican rice', '4', '200', '5.00', '0.00', '01 bowl per serving', 'normal', 'vegan', 'tortilla', 'tortilla/side-3.png'),
(28, 'cilantro lime rice', '4', '100', '5.00', '0.00', '01 bowl per serving', 'new dishes', 'vegan', 'tortilla', 'tortilla/side-4.png'),
(29, 'chicken tortilla soup', '3.5', '299', '10.00', '2.00', '01 bowl per serving', 'new dishes', 'meat', 'tortilla', 'tortilla/side-5.png'),
(30, 'Churros', '4.5', '999', '7.00', '0.00', '05 pieces per serving', 'best seller', 'vegan', 'desszert', 'desszert/dessert-1.png'),
(31, 'Fried Ice Cream', '4.5', '999', '5.00', '1.00', '01 piece per serving', 'best seller', 'vegan', 'desszert', 'desszert/dessert-2.png'),
(32, 'Dulce de Leche', '4.5', '50', '4.00', '0.00', '01 bowl per serving', 'new dishes', 'vegan', 'desszert', 'desszert/dessert-3.png'),
(33, 'Sweet Corn Cake', '3', '599', '4.00', '1.00', '02 pieces per serving', 'seasonal dishes online only', 'vegan', 'desszert', 'desszert/dessert-4.png'),
(34, 'Sopapillas', '4', '199', '4.00', '0.00', '10 pieces per serving', 'normal', 'vegan', 'desszert', 'desszert/dessert-5.png'),
(35, 'Conchas', '4', '299', '5.00', '0.00', '10 pieces per serving', 'normal', 'vegan', 'desszert', 'desszert/dessert-6.png'),
(36, 'Horchata', '4.5', '999', '4.00', '0.00', '01 glass per serving', 'normal', 'vegan', 'desszert', 'desszert/dessert-7.png'),
(37, 'Margarita', '4.5', '999', '5.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 'ital', 'ital/drink-1.png'),
(38, 'Michelada', '4.5', '999', '5.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 'ital', 'ital/drink-2.png'),
(39, 'paloma', '4.5', '599', '5.00', '0.00', '01 glass per serving', 'new dishes seasonal dishes', 'vegan', 'ital', 'ital/drink-3.png'),
(40, 'Atole', '4', '999', '5.00', '1.00', '01 glass per serving', 'best seller', 'vegan', 'ital', 'ital/drink-4.png'),
(41, 'fruit detox', '3.5', '999', '3.00', '0.00', '01 glass per serving', 'seasonal dishes best seller', 'vegan', 'ital', 'ital/drink-5.png'),
(42, 'Coca cola', '4.5', '9999', '3.00', '0.00', '01 glass per serving', 'best seller', 'vegan', 'ital', 'ital/drink-6.png');

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
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
