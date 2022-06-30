-- #设置客户端连接服务器端的编码

set names utf8;

-- #丢弃数据库,如果存在

drop database if exists photography;

-- #创建新的数据库,设置存储字符的编码

CREATE DATABASE photography charset=utf8;

-- #进入数据库

use photography;

-- #创建管理员表

create table py_admin(
    a_id int primary key auto_increment,
    a_name varchar(16),
    a_password varchar(16) not null
);

-- -- #创建用户表

create table py_user(
    u_id int primary key auto_increment,
    u_name varchar(32),
    u_pwd varchar(16),
    u_phone char(11) not null unique,
    u_email varchar(64),
    user_name varchar(32),
    u_avatar varchar(128)
);

-- #商品表

create table py_camera(
    c_id int primary key auto_increment,
    -- 所属型号家族编号
    c_family_id int,
    -- 商品类别
    c_category varchar(32),
    -- 价格
    c_price decimal(8, 2),
    -- 商品标题
    c_title varchar(128),
    -- 图片 存储路径
    c_img varchar(64),
    -- 库存
    c_stock smallint,
    -- 上架时间
    c_shelf_time bigint,
    -- 商品名
    c_name varchar(64),
    -- 类型 --单反相机
    c_type varchar(64),
    -- 画幅
    c_frame varchar(32),
    -- RAW照片输出
    c_output varchar(32),
    -- 视频拍摄能力
    c_shooting varchar(32),
    -- 像素
    c_pixel varchar(32),

    -- 商品毛重
    c_weight varchar(32),
    -- 商品产地
    c_chandi varchar(32),
    -- 功能
    c_gongneng varchar(128),
    -- 适用对象
    c_sydx varchar(32),
    -- 滤镜直径
    c_ljzj varchar(32),
    -- 视频采样
    c_spcy varchar(32),
    -- 适用场景
    c_sycj varchar(128),
    -- 商品详情视频
    c_video varchar(128),
    -- 商品详情轮播图1
    c_swiper1 varchar(128),
    -- 商品详情轮播图2
    c_swiper2 varchar(128),
    -- 商品详情轮播图3
    c_swiper3 varchar(128),
    -- 商品详情轮播图4
    c_swiper4 varchar(128)
);

-- 商品类别表

create table py_camera_family(
    pc_id smallint primary key,
    -- 对应 商品表的 类别
    pc_name varchar(32)
);

-- 关于我们表

create table py_aboutus(
    desc_text varchar(32),
    content varchar(20000)
);

-- 轮播图标

create table py_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(127),
    title VARCHAR(127),
    href VARCHAR(127),
    camera_id INT
);

-- 首页商品表

create table py_index_product(
    pid int PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),
    price DECIMAL(8, 2),
    pic VARCHAR(128),
    camera_id INT -- 和商品表id相对应
);

-- 用户地址表

create TABLE py_receiver_address(
    aid int PRIMARY KEY auto_increment,
    -- 用户id
    user_id int,
    -- 接受人姓名
    receiver VARCHAR(16),
    -- 省
    province VARCHAR(16),
    -- 市
    city VARCHAR(16),
    -- 县
    county VARCHAR(16),
    -- 详细地址
    address VARCHAR(128),
    -- 手机
    cellphone VARCHAR(16),
    -- 是否为当前用户的默认地址
    is_default BOOLEAN
);

-- 购物车表

CREATE TABLE py_shopping_cart(
    cid int PRIMARY KEY auto_increment,
    -- 用户编号
    user_id int,
    -- 商品id
    camera_id int,
    -- 数量
    count int
);

-- 用户订单表

CREATE TABLE py_order(
    oid int PRIMARY KEY auto_increment,
    user_id int,
    addree_id int,
    -- 订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
    status INT,
    -- 下单时间
    order_time BIGINT,
    -- 付款时间
    pay_time BIGINT,
    -- 发货时间
    deliver_time BIGINT,
    -- 签收时间
    received_time BIGINT
);

