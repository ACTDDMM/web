// 引入express模块
const express = require("express");

// 跨域
const cors = require("cors");

// 引入路由 -- user
const userRouter = require("./router/user");
// 引入路由 -- admin
const adminRouter = require("./router/admin");
// 引入路由 -- products
const productRouter = require("./router/product");
// 引入路由 -- index
const indexRouter = require("./router/index");
// 引入路由 -- shopcart
const shopcartRouter = require("./router/shopcart");

// 创建服务器
const app = express();

// 监听端口
app.listen(3000, () => {
  console.log("启动成功...");
});
//跨域设置
//跨域处理 cors
app.use(
  cors({
    origin: "*",
  })
);

// 中间件--

// urlencoded
app.use(
  express.urlencoded({
    //是否使用第三方扩展
    extended: true,
  })
);

// 托管静态资源 后面看情况调整
app.use(express.static("./public"));

// 挂载路由
// 用户路由 /users 前缀
app.use("/user", userRouter);

// 管理员路由  /admin 前缀
app.use("/admin", adminRouter);

// 管理员路由  /admin 前缀
app.use("/product", productRouter);

// 首页数据  /index 前缀
app.use("/index", indexRouter);
// 购物车  /shopcart 前缀
app.use("/shopcart", shopcartRouter);

// 错误处理中间件
app.use((err, req, res, next) => {
  // 接受传递的错误 并打印 返回状态码
  console.log(err);
  // 响应 500
  res.status(500).send({ code: 500, msg: "服务器端错误" });
});
