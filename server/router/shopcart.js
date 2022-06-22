// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 1. 获取当前用户的购物车信息
// http://127.0.0.1:3000/shopcart/serlist
// get 传（u_id）
// SELECT cid,user_id,camera_id,count,py_camera.c_img,py_camera.c_name,py_camera.c_price from py_shopping_cart LEFT JOIN py_camera on py_shopping_cart.camera_id=py_camera.c_id WHERE user_id=?
router.get("/serlist", (req, res, next) => {
  // 首先判断 当前用户购物车是否有数据
  let obj = req.query;
  console.log(obj);
  let sql_user = "select * from py_shopping_cart where user_id=?";
  let sql =
    "SELECT cid,user_id,camera_id,count,py_camera.c_img,py_camera.c_name,py_camera.c_price from py_shopping_cart LEFT JOIN py_camera on py_shopping_cart.camera_id=py_camera.c_id WHERE user_id=?";
  pool.query(sql_user, [obj.u_id], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length >= 1) {
      pool.query(sql, [obj.u_id], (err, result) => {
        if (err) {
          next(err);
          return;
        }
        if (result.length >= 1) {
          res.send({ code: 1, msg: "查询成功", data: result });
        } else {
          res.send({ code: 0, msg: "查询失败" });
        }
      });
    } else {
      res.send({ code: 0, msg: "当前用户购物车没有数据" });
    }
  });
});

// 2.加入购物车的接口
// 请求方式 post
// 接口地址 http://127.0.0.1:3000/shopcart/addcart
// 传 u_id,c_id,count
// insert into py_shopping_cart values(null,)
router.post("/addcart", (req, res, next) => {
  let obj = req.body;
  let sql = "insert into py_shopping_cart values(null,?,?,?)";
  pool.query(sql, [obj.u_id, obj.c_id, obj.count], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows == 1) {
      res.send({ code: 1, msg: "成功加入购物车" });
    } else {
      res.send({ code: 0, msg: "加入购物车失败" });
    }
  });
});

// 3.删除当前用户的购物车某条数据
// 传参方式get cid
// http://127.0.0.1:3000/shopcart/delitem
router.post("/delitem", (req, res, next) => {
  let obj = req.body;
  let sql = "delete from py_shopping_cart where cid=?";
  pool.query(sql, [obj.cid], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.affectedRows == 1) {
      res.send({ code: 1, msg: "删除成功" });
    } else {
      res.send({ code: 0, msg: "删除失败" });
    }
  });
});

// 导出
module.exports = router;