-- 用户订单详情表

CREATE TABLE py_order_detail(
    did int PRIMARY KEY auto_increment,
    -- 订单号
    order_id int,
    -- 商品编号
    camera_id int,
    -- 数量
    count int
);

-- 模拟数据

INSERT INTO
    `py_shopping_cart` (`cid`, `user_id`, `camera_id`, `count`)
VALUES
    (NULL, '1', '1', '2');

-- # 插入数据

insert into py_admin values(null,'admin','123456');

insert into py_camera_family values(1,'canon');

insert into py_camera_family values(2,'nikon');

insert into py_camera_family values(3,'panasonic');

insert into py_camera_family values(4,'hasselblad');

insert into py_camera_family values(5,'sony');

insert into py_camera_family values(6,'Fujifilm');

insert into py_camera_family values(7,'leica');

-- #商品表

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        1,
        'canon',
        43200.00,
        '佳能/Canon EOS 1DX MarkIII单反机身 EOS 1DX3代 1DX3',
        'c0152ccb9b2920bd.jpg',
        500,
        1655096567278,
        '佳能EOS-1DX Mark III',
        '单反相机',
        '全画幅',
        '14bit',
        '4K 60P',
        '3800-4500万',

        '1.45kg',
        '中国大陆',
        '4k视频, 高速连拍, Wi-Fi直连',
        '专业',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，高清拍摄',
        'canon-EOS-1DX.mp4',
        'canon/EOS-1DX/1.jpg.avif',
        'canon/EOS-1DX/2.jpg.avif',
        'canon/EOS-1DX/3.jpg.avif',
        'canon/EOS-1DX/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        43999.00,
        '尼康/Nikon D6 全画幅 单反相机机身',
        'a7bc068f9561d65b.png',
        500,
        1655096567278,
        '尼康/Nikon D6',
        '单反相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '3000-3500万',

        '1.5kg',
        '中国大陆',
        'Wi-Fi直连, 4k视频, 高速连拍',
        '专业',
        '其他',
        '4:2:0',
        '运动摄影，人物摄影，风光摄影',
        'nikon-D6.mp4',
        'nikon/D6/1.jpg.avif',
        'nikon/D6/2.jpg.avif',
        'nikon/D6/3.jpg.avif',
        'nikon/D6/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        3,
        'panasonic',
        4098.00,
        '松下(Panasonic)G100K微单相机 数码相机 vlog相机 微单套机(12-32mm)4K视频 专业收音 美肤自拍 触摸屏',
        '0f58e595f60f6dd0.jpg',
        500,
        1655096567278,
        '松下G100',
        '数码相机',
        '中画幅',
        '12bit',
        '4K 30P',
        '3000-4000万',

        '0.7kg',
        '中国大陆',
        '5轴防抖, 4k视频, 高速连拍',
        '入门级',
        '58mm',
        '4:2:0',
        '运动摄影，人物摄影，风光摄影',
        'panasonic-G100K.mp4',
        'panasonic/G100K/1.jpg.avif',
        'panasonic/G100K/2.jpg.avif',
        'panasonic/G100K/3.jpg.avif',
        'panasonic/G100K/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        4,
        'hasselblad',
        39990.00,
        '哈苏(HASSELBLAD)X1D II 50C 中画幅无反数码相机',
        'c64b1ea0b9721cbf.jpg',
        500,
        1655096567278,
        '哈苏哈苏 X1D Ⅱ 50C',
        '数码相机',
        '中画幅',
        '不支持RAW',
        '不支持视频拍摄',
        '3000-5500万',

        '1.67kg',
        '瑞典',
        '5轴防抖, 高速连拍, 运动抓拍',
        '专业',
        '其他',
        '4:2:0',
        '运动摄影，人物摄影，风光摄影',
        'HASSELBLAD-X1D-II.mp4',
        'hasselbland/X1D-II/1.jpg.avif',
        'hasselbland/X1D-II/2.jpg.avif',
        'hasselbland/X1D-II/3.jpg.avif',
        'hasselbland/X1D-II/4.png.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        5,
        'sony',
        15699.00,
        '索尼/SONY A7RIII A7R3A 全画幅微单 三代 数码相机单机身',
        'fe35fd8fc4fe06e1.jpg',
        500,
        1655096567278,
        '索尼/SONY A7RIII',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 60P',
        '3000-3800万',

        '1.15kg',
        '中国大陆',
        '5轴防抖, 高速连拍, 运动抓拍',
        '中高级',
        '其他',
        '4:2:0',
        '运动摄影，人物摄影，风光摄影',
        'sony-ILCE-7M3.mp4',
        'sony/A7RIII/1.jpg.avif',
        'sony/A7RIII/2.jpg.avif',
        'sony/A7RIII/3.jpg.avif',
        'sony/A7RIII/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        6,
        'Fujifilm',
        11190.00,
        '富士(FUJIFILM)【旗舰京品】XT3微单数码相机X-T3机身套机4KXT30升级版 ',
        '024b930cf2be7ec8.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)XT3',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '4000-4500万',

        '1.0kg',
        '日本',
        '高速连拍, 运动抓拍, Wi-Fi直连',
        '中高级',
        '其他',
        '4:2:0',
        '风光摄影，运动摄影，人物摄影',
        'FIJIFILM-XT3.mp4',
        'fujifilm/XT3/1.jpg.avif',
        'fujifilm/XT3/2.jpg.avif',
        'fujifilm/XT3/3.jpg.avif',
        'fujifilm/XT3/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        7,
        'leica',
        45799.00,
        '徕卡(Leica)Q2全画幅便携数码相机 黑色19051 (4730万像素 4K视频录制 内置定焦镜头 )',
        'e036819be879179c.jpg',
        500,
        1655096567278,
        '徕卡Q2',
        '数码相机',
        '全画幅',
        '14bit',
        '4K 30P',
        '3000-4000万',

        '0.718kg',
        '德国',
        '高速连拍, 运动抓拍, Wi-Fi直连',
        '专业级',
        '其他',
        '4:2:0',
        '专业摄影，运动摄影，风光摄影',
        'leica-Q2.mp4',
        'leica/Q2/1.jpg.avif',
        'leica/Q2/2.jpg.avif',
        'leica/Q2/3.jpg.avif',
        'leica/Q2/4.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        1,
        'canon',
        5499.00,
        '佳能(Canon) EOS 800D单反相机 入门单反相机高清摄像佳能800D单机(不含镜头) 高级套餐(64G卡+电池+相机包+三脚架)',
        'a621bbee183f2f64.jpg',
        500,
        1655096567278,
        '佳能(Canon) EOS 800D',
        '单反相机',
        'APS-C画幅',
        '6bit',
        '1080P 60P',
        '3800-4500万',

        '1.0kg',
        '日本',
        '高速连拍, 运动抓拍, Wi-Fi直连',
        '中端',
        '58mm',
        '4:2:0',
        '专业摄影，运动摄影，风光摄影',
        'canon-EOS-800D.mp4',
        'canon/EOS-800D/5.jpg.avif',
        'canon/EOS-800D/6.png.avif',
        'canon/EOS-800D/7.jpg.avif',
        'canon/EOS-800D/8.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        1,
        'canon',
        18538.00,
        '佳能(Canon) 5d4 5D Mark IV 专业全画幅单反相机单机/套机 4K视频单反相机 EF 50mm f/1.8 STM',
        'd02ed404fc0eb0c4.png',
        500,
        1655096567278,
        '佳能(Canon) EOS 600D',
        '单反相机',
        '全画幅',
        '6bit',
        '1080P 960P',
        '3000-4000万',

        '0.8kg',
        '日本',
        '高速连拍, 运动抓拍, Wi-Fi直连',
        '高端',
        '72mm',
        '4:2:0',
        '人物摄影，运动摄影，风光摄影',
        'canon-5d4-5D-Mark-IV.mp4',
        'canon/5d4-5D/9.jpg.avif',
        'canon/5d4-5D/10.jpg.avif',
        'canon/5d4-5D/11.png.avif',
        'canon/5d4-5D/12.png.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        5,
        'sony',
        9499.00,
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '45df69fb183e35f6.jpg',
        500,
        1655096567278,
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '数码相机',
        '全画幅',
        '6bit',
        '4K 60P',
        '3000-3800万',

        '300g',
        '中国大陆',
        '望远长焦, Wi-Fi直连',
        '入门级',
        '72mm',
        '4:2:0',
        '人物摄影，风光摄影',
        'sony-DSC-RX100M7.mp4',
        'sony/DSC-RX100M7/5.jpg.avif',
        'sony/DSC-RX100M7/6.jpg.avif',
        'sony/DSC-RX100M7/7.jpg.avif',
        'sony/DSC-RX100M7/8.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        6,
        'Fujifilm',
        6499.00,
        '富士(FUJIFILM)X-T30 II/XT30 II 微单相机 套机(15-45mm镜头 ) 银色 2610万像素 18种胶片模拟 视频提升 ',
        '6f48a5aadff66186.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)X-T30',
        '微单相机',
        'APS-C',
        '14bit',
        '4K视频',
        '2000-3000万',

        '1.23kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '中高级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'FUJIFILM-X-T30-II.mp4',
        'fujifilm/X-T30/5.jpg',
        'fujifilm/X-T30/6.jpg',
        'fujifilm/X-T30/7.jpg',
        'fujifilm/X-T30/8.jpg'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        17598.00,
        '尼康(Nikon)Z 6 (Z6 )全画幅微单相机 数码相机 微单机身 Vlog相 Z5系列 Z5+24-50mm FX高入门套装',
        '1f3a8636e1fdcd00.jpg',
        200,
        1655205451519,
        '尼康(Nikon)Z 6 ',
        '微单相机',
        '全画幅',
        '14bit',
        '无视频输出',
        '2000-3000万',

        '1.5kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'nikon-Z6.mp4',
        'nikon/Z6/5.jpg.avif',
        'nikon/Z6/6.jpg.avif',
        'nikon/Z6/7.jpg.avif',
        'nikon/Z6/8.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        7499.00,
        '尼康(Nikon) Zfc半画幅复古微单相机 高清旅游数码照相机 Z16-50/Z28 2.8套机 Z fc+Z16-50 f/3.5-6.3VR镜头 标配【送64G卡+相机包+UV等基础配件】',
        '202be185de428bf9.jpg',
        20,
        1655205451519,
        '尼康(Nikon)Z fc',
        '微单相机',
        'APS-C',
        '14bit',
        '4K视频',
        '2000-3000万',

        '1.08kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'nikon-Zfc.mp4',
        'nikon/Zfc/9.jpg.avif',
        'nikon/Zfc/10.jpg.avif',
        'nikon/Zfc/11.jpg.avif',
        'nikon/Zfc/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        7,
        'leica',
        113550.00,
        '徕卡(Leica)M11旁轴数码相机套装 相机+35 1.4镜头银色+电池',
        'a6c9164605fb698e.jpg',
        10,
        1655205451519,
        '徕卡M11',
        '数码相机',
        '全画幅',
        '14bit',
        '4K',
        '5000-6000万',

        '0.95kg',
        '德国',
        '高速连拍, 运动抓拍',
        '专业级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'leica-M11.mp4',
        'leica/M11/5.jpg.avif',
        'leica/M11/6.jpg.avif',
        'leica/M11/7.jpg.avif',
        'leica/M11/8.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        7,
        'leica',
        11800.00,
        '徕卡(Leica)D-LUX7时尚多功能便携相机套装徕卡dlux7套装微单相机入门【非现货需预定】 相机+相机包(棕色) 相机-银色',
        '1eceea7214786956.jpg',
        35,
        1655205451519,
        '徕卡(Leica)D-LUX7',
        '微单相机',
        '全画幅',
        '14bit',
        '无视频输出',
        '5000-6000万',

        '0.98kg',
        '德国',
        '高速连拍, 运动抓拍',
        '专业级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'leica-D-LUX7.mp4',
        'leica/D-LUX7/9.jpg.avif',
        'leica/D-LUX7/10.jpg.avif',
        'leica/D-LUX7/11.jpg.avif',
        'leica/D-LUX7/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        3,
        'panasonic',
        3498.00,
        '松下(Panasonic)DMC-LX10数码相机4K高清摄像照相机大光圈口袋机 翻转触摸屏 官方标配',
        '12c594a93692a030.jpg',
        10,
        1655205451519,
        '松下(panasonic)DMC-LX10',
        '数码相机',
        '全画幅',
        '10bit',
        '4K',
        '2000-3000万',

        '1.45kg',
        '日本',
        '高速连拍, 运动抓拍',
        '入门级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'panasonic-DMC-LX10.mp4',
        'panasonic/DMC-LX10/5.jpg.avif',
        'panasonic/DMC-LX10/6.jpg.avif',
        'panasonic/DMC-LX10/7.jpg.avif',
        'panasonic/DMC-LX10/8.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        4,
        'hasselblad',
        48989.00,
        '哈苏(HASSELBLAD) X1D II 50C中画幅无反数码相机 微单 自动对焦 二代 哈苏X1D2+XCD45P镜头',
        'c119ed106ad50b28.jpg',
        5,
        1655205451519,
        '哈苏(HASSELBLAD)',
        '数码相机',
        '中画幅',
        '10bit',
        '2K 30P,1080P 60P',
        '5000-6000万',

        '1.64kg',
        '瑞典',
        '高速连拍, 运动抓拍, Wi-Fi直连',
        '专业级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'HASSELBLAD-X1D-II-50C.mp4',
        'hasselbland/X1D-II-50C/5.jpg.avif',
        'hasselbland/X1D-II-50C/6.jpg.avif',
        'hasselbland/X1D-II-50C/7.jpg.avif',
        'hasselbland/X1D-II-50C/8.jpg.avif'
    );


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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        5,
        'sony',
        2058.00,
        'SONY 索尼DSC-H300长焦数码相机 家用旅游照相机2010万像素 35倍光学变焦',
        '5234c72a3f41da2dabb8466a134571ff.jpeg',
        68,
        1655625932154,
        'SONY 索尼 DSC-H300',
        '数码相机',
        '全画幅',
        '6bit',
        '无视频输出',
        '2010万',

        '0.8kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'sony-DSC-H300.mp4',
        'sony/DSC-H300/9.jpg.avif',
        'sony/DSC-H300/10.jpg.avif',
        'sony/DSC-H300/11.jpg.avif',
        'sony/DSC-H300/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        6299.00,
        '尼康(Nikon) D5600数码单反相机 高清家用旅游数码相机 反转触摸屏 尼康18-140VR',
        '7492aeee5d158b6e8c1feba00ba135d3.jpg',
        80,
        1655626852271,
        '尼康(Nikon)D5600',
        '数码相机',
        'APS-C',
        '14bit',
        '1080P 60P',
        '2416万',

        '1.15kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'nikon-D5600.mp4',
        'nikon/D5600/13.png.avif',
        'nikon/D5600/14.jpg.avif',
        'nikon/D5600/15.jpg.avif',
        'nikon/D5600/16.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        27199.00,
        '尼康(Nikon) D850 高端全画幅旗舰单反相机 高清数码相机 ',
        'c0b4d73039a5c0a327d3ac80ba19cc85.jpeg',
        98,
        1655627964255,
        '尼康(Nikon)D850',
        '单反相机',
        '全画幅',
        '14bit',
        '4k 30p 1080p 60p',
        '3000万-4000万',

        '1.05kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '中高级',
        '78mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'nikon-D850.mp4',
        'nikon/D850/17.jpg.avif',
        'nikon/D850/18.jpg.avif',
        'nikon/D850/19.jpg.avif',
        'nikon/D850/20.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        1,
        'canon',
        6399.00,
        '佳能(Canon) 80D套机单机eos80d单反照相机',
        'e8d65902d92fa44707070f6a2db670de.jpeg',
        165,
        1655628711808,
        '佳能(Canon)80D',
        '单反相机',
        'APS-C',
        '6bit',
        '1080p 60p',
        '2420万',

        '1.08kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'canon-80D.mp4',
        'canon/80D/13.jpg.avif',
        'canon/80D/14.jpg.avif',
        'canon/80D/15.jpg.avif',
        'canon/80D/16.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        3,
        'panasonic',
        9998.00,
        '松下(Panasonic)S5全画幅数码相机',
        '8d0748f4e5ded5ba930b5ffde14bea90.jpeg',
        153,
        1655629131280,
        '松下(panasonic)S5',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万',

        '0.9kg',
        '日本',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'panasonic-S5.mp4',
        'panasonic/S5/9.jpg.avif',
        'panasonic/S5/10.jpg.avif',
        'panasonic/S5/11.jpg.avif',
        'panasonic/S5/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        3,
        'panasonic',
        13298.00,
        '松下(Panasonic)GH6 微单/单电无反数码相机',
        '2f14c6c36bc2fe0068542c9bd3f1eeff.jpeg',
        35,
        1655629544476,
        '松下(panasonic)GH6',
        '数码相机',
        '全画幅',
        '14bit',
        '1080p 60p',
        '2000万-3000万',

        '1.25kg',
        '日本',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'panasonic-GH6.mp4',
        'panasonic/GH6/13.jpg.avif',
        'panasonic/GH6/14.jpg.avif',
        'panasonic/GH6/15.jpg.avif',
        'panasonic/GH6/16.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        5,
        'sony',
        11899.00,
        '索尼(SONY)Alpha7C全画幅微单数码相机',
        '72567e76dee9e973b701f2736e739092.jpeg',
        58,
        1655630004855,
        '索尼(SONY)Alpha 7C',
        '数码相机',
        '全画幅',
        '14bit',
        '1080p 60p',
        '2000万-3000万',

        '1.06kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '中高级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'sony-Alpha-7C.mp4',
        'sony/Alpha7C/13.jpg.avif',
        'sony/Alpha7C/14.jpg.avif',
        'sony/Alpha7C/15.jpg.avif',
        'sony/Alpha7C/16.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        4,
        'hasselblad',
        73900.00,
        '哈苏(HASSELBLAD)907X850C中画幅数码相机+CFVII CFV2后背907X 50C普通版',
        '89122f2603136110478660adccec1a47.jpeg',
        19,
        1655630585249,
        '哈苏(HASSELBLAD)',
        '数码相机',
        '中画幅',
        '不支持RAW',
        '2k 30p',
        '5000万-6000万',

        '1.42kg',
        '瑞典',
        '高速连拍, 运动抓拍',
        '专业级',
        '78mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'HASSELBLAD-907X-CFVII.mp4',
        'hasselbland/907X-CFVII/9.jpg.avif',
        'hasselbland/907X-CFVII/10.jpg.avif',
        'hasselbland/907X-CFVII/11.jpg.avif',
        'hasselbland/907X-CFVII/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        7,
        'leica',
        9900.00,
        '徕卡(Leica)V_LUX5便携相机大变镜头 4k视频快速对焦人文扫街触屏可翻转',
        '9758f03e8c2a927cb39fd288cbfa9111.jpeg',
        74,
        1655631060760,
        '徕卡(Leica)V-LUX5',
        '数码相机',
        '全画幅',
        '6bit',
        '4k视频',
        '2000万',

        '0.95kg',
        '德国',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'leica-V-LUX5.mp4',
        'leica/V-LUX5/13.jpg.avif',
        'leica/V-LUX5/14.jpg.avif',
        'leica/V-LUX5/15.jpg.avif',
        'leica/V-LUX5/16.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        6,
        'Fujifilm',
        39800.00,
        '富士(FUJIFILM)GFX100S无反中画幅相机 微单相机',
        '7440e33b59efd5d5a40b0a34e51ed053.jpeg',
        26,
        1655648220537,
        '富士(FUJIFILM)GFX100S',
        '数码相机',
        '中画幅',
        '16bit',
        '1080p 60p',
        '10000万',

        '1.6kg',
        '日本',
        '高速连拍, 运动抓拍',
        '专业级',
        '78mm',
        '4:2:0',
        '专业摄影，风光摄影，风景摄像',
        'FUJIFILM-GFX100S.mp4',
        'fujifilm/GFX100S/9.jpg.avif',
        'fujifilm/GFX100S/10.jpg.avif',
        'fujifilm/GFX100S/11.jpg.avif',
        'fujifilm/GFX100S/12.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        6,
        'Fujifilm',
        10549.00,
        '富士(FUJIFILM)X-S10/XS10复古微单数码相机',
        'f1957cdb7a1440434589552cde20eb02.jpeg',
        19,
        1655648846155,
        '富士(FUJIFILM)X-S!0',
        '数码相机',
        'APS-C',
        '14bit',
        '4k视频',
        '2000万-3000万',

        '1.15kg',
        '日本',
        '高速连拍, 运动抓拍',
        '入门级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'FUJIFILM-X-S10.mp4',
        'fujifilm/X-S10/13.jpg.avif',
        'fujifilm/X-S10/14.jpg.avif',
        'fujifilm/X-S10/15.jpg.avif',
        'fujifilm/X-S10/16.jpg.avif'

    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        2,
        'nikon',
        8799.00,
        '尼康(Nikon)Z 5全画幅微单相机 数码相机',
        'f9478bca191e7fce780f349a1bc2e1fc.jpeg',
        96,
        1655649278234,
        '尼康(Nikon)Z5',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万',

        '1.1kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '58mm',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'nikon-Z5.mp4',
        'nikon/Z5/21.jpg.avif',
        'nikon/Z5/22.jpg.avif',
        'nikon/Z5/23.jpg.avif',
        'nikon/Z5/24.jpg.avif'
    );

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
        `c_pixel`,

        `c_weight`,
        `c_chandi`,
        `c_gongneng`,
        `c_sydx`,
        `c_ljzj`,
        `c_spcy`,
        `c_sycj`,
        `c_video`,
        `c_swiper1`,
        `c_swiper2`,
        `c_swiper3`,
        `c_swiper4`
    )
