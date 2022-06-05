#设置客户端连接服务器端的编码 set names utf8;

#丢弃数据库，如果存在 drop database if exists travel;

#创建新的数据库，设置存储字符的编码 create database travel charset=utf8;

#进入数据库 use travel;

#创建管理员表
create table admin(
    a_id int primary key auto_increment,
    a_name varchar(16) unique,
    a_password varchar(16) not null
);

#创建用户表
create table user(
    u_id int primary key auto_increment,
    u_name varchar(16) not null,
    u_pwd varchar(16) not null,
    u_phone char(11) unique,
    u_email varchar(32)
);

# 插入数据 insert into admin values(null,'admin','123456');

insert into
    user
values(
        null,
        '张三',
        '123456',
        '13759963313',
        '13759963313@163.com'
    );