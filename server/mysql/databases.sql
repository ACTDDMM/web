-- #设置客户端连接服务器端的编码

set names utf8;

-- #丢弃数据库，如果存在

drop database if exists photography;

-- #创建新的数据库，设置存储字符的编码

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
    c_pixel varchar(32)
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
    title VARCHAR(64),
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

insert into
    py_camera
values(
        null,
        1,
        'canon',
        43200.00,
        '佳能/Canon EOS 1DX MarkIII单反机身 EOS 1DX3代 1DX3',
        '/img/product/c0152ccb9b2920bd.jpg',
        500,
        1655096567278,
        '佳能EOS-1DX Mark III',
        '单反相机',
        '全画幅',
        '14bit',
        '4K 60P',
        '3800-4500万'
    );

insert into
    py_camera
values(
        null,
        2,
        'nikon',
        43999.00,
        '尼康/Nikon D6 全画幅 单反相机机身',
        '/img/product/a7bc068f9561d65b.png',
        500,
        1655096567278,
        '尼康/Nikon D6',
        '单反相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '3000-3500万'
    );

insert into
    py_camera
values(
        null,
        3,
        'panasonic',
        4098.00,
        '松下(Panasonic)G100K微单相机 数码相机 vlog相机 微单套机(12-32mm)4K视频 专业收音 美肤自拍 触摸屏',
        '/img/product/0f58e595f60f6dd0.jpg',
        500,
        1655096567278,
        '松下G100',
        '数码相机',
        '中画幅',
        '12bit',
        '4K 30P',
        '3000-4000万'
    );

insert into
    py_camera
values(
        null,
        4,
        'hasselblad',
        39990.00,
        '哈苏(HASSELBLAD)X1D II 50C 中画幅无反数码相机',
        '/img/product/c64b1ea0b9721cbf.jpg',
        500,
        1655096567278,
        '哈苏哈苏 X1D Ⅱ 50C',
        '数码相机',
        '中画幅',
        '不支持RAW',
        '不支持视频拍摄',
        '3000-5500万'
    );

insert into
    py_camera
values(
        null,
        5,
        'sony',
        15699.00,
        '索尼/SONY A7RIII A7R3A 全画幅微单 三代 数码相机单机身',
        '/img/product/fe35fd8fc4fe06e1.jpg',
        500,
        1655096567278,
        '索尼/SONY A7RIII',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 60P',
        '3000-3800万'
    );

insert into
    py_camera
values(
        null,
        6,
        'Fujifilm',
        11190.00,
        '富士(FUJIFILM)【旗舰京品】XT3微单数码相机X-T3机身套机4KXT30升级版 ',
        '/img/product/024b930cf2be7ec8.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)XT3',
        '数码相机',
        '全画幅',
        '10bit',
        '4K 30P',
        '4000-4500万'
    );

insert into
    py_camera
values(
        null,
        7,
        'leica',
        45799.00,
        '徕卡（Leica）Q2全画幅便携数码相机 黑色19051 （4730万像素 4K视频录制 内置定焦镜头 ）',
        '/img/product/e036819be879179c.jpg',
        500,
        1655096567278,
        '徕卡Q2',
        '数码相机',
        '全画幅',
        '14bit',
        '4K 30P',
        '3000-4000万'
    );

insert into
    py_camera
values(
        null,
        1,
        'canon',
        5499.00,
        '佳能(Canon) EOS 800D单反相机 入门单反相机高清摄像佳能800D单机(不含镜头) 高级套餐(64G卡+电池+相机包+三脚架)',
        '/img/product/a621bbee183f2f64.jpg',
        500,
        1655096567278,
        '佳能(Canon) EOS 800D',
        '单反相机',
        'APS-C画幅',
        '6bit',
        '1080P 60P',
        '3800-4500万'
    );

insert into
    py_camera
values(
        null,
        1,
        'canon',
        18538.00,
        '佳能(Canon) 5d4 5D Mark IV 专业全画幅单反相机单机/套机 4K视频单反相机 EF 50mm f/1.8 STM',
        '/img/product/d02ed404fc0eb0c4.png',
        500,
        1655096567278,
        '佳能(Canon) EOS 600D',
        '单反相机',
        '全画幅',
        '6bit',
        '1080P 960P',
        '3000-4000万'
    );

insert into
    py_camera
values(
        null,
        5,
        'sony',
        9499.00,
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '/img/product/fe35fd8fc4fe06e1.jpg',
        500,
        1655096567278,
        'SONY 索尼 DSC-RX100M7 黑卡7 RX100VII 眼部对焦 Vlog rx100M7 黑卡7(豪华套装)',
        '数码相机',
        '全画幅',
        '6bit',
        '4K 60P',
        '3000-3800万'
    );

insert into
    py_camera
values(
        null,
        6,
        'Fujifilm',
        6499.00,
        '富士(FUJIFILM)X-T30 II/XT30 II 微单相机 套机(15-45mm镜头 ) 银色 2610万像素 18种胶片模拟 视频提升 ',
        '/img/product/6f48a5aadff66186.jpg',
        500,
        1655096567278,
        '富士(FUJIFILM)X-T30',
        '微单相机',
        'APS-C',
        '14bit',
        '4K视频',
        '2000-3000万'
    );



insert into
    py_index_carousel VALUES(
        null,
        '/img/index/carousel/1.jpg',
        '佳能(Canon) EOS 800D单反相机',
        'x',
        8
    );

insert into
    py_index_carousel VALUES(
        null,
        '/img/index/carousel/2.jpg',
        '佳能(Canon) 5d4 5D Mark IV',
        'x',
        9
    );

insert into
    py_index_carousel VALUES(
        null,
        '/img/index/carousel/3.jpg',
        'SONY 索尼 DSC-RX100M7',
        'x',
        10
    );

insert into
    py_index_carousel VALUES(
        null,
        '/img/index/carousel/4.jpg',
        '富士(FUJIFILM)X-T30',
        'x',
        11
    );