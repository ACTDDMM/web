// 引入mysql模块
const mysql = require("mysql");

// 创建连接池pool
const pool = mysql.createPool({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "root",
  database: "photography",
  connectionLimit: 20,
});

//导出
module.exports = pool;