VALUES
    (
        null,
        1,
        'canon',
        12799.00,
        '佳能(Canon)EOSR专微微单相机相机微单套机全画幅微单EOSR',
        '888c1166fc6b9bc64597bab6e6ff654a.jpeg',
        83,
        1655649828538,
        '佳能EOSR',
        '数码相机',
        '全画幅',
        '14bit',
        '4k视频',
        '2000万-3000万',

        '1.0kg',
        '中国大陆',
        '高速连拍, 运动抓拍',
        '入门级',
        '其他',
        '4:2:0',
        '人物摄影，风光摄影，风景摄像',
        'canon-EOSR.mp4',
        'canon/EOSR/17.jpg.avif',
        'canon/EOSR/18.jpg.avif',
        'canon/EOSR/19.jpg.avif',
        'canon/EOSR/20.jpg.avif'
    );

-- 首页商品

insert into
    py_index_carousel
VALUES(
        null,
        '/img/index/carousel/1.jpg',
        '佳能(Canon) EOS 800D单反相机',
        'x',
        8
    );

insert into
    py_index_carousel
VALUES(
        null,
        '/img/index/carousel/2.jpg',
        '佳能(Canon) 5d4 5D Mark IV',
        'x',
        9
    );

insert into
    py_index_carousel
VALUES(
        null,
        '/img/index/carousel/3.jpg',
        'SONY 索尼 DSC-RX100M7',
        'x',
        10
    );

