-- #设置客户端连接服务器端的编码
set names utf8;
-- #丢弃数据库，如果存在
drop database if exists photography;
-- #创建新的数据库，设置存储字符的编码
create database photography charset=utf8;
-- #进入数据库
use photography;

-- #创建管理员表
create table py_admin(
  a_id int primary key auto_increment,
  a_name varchar(16) unique,
  a_password varchar(16) not null
);

-- #创建用户表
create table py_user(
  u_id int primary key auto_increment,
  u_name varchar(16) not null,
  u_pwd varchar(16) not null,
  u_phone char(11) not null unique,
  u_email varchar(32)
);

-- #商品表
create table py_product(
  p_id int primary key auto_increment,
  -- p_name varchar(32) not null,
  -- 商品类别
  p_category smallint not null,
  p_price decimal(8,2) not null,
  -- 商品标题
  p_title varchar(64) not null,
  -- 商品详情
  p_details varchar(255),
  -- 图片 存储路径
  p_img varchar(64) not null,
  -- 库存
  p_stock smallint not null,
  -- 上架时间
  p_Shelf_time bigint not null
);
-- 商品类别表
create table py_category(
  pc_id smallint primary key,
  pc_name varchar(16)
);


-- # 插入数据
insert into py_admin values(null,'admin','123456');

insert into py_user values(null,'张三','123456','13759963313','13759963313@163.com');
insert into py_product values(null,10,27900.00,,'徕卡/Leica CL数码微单相机莱卡','德国制造 传承景点，徕卡M-P与它传奇镜头群所建立的不朽价值，时代相传','/imgae/produtcs/11.png',255,1654581886055)