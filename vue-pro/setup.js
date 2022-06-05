// 引入express模块
const express = require('express')

// 引入cros
const cors = require('cors')
// 引入路由 -- user
const userRouter = require('./router/user')

// 引入路由 -- admin
const adminRouter = require('./router/admin')

// 创建服务器
const app = express()

//跨越设置  接受全部
app.use(cors(
//   {
// 	origin:['http://localhost:8848','http://127.0.0.1:8848',
// 	'http://localhost:5500','http://127.0.0.1:5500'],  //指定接收的地址
//     methods:['GET','POST','DELETE','PUT'],  //指定接收的请求类型
//     alloweHeaders:['Content-Type','Authorization']  //指定header
// }
))

// 监听端口
app.listen(8080,()=>{
  console.log('启动成功...');
})

// 中间件--
// urlencoded
app.use(express.urlencoded({
  //是否使用第三方扩展
  extended:true
}))

// 托管静态资源
app.use(express.static('./public'))

// 挂载路由
// 用户路由 /users 前缀
app.use('/users',userRouter)

// 管理员路由  /admin 前缀
app.use('/admin',adminRouter)



// 错误处理中间件
app.use((err,req,res,next)=>{
  // 接受传递的错误 并打印 返回状态码
  console.log(err);
  // 响应 500
  return res.status(500).send({code:500,msg:'服务器端错误'})

})