insert into
    py_index_carousel
VALUES(
        null,
        '/img/index/carousel/4.jpg',
        '富士(FUJIFILM)X-T30',
        'x',
        11
    );

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
        NULL,
        'BCXGDMM',
        '123456',
        '13759963313',
        '13759963313@163.com',
        '张三',
        '/img/index/user_avatar/1.jpg'
    );

INSERT INTO
    `py_aboutus` (`desc_text`, `content`)
VALUES
    (
        '关于我们',
        '<div class=\"dm\">\r\n<div class=\"dz\">\r\n<div class=\"dz2\">\r\n<p>各店地址及联系方式:</p>\r\n</div>\r\n<div>\r\n<p>网络销售联系电话：63109071 / 5936 1005</p>\r\n<p>陶然亭店：西城区南纬路41号楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：67080389</p>\r\n <p>国 贸\r\n店：朝阳区光华路北3号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：66011033</p>\r\n<p>张自忠店：东城区东四北大街甲201号</p>\r\n<div class=\"dz3\">\r\n<p>业务联系电话：13501014101</p>\r\n<p>售后服务电话：13501014101 </p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"image\">\r\n<img src=\"./img/aboutus/7018428ce85d43e6.png\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/26e5f7f0edc443e8.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/686aaa1f29a10c7d.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/061ceae68108140a.jpg\" alt=\"\" />\r\n<br />\r\n<img src=\"./img/aboutus/32c5b0433e3580c8.jpg\" alt=\"\" />\r\n</div>\r\n</div>'
    );

