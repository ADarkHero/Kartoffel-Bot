-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Apr 2015 um 21:53
-- Server Version: 5.5.27
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `bot`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `badwords`
--

CREATE TABLE IF NOT EXISTS `badwords` (
  `ID` int(11) NOT NULL,
  `Channel` text NOT NULL,
  `Badword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `badwords`
--

INSERT INTO `badwords` (`ID`, `Channel`, `Badword`) VALUES
(1, '', 'yolo');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `commands`
--

CREATE TABLE IF NOT EXISTS `commands` (
  `ID` int(11) NOT NULL,
  `Command` text NOT NULL,
  `Type` text NOT NULL,
  `Options` text NOT NULL,
  `Options02` text NOT NULL,
  `Options03` text NOT NULL,
  `OP` int(11) NOT NULL,
  `User` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `commands`
--

INSERT INTO `commands` (`ID`, `Command`, `Type`, `Options`, `Options02`, `Options03`, `OP`, `User`) VALUES
(0, '!cheesecake', 'Normal', 'I like cheesecake!', '', '', 0, ''),
(1, '!diaet', 'Normal', 'Ich bin der große, böse Diätmeister!', '', '', 0, ''),
(2, '!nicemen', 'Normal', 'Nice men come last!', '', '', 0, ''),
(3, '!picnic', 'Normal', 'Picnic?! Picnic. FrankerZ', '', '', 0, ''),
(4, '!warum', 'Normal', 'Weil Baum!', '', '', 0, ''),
(5, '!elektrotitte', 'React', '$$value$$s Titten sind elektrisch, BABY!', '', '', 0, ''),
(6, '!hype', 'React', '$$value$$ HYPE! FrankerZ', '', '', 0, ''),
(7, '!debug', 'React', '$$user$$ said "$$value$$" | Value01: $$value01$$ | Value02: $$value02$$', '', '', 0, ''),
(8, '!test', 'React', '$$user$$ said "$$value$$"', '', '', 0, ''),
(9, '!raid', 'Normal', 'How to raid: Copy the raid message, go to the raidtarget & paste the message there.', '', '', 0, ''),
(10, '!raid', 'React', 'How to raid: Copy the raid message, go to the raidtarget & paste the message there. ||| Raidtarget: http://www.twitch/$$value01$$ ||| Raidmessage: $$value02$$', '', '', 1, ''),
(11, '!rank', 'Read', '$$user$$s current rank is $$value$$!', 'SELECT Rank FROM rank WHERE User=''$$user$$''', 'Rank', 0, ''),
(12, '!joinmsg', 'Write', '$$user$$ set a new joinmessage!', 'INSERT INTO joinmsg (ID, User, Channel, Message) \nVALUES (''0'', ''$$user$$'', ''$$channel$$'',''$$message$$'')', '', 0, ''),
(13, '!undercover', 'Write', '$$user$$ will be undercover in the future!', 'INSERT INTO joinmsg (ID, User, Channel, Message) \nVALUES (''0'', ''$$user$$'', ''$$channel$$'',''undercover'')', '', 0, ''),
(14, '!badword', 'None', 'Stahp using bad words! BibleThump', '', '', 0, ''),
(15, '!setrank', 'Write', '$$user$$s rank was set!', 'UPDATE rank SET Rank = ''$$value01$$'' WHERE User = ''$$value$$''', '', 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `ID` int(11) NOT NULL,
  `BotName` text NOT NULL,
  `Password` text NOT NULL,
  `ChannelName` text NOT NULL,
  `Server` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `config`
--

INSERT INTO `config` (`ID`, `BotName`, `Password`, `ChannelName`, `Server`) VALUES
(0, 'RalpherZBot', 'oauth:pa5564mlammulhnw5gw1gec0bqfc60n', 'adarkhero', 'irc.twitch.tv'),
(1, 'ralpherzbot', '', 'adarkhero', 'localhost'),
(2, 'adarkhero', 'oauth:ofwftptj2d6gwo8vohg4hu99xgarebj', 'adarkhero', 'irc.twitch.tv');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `joinmsg`
--

CREATE TABLE IF NOT EXISTS `joinmsg` (
  `ID` int(11) NOT NULL,
  `User` text NOT NULL,
  `Channel` text NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `joinmsg`
--

INSERT INTO `joinmsg` (`ID`, `User`, `Channel`, `Message`) VALUES
(0, 'adarkhero', '#adarkhero', 'undercover'),
(0, 'adarkhero', '#adarkhero', 'undercover'),
(0, 'adarkhero', '#adarkhero', 'undercover'),
(0, 'adarkhero', '#adarkhero', 'Hallu.'),
(0, 'adarkhero', '#adarkhero', ' Hallu. <3'),
(0, 'adarkhero', '#adarkhero', 'undercover'),
(0, 'adarkhero', '#adarkhero', ' Hallu. <3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `ID` int(11) NOT NULL,
  `Channel` text NOT NULL,
  `User` text NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `log`
--

INSERT INTO `log` (`ID`, `Channel`, `User`, `Message`) VALUES
(0, '#adarkhero', 'adarkhero', 'adsfadsf'),
(1, '#adarkhero', 'adarkhero', 'adfadsfasfd'),
(2, '#adarkhero', 'adarkhero', 'meow'),
(3, '#adarkhero', 'adarkhero', 'JESH!'),
(4, '#adarkhero', 'adarkhero', '!cheesecake'),
(5, '#adarkhero', 'adarkhero', 'asdfasd'),
(6, '#adarkhero', 'adarkhero', '!cheesecake'),
(7, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(8, '#adarkhero', 'adarkhero', '!elektrotitte'),
(9, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(10, '#adarkhero', 'adarkhero', '!test'),
(11, '#adarkhero', 'adarkhero', '!debug'),
(12, '#adarkhero', 'adarkhero', '!test'),
(13, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(14, '#adarkhero', 'adarkhero', '!cheesecake'),
(15, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(16, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(17, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(18, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(19, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(20, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(21, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(22, '#adarkhero', 'adarkhero', '!test'),
(23, '#adarkhero', 'adarkhero', '!debug'),
(24, '#adarkhero', 'adarkhero', '!debug asdf adfadf'),
(25, '#adarkhero', 'adarkhero', '!test asdf adfads'),
(26, '#adarkhero', 'adarkhero', '!test asdf adfads'),
(27, '#adarkhero', 'adarkhero', 'miau'),
(28, '#adarkhero', 'adarkhero', '!elektrotitte manda'),
(29, '#adarkhero', 'adarkhero', '!elektrotitte manda'),
(30, '#adarkhero', 'adarkhero', '!elektrotitte manda'),
(31, '#adarkhero', 'adarkhero', '!elektrotitte manda aaaasdfasdf'),
(32, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(33, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(34, '#adarkhero', 'adarkhero', '!elektrotitte manda aaaasdfasdf'),
(35, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(36, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(37, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(38, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(39, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(40, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(41, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(42, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(43, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(44, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(45, '#adarkhero', 'adarkhero', '!test'),
(46, '#adarkhero', 'adarkhero', '!cheesecake'),
(47, '#adarkhero', 'adarkhero', '!debug'),
(48, '#adarkhero', 'adarkhero', '!manda'),
(49, '#adarkhero', 'adarkhero', '!debug'),
(50, '#adarkhero', 'adarkhero', '!debug'),
(51, '#adarkhero', 'adarkhero', '!debug'),
(52, '#adarkhero', 'adarkhero', '!elektrotitte'),
(53, '#adarkhero', 'adarkhero', '!elektrotitte Manda'),
(54, '#adarkhero', 'adarkhero', '!picnic'),
(55, '#adarkhero', 'adarkhero', '!raid'),
(56, '#adarkhero', 'adarkhero', '!raid'),
(57, '#adarkhero', 'adarkhero', '!hype deine mudda'),
(58, '#adarkhero', 'adarkhero', '!hype deine'),
(59, '#adarkhero', 'adarkhero', '!hype deine mudda'),
(60, '#adarkhero', 'adarkhero', '!hype deine'),
(61, '#adarkhero', 'adarkhero', '!debug'),
(62, '#adarkhero', 'adarkhero', '!debug'),
(63, '#adarkhero', 'adarkhero', '!hype deine'),
(64, '#adarkhero', 'adarkhero', '!hype deine muddi'),
(65, '#adarkhero', 'adarkhero', '!hype'),
(66, '#adarkhero', 'adarkhero', '!hype test'),
(67, '#adarkhero', 'adarkhero', '!hype more test'),
(68, '#adarkhero', 'adarkhero', '!hype more test'),
(69, '#adarkhero', 'adarkhero', '!hype more test'),
(70, '#adarkhero', 'adarkhero', '!hype'),
(71, '#adarkhero', 'adarkhero', '!hype'),
(72, '#adarkhero', 'adarkhero', '!hype more test'),
(73, '#adarkhero', 'adarkhero', '!debug'),
(74, '#adarkhero', 'adarkhero', '!debug adfasdfasdfasdf adsfasldkföajdsfkjads'),
(75, '#adarkhero', 'adarkhero', '!raid'),
(76, '#adarkhero', 'adarkhero', '!raid manda testitest'),
(77, '#adarkhero', 'adarkhero', '!test'),
(78, '#adarkhero', 'adarkhero', '!debug'),
(79, '#adarkhero', 'adarkhero', '!rank'),
(80, '#adarkhero', 'adarkhero', '!rank'),
(81, '#adarkhero', 'adarkhero', '!rank'),
(82, '#adarkhero', 'adarkhero', '!rank'),
(83, '#adarkhero', 'adarkhero', '!rank'),
(84, '#adarkhero', 'adarkhero', '!rank'),
(85, '#adarkhero', 'adarkhero', '!rank'),
(86, '#adarkhero', 'adarkhero', '!rank'),
(87, '#adarkhero', 'adarkhero', '!rank'),
(88, '#adarkhero', 'adarkhero', '!test'),
(89, '#adarkhero', 'adarkhero', '!rank'),
(90, '#adarkhero', 'adarkhero', 'adfs'),
(91, '#adarkhero', 'adarkhero', '!test'),
(92, '#adarkhero', 'adarkhero', '!cheesecake'),
(93, '#adarkhero', 'adarkhero', '!debug asdf adfadf awqirqerqwer'),
(94, '#adarkhero', 'adarkhero', '!test'),
(95, '#adarkhero', 'adarkhero', '!elektrotitte manda'),
(96, '#adarkhero', 'adarkhero', '!elektrotitte manda'),
(97, '#adarkhero', 'adarkhero', '!joinmsg test'),
(98, '#adarkhero', 'adarkhero', '!joinmsg test'),
(99, '#adarkhero', 'adarkhero', '!joinmsg test'),
(100, '#adarkhero', 'adarkhero', '!joinmsg test'),
(101, '#adarkhero', 'adarkhero', '!joinmsg test'),
(102, '#adarkhero', 'adarkhero', '!joinmsg test'),
(103, '#adarkhero', 'adarkhero', '!joinmsg test'),
(104, '#adarkhero', 'adarkhero', '!joinmsg test'),
(105, '#adarkhero', 'adarkhero', '!joinmsg test'),
(106, '#adarkhero', 'ralpherzbot', 'Welcome to the stream ralpherzbot! FrankerZ [Rank 11]'),
(107, '#adarkhero', 'adarkhero', '!joinmsg test'),
(107, '#adarkhero', 'adarkhero', '!joinmsg test'),
(109, '#adarkhero', 'adarkhero', '!joinmsg test'),
(110, '#adarkhero', 'adarkhero', '!joinmsg test'),
(111, '#adarkhero', 'adarkhero', '!joinmsg test'),
(112, '#adarkhero', 'adarkhero', '!joinmsg test'),
(113, '#adarkhero', 'adarkhero', '!joinmsg test'),
(114, '#adarkhero', 'adarkhero', '!joinmsg test'),
(115, '#adarkhero', 'adarkhero', '!joinmsg test'),
(116, '#adarkhero', 'adarkhero', '!undercover'),
(117, '#adarkhero', 'adarkhero', '!undercover'),
(118, '#adarkhero', 'adarkhero', '!undercover'),
(119, '#adarkhero', 'adarkhero', 'olii'),
(120, '#adarkhero', 'adarkhero', '!undercover'),
(121, '#adarkhero', 'adarkhero', '!undercover'),
(122, '#adarkhero', 'adarkhero', '!undercover'),
(123, '#adarkhero', 'adarkhero', '!joinmsg Hallu. <3'),
(124, '#adarkhero', 'adarkhero', 'yolo'),
(125, '#adarkhero', 'adarkhero', 'yolo'),
(126, '#adarkhero', 'adarkhero', '!rank'),
(127, '#adarkhero', 'adarkhero', '!setrank adarkhero 15'),
(128, '#adarkhero', 'adarkhero', '!setrank adarkhero 15'),
(129, '#adarkhero', 'adarkhero', '!joinmessage Hallu. <3'),
(130, '#adarkhero', 'adarkhero', '!joinmessage Hallu. <3'),
(131, '#adarkhero', 'adarkhero', '!undercover'),
(132, '#adarkhero', 'adarkhero', '!joinmsg Hallu. <3'),
(133, '#adarkhero', 'adarkhero', '!undercover'),
(134, '#adarkhero', 'adarkhero', '!joinmsg Hallu. <3'),
(135, '#adarkhero', 'invi01', 'he maik, was geht ab? xD'),
(136, '#adarkhero', 'invi01', 'hahah xDD stream läuft gut ^^'),
(137, '#adarkhero', 'invi01', 'nur die musik könnte besser sein ;)'),
(138, '#adarkhero', 'invi01', 'Good Charlotte, Story of the Year etc... eher Alternative Rock ^^'),
(139, '#adarkhero', 'invi01', 'und kannst mal HS auch zocken :P'),
(140, '#adarkhero', 'invi01', 'Sorry, Inet abkackt ^^'),
(141, '#adarkhero', 'invi01', 'musi --> (y)'),
(142, '#adarkhero', 'invi01', 'i sich oafoch an scheiß beim stream O.o'),
(143, '#adarkhero', 'invi01', 'maik, kust du österreichisch redn ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rank`
--

CREATE TABLE IF NOT EXISTS `rank` (
  `ID` int(11) NOT NULL,
  `User` text NOT NULL,
  `Rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rank`
--

INSERT INTO `rank` (`ID`, `User`, `Rank`) VALUES
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'ralpherzbot', 28),
(0, 'adarkhero', 18),
(0, 'sirspex', 1),
(0, 'invi01', 3),
(0, 'invi01', 3),
(0, 'invi01', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
