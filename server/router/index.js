// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 1.轮播图
// 请求方式 get
//  http://127.0.0.1:3000/index/carousel
router.get("/carousel", (req, res, next) => {
  let sql = "select * from py_index_carousel";
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "ok", data: result });
    } else {
      res.send({ code: 0, msg: "查询失败" });
    }
  });
});
// 2.关于我们
// 请求方式 get
// 接口地址 http://127.0.0.1:3000/index/aboutus
router.get("/aboutus", (req, res, next) => {
  let sql = "select * from py_aboutus";
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "ok", data: result });
    } else {
      res.send({ code: 1, msg: "请求失败" });
    }
  });
});
//3.首页商品数据
// 请求方式 get
// 接口地址  http://127.0.0.1:3000/index/pro
router.get("/pro", (req, res, next) => {
  let sql = "select * from py_index_product";
  pool.query(sql, (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "ok", data: result });
    } else {
      res.send({ code: 0, msg: "请求失败" });
    }
  });
});

// 导出
module.exports = router;