INSERT INTO
    `py_index_product` (`pid`, `title`, `price`, `pic`, `camera_id`)
VALUES
    (
        NULL,
        '佳能/Canon EOS 1DX MarkIII单反机身 EOS 1DX3代 1DX3',
        '43200.00',
        'c0152ccb9b2920bd.jpg',
        '1'
    ),
    (
        NULL,
        '索尼/SONY A7RIII A7R3A 全画幅微单 三代 数码相机单机身',
        '15699.00',
        'fe35fd8fc4fe06e1.jpg',
        '5'
    );

INSERT INTO
    `py_index_product` (`pid`, `title`, `price`, `pic`, `camera_id`)
VALUES
    (
        NULL,
        '松下(Panasonic)G100K微单相机 数码相机 vlog相机 微单套机(12-32mm)',
        '4098.00',
        '0f58e595f60f6dd0.jpg',
        '3'
    );

INSERT INTO
    `py_index_product` (`pid`, `title`, `price`, `pic`, `camera_id`)
VALUES
    (
        NULL,
        '尼康/Nikon D6 全画幅 单反相机机身',
        '43999.00',
        'a7bc068f9561d65b.png',
        '2'
    ),
    (
        NULL,
        '哈苏(HASSELBLAD)X1D II 50C 中画幅无反数码相机',
        '39990.00',
        'c64b1ea0b9721cbf.jpg',
        '4'
    ),
    (
        NULL,
        '富士(FUJIFILM)【旗舰京品】XT3微单数码相机X-T3机身套机4KXT30升级版',
        '11190.00',
        '024b930cf2be7ec8.jpg',
        '6'
    ),
    (
        NULL,
        '徕卡(Leica)Q2全画幅便携数码相机 黑色19051 (4730万像素 4K视频录制 内置定焦镜',
        '45799.00',
        'e036819be879179c.jpg',
        '7'
    ),
    (
        NULL,
        '哈苏(HASSELBLAD) X1D II 50C中画幅无反数码相机 微单 自动对焦 二代 哈苏X',
        '48989.00',
        'c119ed106ad50b28.jpg',
        '17'
    );