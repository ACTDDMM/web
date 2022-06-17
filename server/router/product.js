// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 1.请求所有商品信息
// 请求方式 get
// http://127.0.0.1:3000/product/list
router.get("/list", (req, res, next) => {
  let obj = req.query;
  console.log(obj);
  console.log(typeof obj.kw);
  if (obj.kw != "undefined") {
    pool.query(
      "select * from py_camera where c_category=?",
      [obj.kw],
      (err, result) => {
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
      }
    );
  } else {
    pool.query("select * from py_camera", (err, result) => {
      // 分页处理
      let pro = result;
      // 拼接好后的数据
      let arr = [];
      // 页数
      let page = 1;
      // 循环截取
      for (var i = 0; i < result.length; i += 6) {
        let temp = pro.slice(i, i + 6);
        // console.log(temp);
        for (let i = 0; i < temp.length; i++) {
          // console.log(i);
          temp[i]["page"] = page;
          arr.push(temp[i]);
        }
        page++;
      }
      if (err) {
        next(err);
        return;
      }
      // 判断长度 确定是否有值
      if (result.length) {
        res.send({ code: 1, msg: "ok", data: { data: arr } });
      } else {
        res.send({ code: 0, msg: "服务器端错误" });
      }
    });
  }
});

// 2.请求单一商品
// 请求方式 get
// 接口地址 http://127.0.0.1:3000/product/single/:c_id  (:c_id 替换成需要传入商品的id即可)
// 参数 c_id
router.get("/single/:c_id", (req, res, next) => {
  let obj = req.params;
  obj.c_id *= 1;
  console.log(obj);
  let sql = "select * from py_camera where c_id=?";
  pool.query(sql, [obj.c_id], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "ok", data: result });
    } else {
      res.send({ code: 0, msg: "未找到对应id的商品" });
    }
  });
});

// 3.新品推荐 前5条
// 请求方式 get
// http://127.0.0.1:3000/product/newcamera
router.get("/newcamera", (req, res, next) => {
  let sql = "select * from py_camera ORDER BY c_shelf_time desc LIMIT 0,3";
  pool.query(sql, (err, result) => {
    console.log(result);
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "最新10条数据", data: result });
    }
  });
});
// 4.首页数据
// 请求所有数据
// http://127.0.0.1:3000/product/indata
router.get("/indata", (req, res, next) => {
  let sql1 = "select * from py_index_carousel";
  let sql2 = "select * from py_index_product";
  pool.query(sql1, (err, result1) => {
    if (err) {
      next(err);
      return;
    }
    if (result1.length > 1) {
      pool.query(sql2, (err, result2) => {
        if (err) {
          next(err);
          return;
        }
        res.send({
          code: 1,
          msg: "ok",
          data: { carousel: result1, indexproduct: result2 },
        });
      });
    }
  });
});
// 导出
module.exports = router;
