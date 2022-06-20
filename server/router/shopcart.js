// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 1. 获取当前用户的购物车信息
router.post("/shopcart", (req, res, next) => {
  let obj = req.body;
  console.log(obj);
  let sql = 'select * '
  pool.query()
});
// 导出
module.exports = router;
