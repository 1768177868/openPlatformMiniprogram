-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-07-02 18:26:19
-- 服务器版本： 5.6.47-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `open2.grazy.cn`
--

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin`
--

CREATE TABLE `fa_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

--
-- 转存表中的数据 `fa_admin`
--

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '7f3d7d60ef26a35e27f51b83033e6884', '91f031', '/assets/img/avatar.png', '1768177868@qq.com', 0, 1592983683, '175.0.57.90', 1492186163, 1592983683, 'e0eaf879-aa9d-40fd-bee1-504eb72336fd', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin_log`
--

CREATE TABLE `fa_admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';

--
-- 转存表中的数据 `fa_admin_log`
--

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1, 1, 'admin', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php', '登录', '{\"url\":\"\\/ZpQNKcLtFz.php\",\"__token__\":\"5e709fd7acb98921773c5c58b027f663\",\"username\":\"admin\",\"captcha\":\"knp8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592289504),
(2, 1, 'admin', '/ZpQNKcLtFz.php/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"28918\",\"token\":\"151678ad-c076-4e66-a82e-f68b948fc7e3\",\"version\":\"1.0.6\",\"faversion\":\"1.0.0.20200506_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592289918),
(3, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592289918),
(4, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"9647eab7ad1c8486953cb87927e811b0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"business\",\"title\":\"\\u5546\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-male\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290068),
(5, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290068),
(6, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"b35d44c952baf8bd3314024d8a111f82\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"miniprogram\",\"title\":\"\\u5c0f\\u7a0b\\u5e8f\\u7ba1\\u7406\",\"icon\":\"fa fa-wechat\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290256),
(7, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290256),
(8, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"45f09373146dc025e28ee4f23ed82c53\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/index\",\"title\":\"\\u5c0f\\u7a0b\\u5e8f\\u5217\\u8868\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290332),
(9, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290332),
(10, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"6c5f6805b5ac122e4add0630b5b4e575\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/template\",\"title\":\"\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290415),
(11, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290415),
(12, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"11ce5bf89266b514086e55fae4e7d3e2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"miniprogram\\/drafts\",\"title\":\"\\u8349\\u7a3f\\u7bb1\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290597),
(13, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290597),
(14, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/96?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"039f2942bb5af9ba87a9f1ea46d19e93\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/drafts\",\"title\":\"\\u8349\\u7a3f\\u7bb1\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"96\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290615),
(15, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290615),
(16, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/96?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"7c87d4cc39d077b42a97281f6f8295a7\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/drafts\",\"title\":\"\\u8349\\u7a3f\\u7bb1\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"96\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290764),
(17, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290764),
(18, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/95?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"922b16c2b2169cbdcbabc7651579ad8e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/template\",\"title\":\"\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290782),
(19, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290782),
(20, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/94?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"983598b936b4f3f17cb87aee429f5967\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\\/index\",\"title\":\"\\u5c0f\\u7a0b\\u5e8f\\u5217\\u8868\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"94\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290786),
(21, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592290786),
(22, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/multi/ids/4', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297290),
(23, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297290),
(24, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/del/ids/94,95,96', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"94,95,96\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297301),
(25, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297301),
(26, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"996376717e410e7f46a2336a2a844d7c\",\"row\":{\"name\":\"\\u4e2d\\u5b87\\u540e\\u53f0\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297325),
(27, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"28b92c8ae00422b50c05fc67034fe195\",\"row\":{\"name\":\"\\u4e2d\\u5b87\\u8fd0\\u7ef4\\u540e\\u53f0\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297336),
(28, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"c54868b3722a1f4c846b1ff7dc82e202\",\"row\":{\"name\":\"\\u4e2d\\u5b87\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297345),
(29, 1, 'admin', '/ZpQNKcLtFz.php/index/login', '登录', '{\"__token__\":\"a033f1ea86ead462f915674179aa9045\",\"username\":\"admin\",\"captcha\":\"yyq7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297565),
(30, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297802),
(31, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297807),
(32, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297832),
(33, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297832),
(34, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297832),
(35, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297832),
(36, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297857),
(37, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592297857),
(38, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298096),
(39, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298100),
(40, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298101),
(41, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298101),
(42, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298102),
(43, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298102),
(44, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298105),
(45, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298105),
(46, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_business\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"name\",\"domain\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_miniprogram\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"miniprogram_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298208),
(47, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_business\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"name\",\"domain\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_miniprogram\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"miniprogram_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298208),
(48, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298209),
(49, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298221),
(50, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298226),
(51, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298229),
(52, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298233),
(53, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298238),
(54, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298240),
(55, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Business.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298262),
(56, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Business.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298270),
(57, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298270),
(58, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298424),
(59, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298432),
(60, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_template\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298442),
(61, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_template\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298446),
(62, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298446),
(63, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298449),
(64, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298453),
(65, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298454),
(66, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Template.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298456),
(67, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Template.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298456),
(68, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298457),
(69, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/105?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1250c1e1906b75b7f2b4eec554a4cb91\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"template\",\"title\":\"\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"105\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298568),
(70, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298569),
(71, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298587),
(72, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_drafts\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298591),
(73, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_drafts\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298593),
(74, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_drafts\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298594),
(75, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298594),
(76, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298596),
(77, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298601),
(78, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298604),
(79, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Drafts.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298606),
(80, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Drafts.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298606),
(81, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298606),
(82, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/114?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"db23473d78d04961f8a3df5c86d6f6f5\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"drafts\",\"title\":\"\\u8349\\u7a3f\\u7bb1\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"114\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298632),
(83, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298632),
(84, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298747),
(85, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298750),
(86, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298753),
(87, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298753),
(88, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298753),
(89, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298753),
(90, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298756),
(91, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298756),
(92, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298757),
(93, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298757),
(94, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298757),
(95, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298757),
(96, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298763),
(97, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298763),
(98, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"appid\",\"name\",\"qrcode\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]},\"3\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298962),
(99, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"appid\",\"name\",\"qrcode\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]},\"3\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298963),
(100, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298964),
(101, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298966),
(102, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298970),
(103, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298975),
(104, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592298980),
(105, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d4f7167604dd2794a8d3be32b40111bb\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"miniprogram\",\"title\":\"\\u5c0f\\u7a0b\\u5e8f\",\"icon\":\"fa fa-wechat\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299004),
(106, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299004),
(107, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ba736fc16be8a03e890e7ffd06eac5cb\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"miniprogram\",\"title\":\"\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\",\"icon\":\"fa fa-wechat\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299015),
(108, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299015),
(109, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299019),
(110, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299021),
(111, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299026),
(112, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299031),
(113, 1, 'admin', '/ZpQNKcLtFz.php/command/execute/ids/7', '在线命令管理 运行', '{\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299122),
(114, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299128),
(115, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299137),
(116, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299138),
(117, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299138),
(118, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299138),
(119, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299139),
(120, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299141),
(121, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299141),
(122, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299142),
(123, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299142),
(124, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299142),
(125, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299142),
(126, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299144),
(127, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299144),
(128, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"appid\",\"name\",\"qrcode\",\"status\",\"template_id\",\"business_id\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]},\"3\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299172),
(129, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299172),
(130, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299187),
(131, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299193),
(132, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299196),
(133, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299196),
(134, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299196),
(135, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299196),
(136, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299199),
(137, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299199),
(138, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299229),
(139, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299229),
(140, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299229),
(141, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299229),
(142, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299246),
(143, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299246);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(144, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"appid\",\"name\",\"qrcode\",\"status\",\"template_id\",\"business_id\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]},\"3\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299265),
(145, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299265),
(146, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299272),
(147, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299280),
(148, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299280),
(149, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299280),
(150, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299281),
(151, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299281),
(152, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299284),
(153, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299285),
(154, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"appid\",\"name\",\"qrcode\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299307),
(155, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"appid\",\"name\",\"qrcode\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299307),
(156, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299308),
(157, 1, 'admin', '/ZpQNKcLtFz.php/command/del/ids/11,10,9,8,7,6,5,4,3,2', '在线命令管理 删除', '{\"action\":\"del\",\"ids\":\"11,10,9,8,7,6,5,4,3,2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299317),
(158, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299357),
(159, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_miniprogram\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299364),
(160, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299379),
(161, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299379),
(162, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299379),
(163, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299380),
(164, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299386),
(165, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_template\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299386),
(166, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299409),
(167, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299409),
(168, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299409),
(169, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299409),
(170, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_drafts\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299415),
(171, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_drafts\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299415),
(172, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299420),
(173, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_business\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299420),
(174, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"appid\",\"name\",\"qrcode\",\"status\",\"template_id\",\"business_id\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]},\"3\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299462),
(175, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_miniprogram\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"appid\",\"name\",\"qrcode\",\"status\",\"template_id\",\"business_id\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"fa_template\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"template_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"version\"]},\"3\":{\"relation\":\"fa_business\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"business_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299463),
(176, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299463),
(177, 1, 'admin', '/ZpQNKcLtFz.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299475),
(178, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299477),
(179, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299480),
(180, 1, 'admin', '/ZpQNKcLtFz.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299482),
(181, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Miniprogram.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299484),
(182, 1, 'admin', '/ZpQNKcLtFz.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Miniprogram.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299486),
(183, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299486),
(184, 1, 'admin', '/ZpQNKcLtFz.php/command/execute/ids/13', '在线命令管理 运行', '{\"ids\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299508),
(185, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"64e09505a2a41eabe53aeaf65ac3e581\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"wechatminiprogram\",\"title\":\"\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\",\"icon\":\"fa fa-wechat\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299554),
(186, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299555),
(187, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"dadaf0b6668ef39126a327eb0a872e22\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"wechat\\/miniprogram\",\"title\":\"\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\",\"icon\":\"fa fa-wechat\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299581),
(188, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299581),
(189, 1, 'admin', '/ZpQNKcLtFz.php/command/execute/ids/14', '在线命令管理 运行', '{\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299590),
(190, 1, 'admin', '/ZpQNKcLtFz.php/auth/rule/edit/ids/131?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b47a0137d9fcee57632a2411161adc45\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"miniprogram\",\"title\":\"\\u5c0f\\u7a0b\\u5e8f\\u7ba1\\u7406\",\"icon\":\"fa fa-navicon\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"131\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299616),
(191, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299616),
(192, 1, 'admin', '/ZpQNKcLtFz.php/ajax/weigh', '', '{\"ids\":\"1,2,6,7,8,3,5,9,10,11,12,4,66,67,73,79,85,92,93,131,105,114\",\"changeid\":\"131\",\"pid\":\"93\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299624),
(193, 1, 'admin', '/ZpQNKcLtFz.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592299624),
(194, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/index', '小程序管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1592300703),
(195, 1, 'admin', '/ZpQNKcLtFz.php/business/add?dialog=1', '商户管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"111\",\"domain\":\"111\",\"remarks\":\"11111\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592377358),
(196, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/index', '小程序管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592377436),
(197, 1, 'admin', '/ZpQNKcLtFz.php/business/edit/ids/1?dialog=1', '商户管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"111\",\"domain\":\"111\",\"remarks\":\"111222\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592377517),
(198, 1, 'admin', '/ZpQNKcLtFz.php/business/edit/ids/1?dialog=1', '商户管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"111\",\"domain\":\"11\",\"remarks\":\"111222\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592377522),
(199, 1, 'admin', '/ZpQNKcLtFz.php/business/destroy/ids/1', '商户管理 真实删除', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592383546),
(200, 1, 'admin', '/ZpQNKcLtFz.php/business/authorize/ids/1', '商户管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592384429),
(201, 1, 'admin', '/ZpQNKcLtFz.php/business/authorize/ids/1', '商户管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592384686),
(202, 1, 'admin', '/ZpQNKcLtFz.php/business/authorize/ids/1', '商户管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592385814),
(203, 1, 'admin', '/ZpQNKcLtFz.php/business/authorize/ids/1', '商户管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592385816),
(204, 1, 'admin', '/ZpQNKcLtFz.php/business/add?dialog=1', '商户管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"222\",\"domain\":\"222\",\"remarks\":\"222222\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592392320),
(205, 1, 'admin', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fbusiness%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/ZpQNKcLtFz.php\\/business?ref=addtabs\",\"__token__\":\"893ff0c70c764745b4c0610621d665f6\",\"username\":\"admin\",\"captcha\":\"qawc\"}', '175.0.59.145', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592474133),
(206, 1, 'admin', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fgeneral%2Fconfig%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/ZpQNKcLtFz.php\\/general\\/config?ref=addtabs\",\"__token__\":\"cbfcaf49b74b96971a7047cac7cae458\",\"username\":\"admin\",\"captcha\":\"xurk\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592535247),
(207, 1, 'admin', '/ZpQNKcLtFz.php/category/del/ids/5,7,11,10,6,9,8,2,4,3,1', '分类管理 删除', '{\"action\":\"del\",\"ids\":\"5,7,11,10,6,9,8,2,4,3,1\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536561),
(208, 1, 'admin', '/ZpQNKcLtFz.php/category/del/ids/13,12', '分类管理 删除', '{\"action\":\"del\",\"ids\":\"13,12\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536569),
(209, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"98a4e985fa58fc56cb54a702548d8f10\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;user&quot;:&quot;User&quot;,&quot;example&quot;:&quot;Example&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536583),
(210, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"7d8bd946fae359c0325b36f6e7bbf3f0\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;user&quot;:&quot;User&quot;,&quot;example&quot;:&quot;Example&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536589),
(211, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"ff8467c154b2a0b676fc7a5efcf210d7\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;user&quot;:&quot;User&quot;,&quot;example&quot;:&quot;Example&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536606),
(212, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"606aaab2a198fe6e9194addb6cc6f0da\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;user&quot;:&quot;User&quot;,&quot;example&quot;:&quot;Example&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536632),
(213, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"0990e2bbaca0490fd9a63c8bfec59d55\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536643),
(214, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"56f99dadfa59c21b92d38d4b62068072\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536657),
(215, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"f946c57af09fc7888f17af5239eaf5f4\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;openPlatform&quot;:&quot;OpenPlatform&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536704),
(216, 1, 'admin', '/ZpQNKcLtFz.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"725be57c915603bc1094cb3213737ba5\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;Default&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;Basic&quot;,&quot;email&quot;:&quot;Email&quot;,&quot;dictionary&quot;:&quot;Dictionary&quot;,&quot;openPlatform&quot;:&quot;\\u5fae\\u4fe1\\u5f00\\u653e\\u5e73\\u53f0\\u914d\\u7f6e&quot;}\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592536857),
(217, 0, 'Unknown', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fdashboard%3Fref%3Daddtabs', '', '{\"url\":\"\\/ZpQNKcLtFz.php\\/dashboard?ref=addtabs\",\"__token__\":\"ba94a2442a8fab7dc97410de3c888a04\",\"username\":\"admin\",\"captcha\":\"m58p\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592789508),
(218, 0, 'Unknown', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fdashboard%3Fref%3Daddtabs', '', '{\"url\":\"\\/ZpQNKcLtFz.php\\/dashboard?ref=addtabs\",\"__token__\":\"8d0a5ca5a2685f9e98ee2acad92c70cb\",\"username\":\"admin\",\"captcha\":\"fasf\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592789530),
(219, 0, 'Unknown', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fdashboard%3Fref%3Daddtabs', '', '{\"url\":\"\\/ZpQNKcLtFz.php\\/dashboard?ref=addtabs\",\"__token__\":\"2099aaa8d0c98a9ed0ef1aa816033fba\",\"username\":\"admin\",\"captcha\":\"plqj\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592789952),
(220, 1, 'admin', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/ZpQNKcLtFz.php\\/dashboard?ref=addtabs\",\"__token__\":\"3fe232bfc1a23356d1188c6b6a79d41e\",\"username\":\"admin\",\"captcha\":\"bvdt\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592789960),
(221, 1, 'admin', '/ZpQNKcLtFz.php/index/login?url=%2FZpQNKcLtFz.php%2Fgeneral%2Fconfig%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/ZpQNKcLtFz.php\\/general\\/config?ref=addtabs\",\"__token__\":\"2252870a757ec0e494946f791786f154\",\"username\":\"admin\",\"captcha\":\"yvu3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1592983683),
(222, 1, 'admin', '/ZpQNKcLtFz.php/business/del/ids/2', '商户管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593394327),
(223, 1, 'admin', '/ZpQNKcLtFz.php/drafts/del/ids/0', '草稿箱 删除', '{\"action\":\"del\",\"params\":\"\",\"ids\":\"0\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593478178),
(224, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/0', '草稿箱', '{\"ids\":\"0\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480208),
(225, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480472),
(226, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480481),
(227, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480618),
(228, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480674),
(229, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480723),
(230, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480731),
(231, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480779),
(232, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480890),
(233, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480905),
(234, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593480937),
(235, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593481012),
(236, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593481400),
(237, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593481501),
(238, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593482981),
(239, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593483090),
(240, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/1', '草稿箱', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593483140),
(241, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593483234),
(242, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593483318),
(243, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/6', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593484858),
(244, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/8', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485144),
(245, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/5', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485151),
(246, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485166),
(247, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485168),
(248, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485203),
(249, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485205),
(250, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485207),
(251, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485209),
(252, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485211),
(253, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485219),
(254, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593485221),
(255, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487409),
(256, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487409),
(257, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487934),
(258, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487934),
(259, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/multi/ids/1', '小程序管理 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487983),
(260, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/multi/ids/1', '小程序管理 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593487986),
(261, 1, 'admin', '/ZpQNKcLtFz.php/business/edit/ids/1?dialog=1', '商户管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u957f\\u6c99\\u5929\\u6c14-\\u738b\\u5ba3\\u6210\",\"domain\":\"http:\\/\\/wxc.grazy.cn\",\"remarks\":\"111222\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593496771),
(262, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/9', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"9\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497029),
(263, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/10', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"10\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497031),
(264, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/11', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497033),
(265, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/12', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"12\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497034),
(266, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/13', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"13\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497036),
(267, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/14', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"14\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497038),
(268, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/15', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"15\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497040),
(269, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/7', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497042),
(270, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/16', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"16\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593497050),
(271, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/3', '草稿箱', '{\"ids\":\"3\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593505024),
(272, 1, 'admin', '/ZpQNKcLtFz.php/template/del/ids/17', '模板管理 删除', '{\"action\":\"del\",\"ids\":\"17\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593505081),
(273, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"fsdf\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593514194),
(274, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"fsdfsafs\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593514200),
(275, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593514228),
(276, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"fsfsafas\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515693),
(277, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"yrtygse\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515706),
(278, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515957),
(279, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515957),
(280, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/edit/ids/1?dialog=1', '小程序管理 编辑', '{\"dialog\":\"1\",\"row\":{\"appid\":\"wxd436d9a3a990967d\",\"name\":\"\\u957f\\u6c99\\u5929\\u6c14\\u67e5\\u8be2\",\"qrcode\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/VGrdmQdpAGZeqgaQ1umx5EGU83NScpYl9TIBAgibkDhOHialDao4H7Gz4WepuBZW00AwVogWkkQozXhKcaVgw7EA\\/0\",\"status\":\"1\",\"template_id\":\"0\",\"business_id\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515959),
(281, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515963),
(282, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515963),
(283, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/edit/ids/1?dialog=1', '小程序管理 编辑', '{\"dialog\":\"1\",\"row\":{\"appid\":\"wxd436d9a3a990967d\",\"name\":\"\\u957f\\u6c99\\u5929\\u6c14\\u67e5\\u8be21\",\"qrcode\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/VGrdmQdpAGZeqgaQ1umx5EGU83NScpYl9TIBAgibkDhOHialDao4H7Gz4WepuBZW00AwVogWkkQozXhKcaVgw7EA\\/0\",\"status\":\"1\",\"template_id\":\"0\",\"business_id\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515965),
(284, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515972),
(285, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593515973),
(286, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593516807),
(287, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"gdfgdg\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593516817),
(288, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"fsdfaf\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593516893),
(289, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"fsdf\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593516964),
(290, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517165),
(291, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517168),
(292, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517255),
(293, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517258);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(294, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{}\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517262),
(295, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{&quot;a&quot;:&quot;b&quot;}\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517295),
(296, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{&quot;a&quot;:&quot;b&quot;}\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517401),
(297, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{&quot;a&quot;:&quot;b&quot;}1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517405),
(298, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{&quot;a&quot;:&quot;b&quot;}\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517408),
(299, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517568),
(300, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517570),
(301, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/config/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"config\":\"{&quot;a&quot;:&quot;b&quot;}\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593517584),
(302, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"id\",\"asc\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593574804),
(303, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"id\",\"asc\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593574854),
(304, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"id\",\"asc\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593574983),
(305, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"id\",\"asc\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575056),
(306, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"id\",\"asc\"]],\"searchTable\":\"tbl\",\"showField\":\"title\",\"keyField\":\"id\",\"searchField\":[\"title\"],\"title\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575368),
(307, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575489),
(308, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575822),
(309, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575880),
(310, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593575989),
(311, 1, 'admin', '/ZpQNKcLtFz.php/drafts/addtotemplate/ids/4', '草稿箱', '{\"ids\":\"4\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593576082),
(312, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593576096),
(313, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582546),
(314, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582550),
(315, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582709),
(316, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582711),
(317, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"v11\",\"-\",\"testfsf\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"v11\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582713),
(318, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"v11\",\"-\",\"testfsf\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"v11\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582728),
(319, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"fsafdsfsafsafsaf\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"fsafdsfsafsafsaf\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593582731),
(320, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593586717),
(321, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593594834),
(322, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"19\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593594840),
(323, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593595312),
(324, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"19\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593595317),
(325, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593595362),
(326, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593595518),
(327, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"6\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593595551),
(328, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596200),
(329, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"18\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596204),
(330, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596349),
(331, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"6\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596353),
(332, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596509),
(333, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593596509),
(334, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593597204),
(335, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593597204),
(336, 1, 'admin', '/ZpQNKcLtFz.php/business/add?dialog=1', '商户管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"222\",\"domain\":\"222\",\"remarks\":\"\"}}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593597497),
(337, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593597637),
(338, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593597848),
(339, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593598020),
(340, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593656690),
(341, 1, 'admin', '/ZpQNKcLtFz.php/business/index', '商户管理 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593656690),
(342, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593658883),
(343, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/2,1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"18\",\"id\":\"2,1\"},\"ids\":\"2,1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593658890),
(344, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593658967),
(345, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/2,1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_version\":\"18\",\"id\":\"2,1\"},\"ids\":\"2,1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593658969),
(346, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659133),
(347, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659193),
(348, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/2,1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_id\":\"18\",\"id\":\"2,1\"},\"ids\":\"2,1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659598),
(349, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659716),
(350, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659755),
(351, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_id\":\"18\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659758),
(352, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659762),
(353, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/2,1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_id\":\"18\",\"ids\":\"2,1\"},\"ids\":\"2,1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593659771),
(354, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593660479),
(355, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_id\":\"19\",\"ids\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593660482),
(356, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593662110),
(357, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593662220),
(358, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593662367),
(359, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/multi/ids/1', '小程序管理 批量更新', '{\"action\":\"submitaudit\",\"ids\":\"1\",\"params\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593669782),
(360, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593670290),
(361, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593670485),
(362, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593670720),
(363, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593671639),
(364, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/commit_batch/ids/1?dialog=1', '小程序管理', '{\"dialog\":\"1\",\"row\":{\"template_id\":\"18\",\"ids\":\"1\"},\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593671641),
(365, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593671868),
(366, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672129),
(367, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release_batch/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672333),
(368, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release/ids/2', '小程序管理', '{\"ids\":\"2\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672459),
(369, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release/ids/2', '小程序管理', '{\"ids\":\"2\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672463),
(370, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672463),
(371, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release/ids/2', '小程序管理', '{\"ids\":\"2\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672529),
(372, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/release/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593672529),
(373, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/2', '小程序管理', '{\"ids\":\"2\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593673247),
(374, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593673247),
(375, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/2', '小程序管理', '{\"ids\":\"2\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593673268),
(376, 1, 'admin', '/ZpQNKcLtFz.php/miniprogram/submit_audit/ids/1', '小程序管理', '{\"ids\":\"1\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593673268),
(377, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593683652),
(378, 1, 'admin', '/ZpQNKcLtFz.php/template/index', '模板管理 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"200\",\"andOr\":\"AND\",\"orderBy\":[[\"user_version\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"user_version\",\"keyField\":\"id\",\"searchField\":[\"user_version\"],\"user_version\":\"\"}', '175.0.57.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 1593683656);

-- --------------------------------------------------------

--
-- 表的结构 `fa_attachment`
--

CREATE TABLE `fa_attachment` (
  `id` int(20) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';

--
-- 转存表中的数据 `fa_attachment`
--

INSERT INTO `fa_attachment` (`id`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group`
--

CREATE TABLE `fa_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';

--
-- 转存表中的数据 `fa_auth_group`
--

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group_access`
--

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';

--
-- 转存表中的数据 `fa_auth_group_access`
--

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_rule`
--

CREATE TABLE `fa_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

--
-- 转存表中的数据 `fa_auth_rule`
--

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal'),
(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 0, 1502035509, 1592297290, 0, 'normal'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal'),
(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal'),
(85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', 1, 1592289918, 1592289918, 0, 'normal'),
(86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592289918, 1592289918, 0, 'normal'),
(92, 'file', 0, 'business', '商户管理', 'fa fa-male', '', '', 1, 1592290068, 1592290068, 0, 'normal'),
(93, 'file', 0, 'wechat/miniprogram', '微信小程序', 'fa fa-wechat', '', '', 1, 1592290256, 1592299581, 0, 'normal'),
(97, 'file', 92, 'business/index', '查看', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(98, 'file', 92, 'business/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(99, 'file', 92, 'business/add', '添加', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(100, 'file', 92, 'business/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(101, 'file', 92, 'business/del', '删除', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(102, 'file', 92, 'business/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(103, 'file', 92, 'business/restore', '还原', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(104, 'file', 92, 'business/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592298270, 1592298270, 0, 'normal'),
(105, 'file', 93, 'template', '模板管理', 'fa fa-navicon', '', '', 1, 1592298456, 1592298568, 0, 'normal'),
(106, 'file', 105, 'template/index', '查看', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(107, 'file', 105, 'template/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(108, 'file', 105, 'template/add', '添加', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(109, 'file', 105, 'template/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(110, 'file', 105, 'template/del', '删除', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(111, 'file', 105, 'template/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(112, 'file', 105, 'template/restore', '还原', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(113, 'file', 105, 'template/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592298456, 1592298456, 0, 'normal'),
(114, 'file', 93, 'drafts', '草稿箱', 'fa fa-navicon', '', '', 1, 1592298606, 1592298632, 0, 'normal'),
(115, 'file', 114, 'drafts/index', '查看', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(116, 'file', 114, 'drafts/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(117, 'file', 114, 'drafts/add', '添加', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(118, 'file', 114, 'drafts/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(119, 'file', 114, 'drafts/del', '删除', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(120, 'file', 114, 'drafts/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(121, 'file', 114, 'drafts/restore', '还原', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(122, 'file', 114, 'drafts/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592298606, 1592298606, 0, 'normal'),
(123, 'file', 131, 'miniprogram/index', '查看', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(124, 'file', 131, 'miniprogram/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(125, 'file', 131, 'miniprogram/add', '添加', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(126, 'file', 131, 'miniprogram/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(127, 'file', 131, 'miniprogram/del', '删除', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(128, 'file', 131, 'miniprogram/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(129, 'file', 131, 'miniprogram/restore', '还原', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(130, 'file', 131, 'miniprogram/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1592299486, 1592299590, 0, 'normal'),
(131, 'file', 93, 'miniprogram', '小程序管理', 'fa fa-navicon', '', '', 1, 1592299590, 1592299616, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_business`
--

CREATE TABLE `fa_business` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户名称',
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户域名',
  `remarks` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `miniprogram_id` int(11) DEFAULT '0' COMMENT '小程序',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商户管理';

--
-- 转存表中的数据 `fa_business`
--

INSERT INTO `fa_business` (`id`, `name`, `domain`, `remarks`, `miniprogram_id`, `createtime`, `updatetime`, `deletetime`) VALUES
(1, '长沙天气-王宣成', 'http://wxc.grazy.cn', '111222', 1, 1592377358, 1593496771, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fa_category`
--

CREATE TABLE `fa_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';

-- --------------------------------------------------------

--
-- 表的结构 `fa_command`
--

CREATE TABLE `fa_command` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) UNSIGNED DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线命令表';

--
-- 转存表中的数据 `fa_command`
--

INSERT INTO `fa_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES
(1, 'crud', '[\"--table=fa_business\",\"--fields=id,name,domain,createtime\",\"--relation=fa_miniprogram\",\"--relationmode=belongsto\",\"--relationforeignkey=miniprogram_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=fa_business --fields=id,name,domain,createtime --relation=fa_miniprogram --relationmode=belongsto --relationforeignkey=miniprogram_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1592298208, 1592298208, 1592298208, 'successed'),
(12, 'crud', '[\"--force=1\",\"--table=fa_miniprogram\",\"--fields=id,appid,name,qrcode,status,template_id,business_id,createtime\",\"--relation=fa_template\",\"--relationmode=belongsto\",\"--relationforeignkey=template_id\",\"--relationprimarykey=id\",\"--relationfields=version\",\"--relation=fa_business\",\"--relationmode=belongsto\",\"--relationforeignkey=business_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=fa_miniprogram --fields=id,appid,name,qrcode,status,template_id,business_id,createtime --relation=fa_template --relationmode=belongsto --relationforeignkey=template_id --relationprimarykey=id --relationfields=version --relation=fa_business --relationmode=belongsto --relationforeignkey=business_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1592299462, 1592299462, 1592299463, 'successed'),
(13, 'menu', '[\"--controller=Miniprogram\"]', 'php think menu --controller=Miniprogram', 'Build Successed!', 1592299486, 1592299486, 1592299486, 'successed'),
(14, 'menu', '[\"--controller=Miniprogram\"]', 'php think menu --controller=Miniprogram', 'Build Successed!', 1592299508, 1592299508, 1592299508, 'successed'),
(15, 'menu', '[\"--controller=Miniprogram\"]', 'php think menu --controller=Miniprogram', 'Build Successed!', 1592299590, 1592299590, 1592299590, 'successed');

-- --------------------------------------------------------

--
-- 表的结构 `fa_config`
--

CREATE TABLE `fa_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';

--
-- 转存表中的数据 `fa_config`
--

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '中宇', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"openPlatform\":\"微信开放平台配置\"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', ''),
(18, 'appid', 'openPlatform', 'appid', '', 'string', ' ', '', '', ''),
(19, 'secret', 'openPlatform', 'secret', '', 'string', ' ', '', '', ''),
(20, 'token', 'openPlatform', 'token', '', 'string', 'weixin', '', '', ''),
(21, 'aes_key', 'openPlatform', 'aes_key', '', 'string', ' ', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_drafts`
--

CREATE TABLE `fa_drafts` (
  `id` int(11) NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '版本号',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='草稿箱';

-- --------------------------------------------------------

--
-- 表的结构 `fa_ems`
--

CREATE TABLE `fa_ems` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';

-- --------------------------------------------------------

--
-- 表的结构 `fa_miniprogram`
--

CREATE TABLE `fa_miniprogram` (
  `id` int(11) NOT NULL,
  `appid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '小程序名称',
  `qrcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '小程序码',
  `authorizer_token` text COLLATE utf8mb4_unicode_ci COMMENT '接口调用令牌信息',
  `authorizer_info` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '授权信息',
  `status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态:0=未发布,1=审核失败,2=审核失败,3=进行中',
  `template_id` int(11) DEFAULT '0',
  `template_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模板版本',
  `business_id` int(11) DEFAULT '0',
  `config` text COLLATE utf8mb4_unicode_ci COMMENT '配置',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序管理';

--
-- 转存表中的数据 `fa_miniprogram`
--

INSERT INTO `fa_miniprogram` (`id`, `appid`, `name`, `qrcode`, `authorizer_token`, `authorizer_info`, `status`, `template_id`, `template_version`, `business_id`, `config`, `createtime`, `updatetime`, `deletetime`) VALUES
(1, 'wxd436d9a3a990967d', '长沙天气查询', 'http://mmbiz.qpic.cn/mmbiz_jpg/VGrdmQdpAGZeqgaQ1umx5EGU83NScpYl9TIBAgibkDhOHialDao4H7Gz4WepuBZW00AwVogWkkQozXhKcaVgw7EA/0', '{\"authorizer_access_token\":\"34_0lFf92lC0tbly8xSpLtOsfK7BUKUxhzh2a_4EVJf1q2k1ooAsOsJ-izHD0hrJjjfaityJ89npclCLjrYtwsp4M_5m_d_o67ZTApGsWKGJs1HeR8iYYSr8uMrZQgewsy55tsaa3UZmL_gBFebJVMfAIDZLC\",\"authorizer_refresh_token\":\"refreshtoken@@@egxO4OSS2ahY_FhF_LR2I8M7oTv139p4nAn0M7pkm8k\",\"expires_in\":1593683044}', '{\"nick_name\":\"\\u957f\\u6c99\\u5929\\u6c14\\u67e5\\u8be2\",\"head_img\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/KZp4H9BmNzrnqhAncz7zCX8qmYsvWQXM2dNgwhanRAs3p05FyFr4bJ1OExT4Ph3hb1wmTjvwNFctmvKxyDY0IWaToiaYhk30o\\/0\",\"service_type_info\":{\"id\":0},\"verify_type_info\":{\"id\":-1},\"user_name\":\"gh_8164993e1b32\",\"alias\":\"\",\"qrcode_url\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/VGrdmQdpAGZeqgaQ1umx5EGU83NScpYl9TIBAgibkDhOHialDao4H7Gz4WepuBZW00AwVogWkkQozXhKcaVgw7EA\\/0\",\"business_info\":{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0},\"idc\":1,\"principal_name\":\"\\u4e2a\\u4eba\",\"signature\":\"\\u67e5\\u8be2\\u5929\\u6c14\\u72b6\\u51b5\",\"MiniProgramInfo\":{\"network\":{\"RequestDomain\":[\"https:\\/\\/free-api.heweather.com\",\"https:\\/\\/api.map.baidu.com\"],\"WsRequestDomain\":[\"wss:\\/\\/free-api.heweather.com\"],\"UploadDomain\":[\"https:\\/\\/free-api.heweather.com\"],\"DownloadDomain\":[\"https:\\/\\/free-api.heweather.com\"],\"BizDomain\":[],\"UDPDomain\":[]},\"categories\":[{\"first\":\"\\u5de5\\u5177\",\"second\":\"\\u5929\\u6c14\"}],\"visit_status\":0}}', '3', 19, 'v1.3', 1, '{\"a\":\"b\"}', 1592794239, 1593676044, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fa_sms`
--

CREATE TABLE `fa_sms` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';

-- --------------------------------------------------------

--
-- 表的结构 `fa_test`
--

CREATE TABLE `fa_test` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';

--
-- 转存表中的数据 `fa_test`
--

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `json`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, NULL, 0, 1, 'normal', '1');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user`
--

CREATE TABLE `fa_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';

--
-- 转存表中的数据 `fa_user`
--

INSERT INTO `fa_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-15', '', '0.00', 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_group`
--

CREATE TABLE `fa_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';

--
-- 转存表中的数据 `fa_user_group`
--

INSERT INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_money_log`
--

CREATE TABLE `fa_user_money_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_rule`
--

CREATE TABLE `fa_user_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';

--
-- 转存表中的数据 `fa_user_rule`
--

INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal'),
(2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal'),
(3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal'),
(4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal'),
(5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal'),
(6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal'),
(7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal'),
(8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal'),
(9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal'),
(10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal'),
(11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal'),
(12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_score_log`
--

CREATE TABLE `fa_user_score_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';

-- --------------------------------------------------------

--
-- 表的结构 `fa_user_token`
--

CREATE TABLE `fa_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fa_admin`
--
ALTER TABLE `fa_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- Indexes for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group_access`
--
ALTER TABLE `fa_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `weigh` (`weigh`);

--
-- Indexes for table `fa_business`
--
ALTER TABLE `fa_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `fa_command`
--
ALTER TABLE `fa_command`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fa_config`
--
ALTER TABLE `fa_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fa_drafts`
--
ALTER TABLE `fa_drafts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_ems`
--
ALTER TABLE `fa_ems`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fa_miniprogram`
--
ALTER TABLE `fa_miniprogram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_sms`
--
ALTER TABLE `fa_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_test`
--
ALTER TABLE `fa_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user`
--
ALTER TABLE `fa_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `fa_user_group`
--
ALTER TABLE `fa_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user_token`
--
ALTER TABLE `fa_user_token`
  ADD PRIMARY KEY (`token`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fa_admin`
--
ALTER TABLE `fa_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=379;

--
-- 使用表AUTO_INCREMENT `fa_attachment`
--
ALTER TABLE `fa_attachment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- 使用表AUTO_INCREMENT `fa_business`
--
ALTER TABLE `fa_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `fa_command`
--
ALTER TABLE `fa_command`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `fa_config`
--
ALTER TABLE `fa_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `fa_drafts`
--
ALTER TABLE `fa_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fa_ems`
--
ALTER TABLE `fa_ems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fa_miniprogram`
--
ALTER TABLE `fa_miniprogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `fa_sms`
--
ALTER TABLE `fa_sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fa_test`
--
ALTER TABLE `fa_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_user`
--
ALTER TABLE `fa_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_user_group`
--
ALTER TABLE `fa_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fa_user_money_log`
--
ALTER TABLE `fa_user_money_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fa_user_rule`
--
ALTER TABLE `fa_user_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `fa_user_score_log`
--
ALTER TABLE `fa_user_score_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
