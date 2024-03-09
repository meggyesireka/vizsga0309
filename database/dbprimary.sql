-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Okt 07. 17:03
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `dbprimary`
--
CREATE DATABASE IF NOT EXISTS `dbprimary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbprimary`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ads`
--

CREATE TABLE `ads` (
  `AdAz` int(15) UNSIGNED NOT NULL COMMENT 'Hírdetés azonosító',
  `UserFullName` varchar(50) DEFAULT NULL COMMENT 'Felhasználó teljes neve',
  `UserEmail` varchar(80) DEFAULT NULL COMMENT 'Felhasználó email címe',
  `UserMobile` bigint(11) UNSIGNED DEFAULT NULL COMMENT 'Felhasználó telefonszáma',
  `ServiceName` varchar(30) DEFAULT NULL COMMENT 'Szolgáltatás neve',
  `Address` varchar(50) DEFAULT NULL COMMENT 'Szolgáltatás helye',
  `UserAz` smallint(15) UNSIGNED NOT NULL COMMENT 'Felhasználó azonosító'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- TÁBLA KAPCSOLATAI `ads`:
--   `ServiceName`
--       `services` -> `ServiceName`
--   `UserEmail`
--       `users` -> `UserEmail`
--   `UserMobile`
--       `users` -> `UserMobile`
--   `UserFullName`
--       `users` -> `UserFullName`
--   `UserAz`
--       `users` -> `UserAz`
--

--
-- A tábla adatainak kiíratása `ads`
--

INSERT INTO `ads` (`AdAz`, `UserFullName`, `UserEmail`, `UserMobile`, `ServiceName`, `Address`, `UserAz`) VALUES
(1, 'Kurucz János', 'kuruczjanos@gmail.com', 6705727086, 'Fodrász', '1181 Parázs utca 26', 1),
(2, 'Kurucz János', 'kuruczjanos@gmail.com', 6705727086, 'Kozmetikus', '1181 Parázs utca 26', 1),
(3, 'Kurucz János', 'kuruczjanos@gmail.com', 6222222222, 'Fodrász', '1181 Parázs utca 26', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services`
--

CREATE TABLE `services` (
  `ServiceAz` int(15) UNSIGNED NOT NULL COMMENT 'Szolgáltatás azonoítója',
  `ServiceName` varchar(30) DEFAULT NULL COMMENT 'Szolgáltatás neve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- TÁBLA KAPCSOLATAI `services`:
--

--
-- A tábla adatainak kiíratása `services`
--

INSERT INTO `services` (`ServiceAz`, `ServiceName`) VALUES
(2, 'Fodrász'),
(1, 'Kozmetikus');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `UserAz` smallint(15) UNSIGNED NOT NULL COMMENT 'Felhasználó azonosítója',
  `UserName` varchar(20) DEFAULT NULL COMMENT 'Belépési felhasználónév',
  `UserPassword` varchar(25) DEFAULT NULL COMMENT 'Belépési jelszó',
  `UserEmail` varchar(80) DEFAULT NULL COMMENT 'Felhasználó email címe',
  `UserMobile` bigint(11) UNSIGNED DEFAULT NULL COMMENT 'Felhasználó telefonszáma',
  `UserFullName` varchar(50) DEFAULT NULL COMMENT 'Felhasználó teljes neve',
  `Type` int(1) DEFAULT NULL COMMENT 'Felhasználó 0, Admin 1',
  `UserPhoto` varchar(200) NOT NULL COMMENT 'Felhasználó profilképe',
  `ResetCode` varchar(15) NOT NULL COMMENT 'Jelszó változtatás kódja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- TÁBLA KAPCSOLATAI `users`:
--

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`UserAz`, `UserName`, `UserPassword`, `UserEmail`, `UserMobile`, `UserFullName`, `Type`, `UserPhoto`, `ResetCode`) VALUES
(1, 'Kurucz', '123456789', 'kuruczjanos@gmail.com', 6705727086, 'Kurucz János', NULL, '', ''),
(2, 'Meggyesi', '123456789', 'meggyesireka@gmail.com', 6222222222, 'Meggyesi Réka', NULL, '', '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`AdAz`),
  ADD KEY `UserFullName` (`UserFullName`),
  ADD KEY `UserEmail` (`UserEmail`),
  ADD KEY `UserMobile` (`UserMobile`),
  ADD KEY `ServiceName` (`ServiceName`),
  ADD KEY `UserAz` (`UserAz`);

--
-- A tábla indexei `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceAz`),
  ADD KEY `ServiceName` (`ServiceName`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserAz`),
  ADD KEY `UserEmail` (`UserEmail`,`UserMobile`,`UserFullName`),
  ADD KEY `UserMobile` (`UserMobile`,`UserFullName`),
  ADD KEY `UserFullName` (`UserFullName`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ads`
--
ALTER TABLE `ads`
  MODIFY `AdAz` int(15) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Hírdetés azonosító', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `ServiceAz` int(15) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Szolgáltatás azonoítója', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `UserAz` smallint(15) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Felhasználó azonosítója', AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`ServiceName`) REFERENCES `services` (`ServiceName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_ibfk_2` FOREIGN KEY (`UserEmail`) REFERENCES `users` (`UserEmail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_ibfk_3` FOREIGN KEY (`UserMobile`) REFERENCES `users` (`UserMobile`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_ibfk_4` FOREIGN KEY (`UserFullName`) REFERENCES `users` (`UserFullName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_ibfk_5` FOREIGN KEY (`UserAz`) REFERENCES `users` (`UserAz`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
