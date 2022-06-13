// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 请求所有商品信息
// http://127.0.0.1:3000/product/list
router.get("/list", (req, res, next) => {
  pool.query("select * from py_camera", (err, result) => {
    if (err) {
      next(err);
      return;
    }
    // 判断长度 确定是否有值
    if (result.length) {
      res.send({ code: 1, msg: "ok", data: result });
    } else {
      res.send({ code: 0, msg: "服务器端错误" });
    }
  });
});

// 导出
module.exports = router;
