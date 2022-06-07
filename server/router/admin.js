// 引入express
const express = require('express')

// 引入连接池
const pool = require('../mysql/mysql')

// 创建路由器
const router = express.Router()

// 路由---
// 接口地址 http://127.0.0.1:5050/admin/login
router.post('/login',(req,res,next)=>{
  res.send({code:1,msg:'登录成功'})
  let obj = req.body;
  console.log(obj);
  // console.log(obj.a_name);
  // console.log(obj);
  pool.query('select * from admin where a_name=? and a_password=?',[obj.a_name,obj.a_password],(err,result)=>{
    if(err){
      next(err)
      return;
    }
    res.send({code:1,msg:"ok"})
  })
})

// 导出
module.exports = router