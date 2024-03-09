-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Sze 17. 16:55
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szepitkezz`
--
CREATE DATABASE IF NOT EXISTS `szepitkezz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `szepitkezz`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hirdetesek`
--

DROP TABLE IF EXISTS `hirdetesek`;
CREATE TABLE `hirdetesek` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `TELEFON` bigint(11) NOT NULL,
  `SZOLGÁLTATÁSID` int(30) NOT NULL,
  `CÍM` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltatok`
--

DROP TABLE IF EXISTS `szolgaltatok`;
CREATE TABLE `szolgaltatok` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `PHONENUMBER` bigint(11) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `CÉGAZON` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgáltatások`
--

DROP TABLE IF EXISTS `szolgáltatások`;
CREATE TABLE `szolgáltatások` (
  `ID` int(11) NOT NULL,
  `Szolgáltatás neve` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userek`
--

DROP TABLE IF EXISTS `userek`;
CREATE TABLE `userek` (
  `ID` smallint(15) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PHONENUMBER` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `hirdetesek`
--
ALTER TABLE `hirdetesek`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SZOLGÁLTATÁS` (`SZOLGÁLTATÁSID`);

--
-- A tábla indexei `szolgaltatok`
--
ALTER TABLE `szolgaltatok`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `szolgáltatások`
--
ALTER TABLE `szolgáltatások`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- A tábla indexei `userek`
--
ALTER TABLE `userek`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `hirdetesek`
--
ALTER TABLE `hirdetesek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szolgaltatok`
--
ALTER TABLE `szolgaltatok`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szolgáltatások`
--
ALTER TABLE `szolgáltatások`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `userek`
--
ALTER TABLE `userek`
  MODIFY `ID` smallint(15) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `hirdetesek`
--
ALTER TABLE `hirdetesek`
  ADD CONSTRAINT `hirdetesek_ibfk_1` FOREIGN KEY (`SZOLGÁLTATÁSID`) REFERENCES `szolgáltatások` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
