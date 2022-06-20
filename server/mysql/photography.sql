-- phpMyAdmin SQL Dump

-- version 4.7.4

-- https://www.phpmyadmin.net/

--

-- Host: 127.0.0.1

-- Generation Time: 2022-06-20 06:44:49

-- 服务器版本： 10.1.28-MariaDB

-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT = 0;

START TRANSACTION;

SET time_zone = "+00:00";

-- #设置客户端连接服务器端的编码

set names utf8;

-- #丢弃数据库,如果存在

drop database if exists photography;

-- #创建新的数据库,设置存储字符的编码

CREATE DATABASE photography charset=utf8;

-- #进入数据库

use photography;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Database: `photography`

--

-- --------------------------------------------------------

--

-- 表的结构 `py_aboutus`

--

CREATE TABLE `py_aboutus` (
    `desc_text` varchar(32) DEFAULT NULL,
    `content` varchar(20000) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_aboutus`

--

INSERT INTO
    `py_aboutus` (`desc_text`, `content`)
VALUES
    (
        '关于我们',
        '<div class=\"dm\">\r\n<div class=\"dz\">\r\n<div class=\"dz2\">\r\n<p>各店地址及联系方式:</p>\r\n</div>\r\n<div>\r\n<p>网络销售联系电话：63109071 / 5936 1005</p>\r\n<p>陶然亭店：西城区南纬路41号楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：67080389</p>\r\n <p>国 贸\r\n店：朝阳区光华路北3号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：66011033</p>\r\n<p>张自忠店：东城区东四北大街甲201号</p>\r\n<div class=\"dz3\">\r\n<p>业务联系电话：13501014101</p>\r\n<p>售后服务电话：13501014101 </p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"image\">\r\n<img src=\"./img/aboutus/7018428ce85d43e6.png\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/26e5f7f0edc443e8.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/686aaa1f29a10c7d.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/061ceae68108140a.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/32c5b0433e3580c8.jpg\" alt=\"\" />\r\n</div>\r\n</div>'
    );

-- --------------------------------------------------------

--

-- 表的结构 `py_admin`

--

CREATE TABLE `py_admin` (
    `a_id` int(11) NOT NULL,
    `a_name` varchar(16) DEFAULT NULL,
    `a_password` varchar(16) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_admin`

--

INSERT INTO
    `py_admin` (`a_id`, `a_name`, `a_password`)
VALUES
    (1, 'admin', '123456');

-- --------------------------------------------------------

--

-- 表的结构 `py_camera`

--

CREATE TABLE `py_camera` (
    `c_id` int(11) NOT NULL,
    `c_family_id` int(11) DEFAULT NULL,
    `c_category` varchar(32) DEFAULT NULL,
    `c_price` decimal(8, 2) DEFAULT NULL,
    `c_title` varchar(128) DEFAULT NULL,
    `c_img` varchar(64) DEFAULT NULL,
    `c_stock` smallint(6) DEFAULT NULL,
    `c_shelf_time` bigint(20) DEFAULT NULL,
    `c_name` varchar(64) DEFAULT NULL,
    `c_type` varchar(64) DEFAULT NULL,
    `c_frame` varchar(32) DEFAULT NULL,
    `c_output` varchar(32) DEFAULT NULL,
    `c_shooting` varchar(32) DEFAULT NULL,
    `c_pixel` varchar(32) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_camera`

--

INSERT INTO
    `py_camera` (
        `c_id`,
        `c_family_id`,
        `c_category`,
        `c_price`,
        `c_title`,
        `c_img`,
        `c_stock`,
        `c_shelf_time`,
        `c_name`,
        `c_type`,
        `c_frame`,
        `c_output`,
        `c_shooting`,
        `c_pixel`
    )
VALUES
    (
        1,
        1,
        'canon',
        '43200.00',
        '佳能/Canon EOS 1DX MarkIII单反机身 EOS 1DX3代 1DX3',
        'c0152ccb9b2920bd.jpg',
        500,
        1655096567278,
        '佳能EOS-1DX Mark III',
        '单反相机',
        '全画幅',
        '14bit',
        '4K 60P',
        '3800-4500万'
    ),
    (
        2,
        2,
        'nikon',
        '43999.00',
        '尼康/Nikon D6 全画幅 单反相机机身',
        'a7bc068f9561d65b.png',
        500,
        1655096567278,
        '尼康/Nikon D6',
        '单反相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '3000-3500万'
    ),
    (
        3,
        3,
        'panasonic',
        '4098.00',
        '松下(Panasonic)G100K微单相机 数码相机 vlog相机 微单套机(12-32mm)4K视频 专业收音 美肤自拍 触摸屏',
        '0f58e595f60f6dd0.jpg',
        500,
        1655096567278,
        '松下G100',
        '数码相机',
        '中画幅',
        '12bit',
        '4K 30P',
        '3000-4000万'
    ),
    (
        4,
        4,
        'hasselblad',
        '39990.00',
        '哈苏(HASSELBLAD)X1D II 50C 中画幅无反数码相机',
        'c64b1ea0b9721cbf.jpg',
        500,
        1655096567278,
        '哈苏哈苏 X1D Ⅱ 50C',
        '数码相机',
        '中画幅',
        '不支持RAW',
        '不支持视频拍摄',
        '3000-5500万'
    ),
    (
        5,
        5,
        'sony',
        '15699.00',
        '索尼/SONY A7RIII A7R3A 全画幅微单 三代 数码相机单机身',
        'fe35fd8fc4fe06e1.jpg',
        500,
        1655096567278,
        '索尼/SONY A7RIII',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 60P',
        '3000-3800万'
    ),
    (
        6,
        6,
        'Fujifilm',
        '11190.00',
        '富士(FUJIFILM)【旗舰京品】XT3微单数码相机X-T3机身套机4KXT30升级版 ',
        '024b930cf2be7ec8.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)XT3',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '4000-4500万'
    ),
    (
        7,
        7,
        'leica',
        '45799.00',
        '徕卡(Leica)Q2全画幅便携数码相机 黑色19051 (4730万像素 4K视频录制 内置定焦镜头 )',
        'e036819be879179c.jpg',
        500,
        1655096567278,
        '徕卡Q2',
        '数码相机',
        '全画幅',
        '14bit',
        '4K 30P',
        '3000-4000万'
    ),
    (
        8,
        1,
        'canon',
        '5499.00',
        '佳能(Canon) EOS 800D单反相机 入门单反相机高清摄像佳能800D单机(不含镜头) 高级套餐(64G卡+电池+相机包+三脚架)',
        'a621bbee183f2f64.jpg',
        500,
        1655096567278,
        '佳能(Canon) EOS 800D',
        '单反相机',
        'APS-C画幅',
        '6bit',
        '1080P 60P',
        '3800-4500万'
    ),
    (
        9,
        1,
        'canon',
        '18538.00',
        '佳能(Canon) 5d4 5D Mark IV 专业全画幅单反相机单机/套机 4K视频单反相机 EF 50mm f/1.8 STM',
        'd02ed404fc0eb0c4.png',
        500,
        1655096567278,
        '佳能(Canon) EOS 600D',
        '单反相机',
        '全画幅',
        '6bit',
        '1080P 960P',
        '3000-4000万'
    ),
    (
        10,
        5,
        'sony',
        '9499.00',
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '45df69fb183e35f6.jpg',
        500,
        1655096567278,
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '数码相机',
        '全画幅',
        '6bit',
        '4K 60P',
        '3000-3800万'
    ),
    (
        11,
        6,
        'Fujifilm',
        '6499.00',
        '富士(FUJIFILM)X-T30 II/XT30 II 微单相机 套机(15-45mm镜头 ) 银色 2610万像素 18种胶片模拟 视频提升 ',
        '6f48a5aadff66186.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)X-T30',
        '微单相机',
        'APS-C',
        '14bit',
        '4K视频',
        '2000-3000万'
    ),
    (
        12,
        2,
        'nikon',
        '17598.00',
        '尼康(Nikon)Z 6 (Z6 )全画幅微单相机 数码相机 微单机身 Vlog相 Z5系列 Z5+24-50mm FX高入门套装',
        '1f3a8636e1fdcd00.jpg',
        200,
        1655205451519,
        '尼康(Nikon)Z 6 ',
        '微单相机',
        '全画幅',
        '14bit',
        '无视频输出',
        '2000-3000万'
    ),
    (
        13,
        2,
        'nikon',
        '7499.00',
        '尼康(Nikon) Zfc半画幅复古微单相机 高清旅游数码照相机 Z16-50/Z28 2.8套机 Z fc+Z16-50 f/3.5-6.3VR镜头 标配【送64G卡+相机包+UV等基础配件】',
        '202be185de428bf9.jpg',
        20,
        1655205451519,
        '尼康(Nikon)Z fc',
        '微单相机',
        'APS-C',
        '14bit',
        '4K视频',
        '2000-3000万'
    ),
    (
        14,
        7,
        'leica',
        '113550.00',
        '徕卡(Leica)M11旁轴数码相机套装 相机+35 1.4镜头银色+电池',
        'a6c9164605fb698e.jpg',
        10,
        1655205451519,
        '徕卡M11',
        '数码相机',
        '全画幅',
        '14bit',
        '4K',
        '5000-6000万'
    ),
    (
        15,
        7,
        'leica',
        '11800.00',
        '徕卡(Leica)D-LUX7时尚多功能便携相机套装徕卡dlux7套装微单相机入门【非现货需预定】 相机+相机包(棕色) 相机-银色',
        '1eceea7214786956.jpg',
        35,
        1655205451519,
        '徕卡(Leica)D-LUX7',
        '微单相机',
        '全画幅',
        '14bit',
        '无视频输出',
        '5000-6000万'
    ),
    (
        16,
        3,
        'panasonic',
        '3498.00',
        '松下(Panasonic)DMC-LX10数码相机4K高清摄像照相机大光圈口袋机 翻转触摸屏 官方标配',
        '12c594a93692a030.jpg',
        10,
        1655205451519,
        '松下(panasonic)DMC-LX10',
        '数码相机',
        '全画幅',
        '10bit',
        '4K',
        '2000-3000万'
    ),
    (
        17,
        4,
        'hasselblad',
        '48989.00',
        '哈苏(HASSELBLAD) X1D II 50C中画幅无反数码相机 微单 自动对焦 二代 哈苏X1D2+XCD45P镜头',
        'c119ed106ad50b28.jpg',
        5,
        1655205451519,
        '哈苏(HASSELBLAD)',
        '数码相机',
        '中画幅',
        '10bit',
        '2K 30P,1080P 60P',
        '5000-6000万'
    ),
    (
        18,
        5,
        'sony',
        '2058.00',
        'SONY 索尼DSC-H300长焦数码相机 家用旅游照相机2010万像素 35倍光学变焦',
        '5234c72a3f41da2dabb8466a134571ff.jpeg',
        68,
        1655625932154,
        'SONY 索尼 DSC-H300',
        '数码相机',
        '全画幅',
        '6bit',
        '无视频输出',
        '2010万'
    ),
    (
        19,
        2,
        'nikon',
        '6299.00',
        '尼康(Nikon) D5600数码单反相机 高清家用旅游数码相机 反转触摸屏 尼康18-140VR',
        '7492aeee5d158b6e8c1feba00ba135d3.jpg',
        80,
        1655626852271,
        '尼康(Nikon)D5600',
        '数码相机',
        'APS-C',
        '14bit',
        '1080P 60P',
        '2416万'
    ),
    (
        20,
        2,
        'nikon',
        '27199.00',
        '尼康(Nikon) D850 高端全画幅旗舰单反相机 高清数码相机 ',
        'c0b4d73039a5cc0a327d3ac80ba19cc85.jpeg',
        98,
        1655627964255,
        '尼康(Nikon)D850',
        '单反相机',
        '全画幅',
        '14bit',
        '4k 30p 1080p 60p',
        '3000万-4000万'
    ),
    (
        21,
        1,
        'canon',
        '6399.00',
        '佳能(Canon) 80D套机单机eos80d单反照相机',
        'e8d65902d92fa44707070f6a2db670de.jpeg',
        165,
        1655628711808,
        '佳能(Canon)80D',
        '单反相机',
        'APS-C',
        '6bit',
        '1080p 60p',
        '2420万'
    ),
    (
        22,
        3,
        'panasonic',
        '9998.00',
        '松下(Panasonic)S5全画幅数码相机',
        '8d0748f4e5ded5ba930b5ffde14bea90.jpeg',
        153,
        1655629131280,
        '松下(panasonic)S5',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万'
    ),
    (
        23,
        3,
        'panasonic',
        '13298.00',
        '松下(Panasonic)GH6 微单/单电无反数码相机',
        '2f14c6c36bc2fe0068542c9bd3f1eeff.jpeg',
        35,
        1655629544476,
        '松下(panasonic)GH6',
        '数码相机',
        '全画幅',
        '14bit',
        '1080p 60p',
        '2000万-3000万'
    ),
    (
        24,
        5,
        'sony',
        '11899.00',
        '索尼(SONY)Alpha7C全画幅微单数码相机',
        '72567e76dee9e973b701f2736e739092.jpeg',
        58,
        1655630004855,
        '索尼(SONY)Alpha 7C',
        '数码相机',
        '全画幅',
        '14bit',
        '1080p 60p',
        '2000万-3000万'
    ),
    (
        25,
        4,
        'hasselblad',
        '73900.00',
        '哈苏(HASSELBLAD)907X850C中画幅数码相机+CFVII CFV2后背907X 50C普通版',
        '89122f2603136110478660adccec1a47.jpeg',
        19,
        1655630585249,
        '哈苏(HASSELBLAD)',
        '数码相机',
        '中画幅',
        '不支持RAW',
        '2k 30p',
        '5000万-6000万'
    ),
    (
        26,
        7,
        'leica',
        '9900.00',
        '徕卡(Leica)V_LUX5便携相机大变镜头 4k视频快速对焦人文扫街触屏可翻转',
        '9758f03e8c2a927cb39fd288cbfa9111.jpeg',
        74,
        1655631060760,
        '徕卡(Leica)V-LUX5',
        '数码相机',
        '全画幅',
        '6bit',
        '4k视频',
        '2000万'
    ),
    (
        27,
        6,
        'Fujifilm',
        '39800.00',
        '富士(FUJIFILM)GFX100S无反中画幅相机 微单相机',
        '7440e33b59efd5d5a40b0a34e51ed053.jpeg',
        26,
        1655648220537,
        '富士(FUJIFILM)GFX100S',
        '数码相机',
        '中画幅',
        '16bit',
        '1080p 60p',
        '10000万'
    ),
    (
        28,
        6,
        'Fujifilm',
        '10549.00',
        '富士(FUJIFILM)X-S10/XS10复古微单数码相机',
        'f1957cdb7a1440434589552cde20eb02.jpeg',
        19,
        1655648846155,
        '富士(FUJIFILM)X-S!0',
        '数码相机',
        'APS-C',
        '14bit',
        '4k视频',
        '2000万-3000万'
    ),
    (
        29,
        2,
        'nikon',
        '8799.00',
        '尼康(Nikon)Z 5全画幅微单相机 数码相机',
        'f9478bca191e7fce780f349a1bcc2e1fc.jpeg',
        96,
        1655649278234,
        '尼康(Nikon)Z5',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万'
    ),
    (
        30,
        1,
        'canon',
        '12799.00',
        '佳能(Canon)EOSR专微微单相机相机微单套机全画幅微单EOSR',
        NULL,
        83,
        1655649828538,
        '佳能EOSR',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万'
    );

-- --------------------------------------------------------

--

-- 表的结构 `py_camera_family`

--

CREATE TABLE `py_camera_family` (
    `pc_id` smallint(6) NOT NULL,
    `pc_name` varchar(32) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_camera_family`

--

INSERT INTO
    `py_camera_family` (`pc_id`, `pc_name`)
VALUES
    (1, 'canon'),
    (2, 'nikon'),
    (3, 'panasonic'),
    (4, 'hasselblad'),
    (5, 'sony'),
    (6, 'Fujifilm'),
    (7, 'leica');

-- --------------------------------------------------------

--

-- 表的结构 `py_index_carousel`

--

CREATE TABLE `py_index_carousel` (
    `cid` int(11) NOT NULL,
    `img` varchar(127) DEFAULT NULL,
    `title` varchar(127) DEFAULT NULL,
    `href` varchar(127) DEFAULT NULL,
    `camera_id` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_index_carousel`

--

INSERT INTO
    `py_index_carousel` (`cid`, `img`, `title`, `href`, `camera_id`)
VALUES
    (
        1,
        '/img/index/carousel/1.jpg',
        '佳能(Canon) EOS 800D单反相机',
        'x',
        8
    ),
    (
        2,
        '/img/index/carousel/2.jpg',
        '佳能(Canon) 5d4 5D Mark IV',
        'x',
        9
    ),
    (
        3,
        '/img/index/carousel/3.jpg',
        'SONY 索尼 DSC-RX100M7',
        'x',
        10
    ),
    (
        4,
        '/img/index/carousel/4.jpg',
        '富士(FUJIFILM)X-T30',
        'x',
        11
    );

-- --------------------------------------------------------

--

-- 表的结构 `py_index_product`

--

CREATE TABLE `py_index_product` (
    `pid` int(11) NOT NULL,
    `title` varchar(128) DEFAULT NULL,
    `price` decimal(8, 2) DEFAULT NULL,
    `pic` varchar(128) DEFAULT NULL,
    `camera_id` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_index_product`

--

INSERT INTO
    `py_index_product` (`pid`, `title`, `price`, `pic`, `camera_id`)
VALUES
    (
        1,
        '佳能/Canon EOS 1DX MarkIII单反机身 EOS 1DX3代 1DX3',
        '43200.00',
        'c0152ccb9b2920bd.jpg',
        1
    ),
    (
        2,
        '索尼/SONY A7RIII A7R3A 全画幅微单 三代 数码相机单机身',
        '15699.00',
        'fe35fd8fc4fe06e1.jpg',
        5
    ),
    (
        3,
        '松下(Panasonic)G100K微单相机 数码相机 vlog相机 微单套机(12-32mm)',
        '4098.00',
        '0f58e595f60f6dd0.jpg',
        3
    ),
    (
        4,
        '尼康/Nikon D6 全画幅 单反相机机身',
        '43999.00',
        'a7bc068f9561d65b.png',
        2
    ),
    (
        5,
        '哈苏(HASSELBLAD)X1D II 50C 中画幅无反数码相机',
        '39990.00',
        'c64b1ea0b9721cbf.jpg',
        4
    ),
    (
        6,
        '富士(FUJIFILM)【旗舰京品】XT3微单数码相机X-T3机身套机4KXT30升级版',
        '11190.00',
        '024b930cf2be7ec8.jpg',
        6
    ),
    (
        7,
        '徕卡(Leica)Q2全画幅便携数码相机 黑色19051 (4730万像素 4K视频录制 内置定焦镜',
        '45799.00',
        'e036819be879179c.jpg',
        7
    ),
    (
        8,
        '哈苏(HASSELBLAD) X1D II 50C中画幅无反数码相机 微单 自动对焦 二代 哈苏X',
        '48989.00',
        'c119ed106ad50b28.jpg',
        17
    );

-- --------------------------------------------------------

--

-- 表的结构 `py_order`

--

CREATE TABLE `py_order` (
    `oid` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `addree_id` int(11) DEFAULT NULL,
    `status` int(11) DEFAULT NULL,
    `order_time` bigint(20) DEFAULT NULL,
    `pay_time` bigint(20) DEFAULT NULL,
    `deliver_time` bigint(20) DEFAULT NULL,
    `received_time` bigint(20) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--

-- 表的结构 `py_order_detail`

--

CREATE TABLE `py_order_detail` (
    `did` int(11) NOT NULL,
    `order_id` int(11) DEFAULT NULL,
    `camera_id` int(11) DEFAULT NULL,
    `count` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--

-- 表的结构 `py_receiver_address`

--

CREATE TABLE `py_receiver_address` (
    `aid` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `receiver` varchar(16) DEFAULT NULL,
    `province` varchar(16) DEFAULT NULL,
    `city` varchar(16) DEFAULT NULL,
    `county` varchar(16) DEFAULT NULL,
    `address` varchar(128) DEFAULT NULL,
    `cellphone` varchar(16) DEFAULT NULL,
    `is_default` tinyint(1) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--

-- 表的结构 `py_shopping_cart`

--

CREATE TABLE `py_shopping_cart` (
    `cid` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `camera_id` int(11) DEFAULT NULL,
    `count` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--

-- 表的结构 `py_user`

--

CREATE TABLE `py_user` (
    `u_id` int(11) NOT NULL,
    `u_name` varchar(32) DEFAULT NULL,
    `u_pwd` varchar(16) DEFAULT NULL,
    `u_phone` char(11) NOT NULL,
    `u_email` varchar(64) DEFAULT NULL,
    `user_name` varchar(32) DEFAULT NULL,
    `u_avatar` varchar(128) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--

-- 转存表中的数据 `py_user`

--

INSERT INTO
    `py_user` (
        `u_id`,
        `u_name`,
        `u_pwd`,
        `u_phone`,
        `u_email`,
        `user_name`,
        `u_avatar`
    )
VALUES
    (
        1,
        'BCXGDMM',
        '123456',
        '13759963313',
        '13759963313@163.com',
        '张三',
        '/img/index/user_avatar/1.jpg'
    );

--

-- Indexes for dumped tables

--

--

-- Indexes for table `py_admin`

--

ALTER TABLE `py_admin` ADD PRIMARY KEY (`a_id`);

--

-- Indexes for table `py_camera`

--

ALTER TABLE `py_camera` ADD PRIMARY KEY (`c_id`);

--

-- Indexes for table `py_camera_family`

--

ALTER TABLE `py_camera_family` ADD PRIMARY KEY (`pc_id`);

--

-- Indexes for table `py_index_carousel`

--

ALTER TABLE `py_index_carousel` ADD PRIMARY KEY (`cid`);

--

-- Indexes for table `py_index_product`

--

ALTER TABLE `py_index_product` ADD PRIMARY KEY (`pid`);

--

-- Indexes for table `py_order`

--

ALTER TABLE `py_order` ADD PRIMARY KEY (`oid`);

--

-- Indexes for table `py_order_detail`

--

ALTER TABLE `py_order_detail` ADD PRIMARY KEY (`did`);

--

-- Indexes for table `py_receiver_address`

--

ALTER TABLE `py_receiver_address` ADD PRIMARY KEY (`aid`);

--

-- Indexes for table `py_shopping_cart`

--

ALTER TABLE `py_shopping_cart` ADD PRIMARY KEY (`cid`);

--

-- Indexes for table `py_user`

--

ALTER TABLE
    `py_user`
ADD
    PRIMARY KEY (`u_id`),
ADD
    UNIQUE KEY `u_phone` (`u_phone`);

--

-- 在导出的表使用AUTO_INCREMENT

--

--

-- 使用表AUTO_INCREMENT `py_admin`

--

ALTER TABLE
    `py_admin`
MODIFY
    `a_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

--

-- 使用表AUTO_INCREMENT `py_camera`

--

ALTER TABLE
    `py_camera`
MODIFY
    `c_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 31;

--

-- 使用表AUTO_INCREMENT `py_index_carousel`

--

ALTER TABLE
    `py_index_carousel`
MODIFY
    `cid` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;

--

-- 使用表AUTO_INCREMENT `py_index_product`

--

ALTER TABLE
    `py_index_product`
MODIFY
    `pid` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 9;

--

-- 使用表AUTO_INCREMENT `py_order`

--

ALTER TABLE
    `py_order`
MODIFY
    `oid` int(11) NOT NULL AUTO_INCREMENT;

--

-- 使用表AUTO_INCREMENT `py_order_detail`

--

ALTER TABLE
    `py_order_detail`
MODIFY
    `did` int(11) NOT NULL AUTO_INCREMENT;

--

-- 使用表AUTO_INCREMENT `py_receiver_address`

--

ALTER TABLE
    `py_receiver_address`
MODIFY
    `aid` int(11) NOT NULL AUTO_INCREMENT;

--

-- 使用表AUTO_INCREMENT `py_shopping_cart`

--

ALTER TABLE
    `py_shopping_cart`
MODIFY
    `cid` int(11) NOT NULL AUTO_INCREMENT;

--

-- 使用表AUTO_INCREMENT `py_user`

--

ALTER TABLE
    `py_user`
MODIFY
    `u_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;