// 引入express
const express = require("express");
const zhenzismsClient = require("./zhenzisms");
// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 测试手机验证码
router.get("/test", (req, res, next) => {
  console.log(zhenzismsClient);
  var client = new zhenzismsClient(
    "sms_developer.zhenzikj.com",
    "112011",
    "f99c8279-be7c-4474-bd0a-97f0dd422c77"
  );
  var params = {};
  params.templateId = "9882";
  params.number = "13759963313";
  params.templateParams = ["2221", "5分钟"];
  var result = client.send(params);
  console.log(result);
  res.send({
    "code":0,
    "data":"发送成功"
});
});
// 1.用户登录
// 请求方式 post
// 接口地址 http://127.0.0.1:3000/user/login
// 传递参数 u_phone , u_pwd
router.post("/login", (req, res, next) => {
  let obj = req.body;
  console.log(obj);
  let sql = "select * from py_user where u_phone=? and u_pwd=?";
  pool.query(sql, [obj.u_phone, obj.u_pwd], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 1, msg: "登录成功", data: result });
    } else {
      res.send({ code: 0, msg: "登录失败" });
    }
  });
});

//2.用户注册
// 请求方式 post
// 接口地址 http://127.0.0.1:3000/user/register
// 至少传入四个值  u_name	 u_pwd u_phone u_email
router.post("/register", (req, res, next) => {
  let obj = req.body;
  console.log(obj);
  let Sphone = "select * from py_user where u_phone=?";
  let Sreg = "insert into py_user values(null,?,?,?,?,null,null)";

  pool.query(Sphone, [obj.u_phone], (err, result) => {
    if (err) {
      next(err);
      return;
    }
    if (result.length) {
      res.send({ code: 0, msg: "手机号已存在" });
    } else {
      pool.query(
        Sreg,
        [obj.u_name, obj.u_pwd, obj.u_phone, obj.u_email],
        (err, result) => {
          console.log(result);
          if (err) {
            next(err);
            return;
          }
          if (result.affectedRows == 1) {
            res.send({ code: 1, msg: "注册成功" });
          } else {
            res.send({ code: 0, msg: "注册失败" });
          }
        }
      );
    }
  });
});

// 3.用户信息修改
// 请求方式 post
// 接口地址 http://127.0.0.1:3000/user/upuser
// 分情况 ： 1.只修改手机号 需要传入 新手机号 new_phone 和当前用户的 u_id
//          2.修改除手机外的个人信息 需要传入 u_phone u_name u_pwd u_email user_name u_avatar
router.post("/upuser", (req, res, next) => {
  let obj = req.body;
  console.log(obj);
  // UPDATE `py_user` SET `u_name` = '赵六1', `u_pwd` = '1234567', `u_phone` = '123456789', `u_email` = '123456789@qq.com' WHERE `py_user`.`u_id` = 4;
  let sql =
    "update py_user set u_name=?,u_pwd=?,u_phone=?,u_email=? where py_user.u_id=?";
  pool.query(
    sql,
    [obj.u_name, obj.u_pwd, obj.u_phone, obj.u_email, obj.u_id],
    (err, result) => {
      if (err) {
        next(err);
        return;
      }
      if (result.affectedRows == 1) {
        res.send({ code: 1, msg: "修改成功" });
      } else {
        res.send({ code: 0, msg: "修改失败" });
      }
    }
  );
});
// 导出
module.exports = router;
