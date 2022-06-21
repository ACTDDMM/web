// 引入express
const express = require("express");

// 引入连接池
const pool = require("../mysql/mysql");

// 创建路由器
const router = express.Router();

// 路由---
// 1. 获取当前用户的购物车信息
// http://127.0.0.1:3000/shopcart/serlist
// post 传（u_id,c_id,count）
// SELECT py_user.u_id,py_shopping_cart.count,py_shopping_cart.camera_id,py_camera.c_img,py_camera.c_name,py_camera.c_price from py_user,py_shopping_cart,py_camera where py_user.u_id=py_shopping_cart.user_id and py_shopping_cart.camera_id=py_camera.c_id;
router.post("/serlist", (req, res, next) => {
  let obj = req.body;
  console.log(obj);
  let sql = 'select * '
  pool.query()
});
// 2.加入购物车的接口
// 请求方式 post
// 接口地址 http://127.0.0.1:3000/shopcart/addcart
// 传 u_id,c_id,count
// insert into py_shopping_cart values(null,)
router.post('/addcart',(req,res,next)=>{

})
// 导出
module.exports = router;
