-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Gegenereerd op: 21 jan 2018 om 14:19
-- Serverversie: 10.0.31-MariaDB-0ubuntu0.16.04.2
-- PHP-versie: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vulpinedesign_userspice_test`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `day` int(2) NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` int(4) NOT NULL,
  `time` varchar(8) NOT NULL,
  `title` varchar(40) NOT NULL,
  `descr` varchar(400) NOT NULL,
  `fblink` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `agenda`
--

INSERT INTO `agenda` (`id`, `datetime`, `day`, `month`, `year`, `time`, `title`, `descr`, `fblink`) VALUES
(2, '2018-01-21 02:05:50', 11, 'Januari', 2018, '14:00', 'Test Event', 'sfdsdfsdf', 'https://facebook.com/vulpine.events/');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `encontent` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `encontent`) VALUES
(1, 'Titel', 'NL Teksten Testen<br>', 'EN Tekst');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `attendees`
--

CREATE TABLE `attendees` (
  `regid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `going` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `attendees`
--

INSERT INTO `attendees` (`regid`, `eventid`, `userid`, `going`) VALUES
(4, 2, 1, 'y');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `audit`
--

INSERT INTO `audit` (`id`, `user`, `page`, `timestamp`, `ip`, `viewed`) VALUES
(1, 1, '42', '2017-02-20 17:31:13', '::1', 0),
(2, 0, '44', '2017-08-14 17:32:22', '::1', 0),
(3, 0, '4', '2017-09-16 17:53:58', '::1', 0),
(4, 0, '4', '2017-10-09 15:41:11', '192.168.0.222', 0),
(5, 0, '3', '2018-01-21 12:47:38', '5.228.16.95', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `crons`
--

CREATE TABLE `crons` (
  `id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `sort` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `crons`
--

INSERT INTO `crons` (`id`, `active`, `sort`, `name`, `file`, `createdby`, `created`, `modified`) VALUES
(1, 0, 100, 'Auto-Backup', 'backup.php', 1, '2017-09-16 07:49:22', '2017-11-11 20:15:36');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `crons_logs`
--

CREATE TABLE `crons_logs` (
  `id` int(11) NOT NULL,
  `cron_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  `debug_level` int(1) NOT NULL DEFAULT '0',
  `isSMTP` int(1) NOT NULL DEFAULT '0',
  `isHTML` varchar(5) NOT NULL DEFAULT 'true',
  `useSMTPauth` varchar(6) NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `email`
--

INSERT INTO `email` (`id`, `website_name`, `smtp_server`, `smtp_port`, `email_login`, `email_pass`, `from_name`, `from_email`, `transport`, `verify_url`, `email_act`, `debug_level`, `isSMTP`, `isHTML`, `useSMTPauth`) VALUES
(1, 'User Spice', 'smtp.gmail.com', 587, 'yourEmail@gmail.com', '1234', 'User Spice', 'yourEmail@gmail.com', 'tls', 'http://localhost/43', 0, 0, 0, 'true', 'true');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `ilink` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `gname` varchar(140) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gallery`
--

INSERT INTO `gallery` (`id`, `ilink`, `gname`) VALUES
(204, 'images/2d40ec94cf457f36ccbba700ede570c9.jpg', 'Test Gallery'),
(205, 'images/84b4e100b097c19f2061a17c38e5fb59.jpg', 'Test Gallery'),
(206, 'images/54586bb36c557d6734cfd313fb9b148a.jpg', 'Test Gallery'),
(207, 'images/92219e2e37e92f005507653e6b39059e.jpg', 'Test Gallery');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `groups_menus`
--

CREATE TABLE `groups_menus` (
  `id` int(11) NOT NULL,
  `group_id` int(15) NOT NULL,
  `menu_id` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `groups_menus`
--

INSERT INTO `groups_menus` (`id`, `group_id`, `menu_id`) VALUES
(30, 2, 9),
(29, 0, 8),
(28, 0, 7),
(27, 0, 21),
(5, 0, 3),
(6, 0, 1),
(7, 0, 2),
(8, 0, 51),
(9, 0, 52),
(10, 0, 37),
(11, 0, 38),
(12, 2, 39),
(13, 2, 40),
(14, 2, 41),
(15, 2, 42),
(16, 2, 43),
(17, 2, 44),
(18, 2, 45),
(19, 0, 46),
(20, 0, 47),
(21, 0, 49),
(26, 0, 20),
(25, 0, 18),
(31, 2, 10),
(32, 2, 11),
(33, 2, 12),
(34, 2, 13),
(35, 2, 14),
(36, 2, 15),
(37, 0, 16);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(3) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logtype` varchar(25) NOT NULL,
  `lognote` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logdate`, `logtype`, `lognote`) VALUES
(79, 1, '2018-01-16 23:05:45', 'User', 'User logged in.'),
(80, 1, '2018-01-16 23:05:58', 'System Updates', 'Reformatted existing vericodes'),
(81, 1, '2018-01-16 23:05:58', 'System Updates', 'Update 3GJYaKcqUtw7 successfully deployed.'),
(82, 1, '2018-01-16 23:05:58', 'System Updates', 'Updated old Blacklisted logs to IP Logging type.'),
(83, 1, '2018-01-16 23:05:58', 'System Updates', 'Added cloaking to users.'),
(84, 1, '2018-01-17 00:47:30', 'User', 'User logged in.'),
(85, 1, '2018-01-17 03:24:11', 'User', 'User logged in.'),
(86, 1, '2018-01-17 17:27:25', 'User', 'User logged in.'),
(87, 1, '2018-01-17 17:29:15', 'User', 'User logged in.'),
(88, 1, '2018-01-17 17:32:28', 'User', 'User logged in.'),
(89, 1, '2018-01-17 17:41:14', 'User', 'User logged in.'),
(90, 1, '2018-01-17 17:47:38', 'Pages Manager', 'Added 1 permission(s) to usersc/update2.php.'),
(91, 1, '2018-01-17 21:03:54', 'User', 'User logged in.'),
(92, 1, '2018-01-18 00:27:39', 'User', 'User logged in.'),
(93, 1, '2018-01-18 18:53:26', 'User', 'User logged in.'),
(94, 1, '2018-01-18 19:44:36', 'User', 'User logged in.'),
(95, 1, '2018-01-18 19:45:44', 'Pages Manager', 'Changed private from private to public for Page #84 and stripped re_auth.'),
(96, 1, '2018-01-18 22:58:52', 'User', 'User logged in.'),
(97, 1, '2018-01-18 23:30:31', 'Setting Change', 'Changed navigation_type from 1 to 0.'),
(98, 1, '2018-01-18 23:32:04', 'Setting Change', 'Changed navigation_type from 0 to 1.'),
(99, 1, '2018-01-18 23:33:22', 'Setting Change', 'Changed navigation_type from 1 to 0.'),
(100, 1, '2018-01-19 15:22:24', 'User', 'User logged in.'),
(101, 1, '2018-01-19 15:30:52', 'Setting Change', 'Changed force_pr from 0 to 1.'),
(102, 1, '2018-01-19 15:30:52', 'Setting Change', 'Changed notifications from 0 to 1.'),
(103, 1, '2018-01-19 15:31:09', 'Notifications - Mass', 'Sent a notification to Sample.'),
(104, 1, '2018-01-19 15:31:09', 'Notifications - Mass', 'Finished sending mass message.'),
(105, 1, '2018-01-19 15:32:24', 'User', 'User logged in.'),
(106, 1, '2018-01-19 15:32:34', 'Notifications - Admin', 'Deleted Notification ID #11 read.'),
(107, 1, '2018-01-19 15:33:06', 'Setting Change', 'Changed req_cap from 0 to 1.'),
(108, 1, '2018-01-19 15:33:06', 'Setting Change', 'Changed req_num from 0 to 1.'),
(109, 1, '2018-01-19 15:34:40', 'Setting Change', 'Changed echouser from 0 to 1.'),
(110, 1, '2018-01-19 17:49:14', 'User', 'User logged in.'),
(111, 1, '2018-01-20 22:31:53', 'User', 'User logged in.'),
(112, 1, '2018-01-20 22:38:06', 'Notifications - Admin', 'Deleted Notification ID #11 read.'),
(113, 1, '2018-01-20 22:38:23', 'Notifications - Admin', 'Deleted Notification ID #11 read.'),
(114, 1, '2018-01-20 22:40:00', 'Notifications - Admin', 'Marked Notification ID #11 read.'),
(115, 1, '2018-01-20 22:40:18', 'Notifications - Admin', 'Deleted Notification ID #11 read.'),
(116, 1, '2018-01-20 22:59:53', 'Pages Manager', 'Changed private from private to public for Page #117 and stripped re_auth.'),
(117, 1, '2018-01-21 00:02:10', 'Pages Manager', 'Changed private from private to public for Page #118 and stripped re_auth.'),
(118, 1, '2018-01-21 01:57:06', 'User', 'User logged in.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `logs_exempt`
--

CREATE TABLE `logs_exempt` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `parent` int(10) NOT NULL,
  `dropdown` int(1) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `display_order` int(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `parent`, `dropdown`, `logged_in`, `display_order`, `label`, `link`, `icon_class`) VALUES
(1, 'main', 2, 0, 1, 1, 'Home', '', 'fa fa-fw fa-home'),
(2, 'main', -1, 1, 1, 14, '', '', 'fa fa-fw fa-cogs'),
(3, 'main', -1, 0, 1, 11, '{{username}}', 'users/account.php', 'fa fa-fw fa-user'),
(4, 'main', -1, 1, 0, 3, 'Help', '', 'fa fa-fw fa-life-ring'),
(5, 'main', -1, 0, 0, 2, 'Register', 'users/join.php', 'fa fa-fw fa-plus-square'),
(6, 'main', -1, 0, 0, 1, 'Log In', 'users/login.php', 'fa fa-fw fa-sign-in'),
(7, 'main', 2, 0, 1, 2, 'Account', 'users/account.php', 'fa fa-fw fa-user'),
(8, 'main', 2, 0, 1, 3, '{{hr}}', '', ''),
(9, 'main', 2, 0, 1, 4, 'Admin Dashboard', 'users/admin.php', 'fa fa-fw fa-cogs'),
(10, 'main', 2, 0, 1, 5, 'User Management', 'users/admin_users.php', 'fa fa-fw fa-user'),
(11, 'main', 2, 0, 1, 6, 'Permissions Manager', 'users/admin_permissions.php', 'fa fa-fw fa-lock'),
(12, 'main', 2, 0, 1, 7, 'Page Management', 'users/admin_pages.php', 'fa fa-fw fa-wrench'),
(13, 'main', 2, 0, 1, 8, 'Messages Manager', 'users/admin_messages.php', 'fa fa-fw fa-envelope'),
(14, 'main', 2, 0, 1, 9, 'System Logs', 'users/admin_logs.php', 'fa fa-fw fa-search'),
(15, 'main', 2, 0, 1, 10, '{{hr}}', '', ''),
(16, 'main', 2, 0, 1, 11, 'Logout', 'users/logout.php', 'fa fa-fw fa-sign-out'),
(17, 'main', -1, 0, 0, 0, 'Home', '', 'fa fa-fw fa-home'),
(18, 'main', -1, 0, 1, 10, 'Home', '', 'fa fa-fw fa-home'),
(19, 'main', 4, 0, 0, 1, 'Forgot Password', 'users/forgot_password.php', 'fa fa-fw fa-wrench'),
(20, 'main', -1, 0, 1, 12, '{{notifications}}', '', ''),
(21, 'main', -1, 0, 1, 13, '{{messages}}', '', ''),
(22, 'main', 4, 0, 0, 99999, 'Resend Activation Email', 'users/verify_resend.php', 'fa fa-exclamation-triangle');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `messages`
--

INSERT INTO `messages` (`id`, `msg_from`, `msg_to`, `msg_body`, `msg_read`, `msg_thread`, `deleted`, `sent_on`) VALUES
(1, 1, 2, '&lt;p&gt;fgds&lt;/p&gt;', 0, 1, 0, '2017-08-06 00:13:47'),
(2, 1, 2, '&lt;p&gt;Did it work?&lt;/p&gt;', 0, 2, 0, '2017-09-09 15:10:09');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `archive_from` int(1) NOT NULL DEFAULT '0',
  `archive_to` int(1) NOT NULL DEFAULT '0',
  `hidden_from` int(1) NOT NULL DEFAULT '0',
  `hidden_to` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `message_threads`
--

INSERT INTO `message_threads` (`id`, `msg_to`, `msg_from`, `msg_subject`, `last_update`, `last_update_by`, `archive_from`, `archive_to`, `hidden_from`, `hidden_to`) VALUES
(1, 2, 1, 'Testiing123', '2017-08-06 00:13:47', 1, 0, 0, 0, 0),
(2, 2, 1, 'Testing Message Badge', '2017-09-09 15:10:09', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mqtt`
--

CREATE TABLE `mqtt` (
  `id` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `mqtt`
--

INSERT INTO `mqtt` (`id`, `server`, `port`, `username`, `password`, `nickname`) VALUES
(2, '192.168.0.222', 1883, '', '', 'Raspberry PI MQTT2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `is_archived` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `is_read`, `is_archived`, `date_created`, `date_read`, `last_updated`) VALUES
(11, 2, 'Test!', 1, 1, '2018-01-19 16:31:09', NULL, '2018-01-20 23:40:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `gpage` int(11) DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `re_auth` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `pages`
--

INSERT INTO `pages` (`id`, `page`, `title`, `gpage`, `private`, `re_auth`) VALUES
(1, 'index.php', 'Home', NULL, 0, 0),
(2, 'z_us_root.php', '', NULL, 0, 0),
(3, 'users/account.php', 'Account Dashboard', NULL, 1, 0),
(4, 'users/admin.php', 'Admin Dashboard', NULL, 1, 0),
(5, 'users/admin_page.php', 'Manage Page', NULL, 1, 0),
(6, 'users/admin_pages.php', 'Manage Pages', NULL, 1, 0),
(7, 'users/admin_permission.php', 'Manage Permission', NULL, 1, 0),
(8, 'users/admin_permissions.php', 'Manage Permissions', NULL, 1, 0),
(9, 'users/admin_user.php', 'Manage User', NULL, 1, 0),
(10, 'users/admin_users.php', 'Manage Users', NULL, 1, 1),
(11, 'users/edit_profile.php', 'Edit Profile', NULL, 1, 0),
(12, 'users/email_settings.php', 'Email Settings', NULL, 1, 0),
(13, 'users/email_test.php', 'Email Test', NULL, 1, 0),
(14, 'users/forgot_password.php', 'Forgotten Password', NULL, 0, 0),
(15, 'users/forgot_password_reset.php', 'Reset Forgotten Password', NULL, 0, 0),
(16, 'users/index.php', 'Home', NULL, 0, 0),
(17, 'users/init.php', '', NULL, 0, 0),
(18, 'users/join.php', 'Join', NULL, 0, 0),
(19, 'users/joinThankYou.php', 'Join', NULL, 0, 0),
(20, 'users/login.php', 'Login', NULL, 0, 0),
(21, 'users/logout.php', 'Logout', NULL, 0, 0),
(22, 'users/profile.php', 'Profile', NULL, 1, 0),
(23, 'users/times.php', '', NULL, 0, 0),
(24, 'users/user_settings.php', 'My Settings', NULL, 1, 0),
(25, 'users/verify.php', 'Account Verification', NULL, 0, 0),
(26, 'users/verify_resend.php', 'Account Verification', NULL, 0, 0),
(27, 'users/view_all_users.php', 'View All Users', NULL, 1, 0),
(28, 'usersc/empty.php', '', NULL, 0, 0),
(31, 'users/oauth_success.php', '', NULL, 0, 0),
(33, 'users/fb-callback.php', '', NULL, 0, 0),
(37, 'users/check_updates.php', 'Check For Updates', NULL, 1, 0),
(38, 'users/google_helpers.php', '', NULL, 0, 0),
(39, 'users/tomfoolery.php', 'Security Log', NULL, 1, 0),
(41, 'users/messages.php', 'My Messages', NULL, 1, 0),
(42, 'users/message.php', 'My Messages', NULL, 1, 0),
(44, 'users/admin_backup.php', 'Backup Files', NULL, 1, 0),
(45, 'users/maintenance.php', 'Maintenance', NULL, 0, 0),
(47, 'users/mqtt_settings.php', 'MQTT Settings', NULL, 1, 0),
(49, 'users/admin_verify.php', 'Verify Password', NULL, 1, 0),
(50, 'users/cron_manager.php', 'Cron Manager', NULL, 1, 0),
(51, 'users/cron_post.php', 'Post a Cron Job', NULL, 1, 0),
(52, 'users/admin_message.php', 'View Message', NULL, 1, 0),
(53, 'users/admin_messages.php', 'View Messages', NULL, 1, 0),
(55, 'users/admin_logs.php', 'Site Logs', NULL, 1, 0),
(56, 'users/admin_logs_exempt.php', 'Site Logs', NULL, 1, 0),
(57, 'users/admin_logs_manager.php', 'Site Logs', NULL, 1, 0),
(58, 'users/admin_logs_mapper.php', 'Site Logs', NULL, 1, 0),
(68, 'users/update.php', 'Update UserSpice', NULL, 1, 0),
(69, 'users/admin_menu_item.php', 'Manage Menus', NULL, 1, 0),
(70, 'users/admin_menus.php', 'Manage Menus', NULL, 1, 0),
(71, 'users/admin_menu.php', 'Manage Menus', NULL, 1, 0),
(72, 'users/admin_ips.php', 'Admin IPs', NULL, 1, 0),
(73, 'users/subscribe.php', '', NULL, 1, 0),
(74, 'users/admin_notifications.php', 'Admin Notifications', NULL, 1, 0),
(75, 'users/enable2fa.php', 'Two Factor Authentication', NULL, 1, 0),
(79, 'usersc/update.php', '', NULL, 1, 0),
(81, 'usersc/cupdate.php', '', NULL, 1, 0),
(82, 'config.example.php', '', NULL, 1, 0),
(83, 'config.php', '', NULL, 1, 0),
(84, 'gallery.php', '', NULL, 0, 0),
(85, 'usersc/upload.php', '', NULL, 1, 0),
(117, 'agenda/index.php', '', NULL, 0, 0),
(118, 'agenda/attend.php', '', NULL, 0, 0),
(119, 'galleries/test_gallery.php', 'Test Gallery', 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `permission_page_matches`
--

CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `permission_page_matches`
--

INSERT INTO `permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(2, 2, 27),
(3, 1, 24),
(4, 1, 22),
(5, 2, 13),
(6, 2, 12),
(7, 1, 11),
(8, 2, 10),
(9, 2, 9),
(10, 2, 8),
(11, 2, 7),
(12, 2, 6),
(13, 2, 5),
(14, 2, 4),
(15, 1, 3),
(16, 2, 37),
(17, 2, 39),
(19, 2, 40),
(21, 2, 41),
(23, 2, 42),
(27, 1, 42),
(28, 1, 27),
(29, 1, 41),
(30, 1, 40),
(31, 2, 44),
(32, 2, 47),
(33, 2, 51),
(34, 2, 50),
(35, 2, 49),
(36, 2, 53),
(37, 2, 52),
(38, 2, 68),
(39, 2, 55),
(40, 2, 56),
(41, 2, 71),
(42, 2, 58),
(43, 2, 57),
(44, 2, 53),
(45, 2, 74),
(46, 2, 75),
(47, 1, 75),
(48, 2, 80);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`) VALUES
(1, 1, '<h1>This is the Admin\'s bio. Testing</h1>'),
(2, 2, 'This is your bio');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(50) NOT NULL,
  `recaptcha` int(1) NOT NULL DEFAULT '0',
  `force_ssl` int(1) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT '0',
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `backup_dest` varchar(255) NOT NULL,
  `backup_source` varchar(255) NOT NULL,
  `backup_table` varchar(255) NOT NULL,
  `msg_notification` int(1) NOT NULL,
  `permission_restriction` int(1) NOT NULL,
  `auto_assign_un` int(1) NOT NULL,
  `page_permission_restriction` int(1) NOT NULL,
  `msg_blocked_users` int(1) NOT NULL,
  `msg_default_to` int(1) NOT NULL,
  `notifications` int(1) NOT NULL,
  `notif_daylimit` int(3) NOT NULL,
  `recap_public` varchar(100) NOT NULL,
  `recap_private` varchar(100) NOT NULL,
  `page_default_private` int(1) NOT NULL,
  `navigation_type` tinyint(1) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `custom_settings` int(1) NOT NULL,
  `system_announcement` varchar(255) NOT NULL,
  `twofa` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `settings`
--

INSERT INTO `settings` (`id`, `recaptcha`, `force_ssl`, `css_sample`, `us_css1`, `us_css2`, `us_css3`, `site_name`, `language`, `track_guest`, `site_offline`, `force_pr`, `glogin`, `fblogin`, `gid`, `gsecret`, `gredirect`, `ghome`, `fbid`, `fbsecret`, `fbcallback`, `graph_ver`, `finalredir`, `req_cap`, `req_num`, `min_pw`, `max_pw`, `min_un`, `max_un`, `messaging`, `snooping`, `echouser`, `wys`, `change_un`, `backup_dest`, `backup_source`, `backup_table`, `msg_notification`, `permission_restriction`, `auto_assign_un`, `page_permission_restriction`, `msg_blocked_users`, `msg_default_to`, `notifications`, `notif_daylimit`, `recap_public`, `recap_private`, `page_default_private`, `navigation_type`, `copyright`, `custom_settings`, `system_announcement`, `twofa`) VALUES
(1, 0, 0, 0, '../users/css/color_schemes/bootstrap.min.css', '../users/css/sb-admin.css', '../users/css/custom.css', 'UserSpice', 'en', 1, 0, 1, 0, 0, '', '', '', '', '', '', '', '', '', 1, 1, 6, 30, 4, 30, 1, 1, 1, 1, 0, '/', 'everything', '', 0, 0, 0, 0, 0, 1, 1, 7, '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI', '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe', 1, 0, 'UserSpice', 1, '', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `migration` varchar(15) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `updates`
--

INSERT INTO `updates` (`id`, `migration`, `applied_on`) VALUES
(15, '3GJYaKcqUtw7', '2018-01-16 23:05:58'),
(16, '3GJYaKcqUtz8', '2018-01-16 23:05:58');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `email_new` varchar(155) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `editmode` int(11) NOT NULL,
  `logins` int(100) NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  `vericode` varchar(15) NOT NULL,
  `active` int(1) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `msg_exempt` int(1) NOT NULL DEFAULT '0',
  `last_confirm` datetime DEFAULT NULL,
  `protected` int(1) NOT NULL DEFAULT '0',
  `dev_user` int(1) NOT NULL DEFAULT '0',
  `msg_notification` int(1) NOT NULL DEFAULT '1',
  `force_pr` int(1) NOT NULL DEFAULT '0',
  `twoKey` varchar(16) DEFAULT NULL,
  `twoEnabled` int(1) DEFAULT '0',
  `cloak_allowed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `email`, `email_new`, `username`, `password`, `fname`, `lname`, `permissions`, `editmode`, `logins`, `account_owner`, `account_id`, `company`, `join_date`, `last_login`, `email_verified`, `vericode`, `active`, `oauth_provider`, `oauth_uid`, `gender`, `locale`, `gpluslink`, `picture`, `created`, `modified`, `fb_uid`, `un_changed`, `msg_exempt`, `last_confirm`, `protected`, `dev_user`, `msg_notification`, `force_pr`, `twoKey`, `twoEnabled`, `cloak_allowed`) VALUES
(1, 'userspicephp@gmail.com', NULL, 'admin', '$2y$12$1v06jm2KMOXuuo3qP7erTuTIJFOnzhpds1Moa8BadnUUeX0RV3ex.', 'The', 'Admin', 1, 1, 17, 1, 0, 'UserSpice', '2016-01-01 00:00:00', '2018-01-21 02:57:06', 1, 'SsCzd1kY9sjkY9T', 0, '', '', '', '', '', '', '0000-00-00 00:00:00', '1899-11-30 00:00:00', '', 0, 1, '2018-01-21 03:57:06', 1, 0, 1, 0, NULL, 0, 0),
(2, 'noreply@userspice.com', NULL, 'user', '$2y$12$HZa0/d7evKvuHO8I3U8Ff.pOjJqsGTZqlX8qURratzP./EvWetbkK', 'Sample', 'User', 1, 0, 0, 1, 0, 'none', '2016-01-02 00:00:00', '2017-10-08 15:47:41', 1, 'Ou4NwBpAHVKUBE4', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, NULL, 0, 0, 1, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_online`
--

CREATE TABLE `users_online` (
  `id` int(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users_online`
--

INSERT INTO `users_online` (`id`, `ip`, `timestamp`, `user_id`, `session`) VALUES
(1, '94.209.241.31', '1516504060', 1, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_permission_matches`
--

CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `user_permission_matches`
--

INSERT INTO `user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(100, 1, 1),
(101, 1, 2),
(102, 2, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `us_ip_blacklist`
--

CREATE TABLE `us_ip_blacklist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `last_user` int(11) NOT NULL DEFAULT '0',
  `reason` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `us_ip_blacklist`
--

INSERT INTO `us_ip_blacklist` (`id`, `ip`, `last_user`, `reason`) VALUES
(3, '192.168.0.21', 1, 0),
(4, '192.168.0.22', 1, 0),
(10, '192.168.0.222', 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `us_ip_list`
--

CREATE TABLE `us_ip_list` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `us_ip_list`
--

INSERT INTO `us_ip_list` (`id`, `ip`, `user_id`, `timestamp`) VALUES
(1, '::1', 1, '2017-10-09 15:20:03'),
(2, '94.209.241.31', 1, '2018-01-17 00:47:30');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `us_ip_whitelist`
--

CREATE TABLE `us_ip_whitelist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `us_ip_whitelist`
--

INSERT INTO `us_ip_whitelist` (`id`, `ip`) VALUES
(2, '192.168.0.21'),
(3, '192.168.0.23');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`regid`),
  ADD KEY `id` (`eventid`),
  ADD KEY `userid` (`userid`);

--
-- Indexen voor tabel `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `crons_logs`
--
ALTER TABLE `crons_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `groups_menus`
--
ALTER TABLE `groups_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexen voor tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `logs_exempt`
--
ALTER TABLE `logs_exempt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logs_exempt_type` (`name`);

--
-- Indexen voor tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `mqtt`
--
ALTER TABLE `mqtt`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`) USING BTREE;

--
-- Indexen voor tabel `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `us_ip_list`
--
ALTER TABLE `us_ip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `attendees`
--
ALTER TABLE `attendees`
  MODIFY `regid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT voor een tabel `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT voor een tabel `crons`
--
ALTER TABLE `crons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `crons_logs`
--
ALTER TABLE `crons_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT voor een tabel `groups_menus`
--
ALTER TABLE `groups_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT voor een tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT voor een tabel `logs_exempt`
--
ALTER TABLE `logs_exempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT voor een tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `mqtt`
--
ALTER TABLE `mqtt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT voor een tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT voor een tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT voor een tabel `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT voor een tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT voor een tabel `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT voor een tabel `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT voor een tabel `us_ip_list`
--
ALTER TABLE `us_ip_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `attendees`
--
ALTER TABLE `attendees`
  ADD CONSTRAINT `attendees_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
