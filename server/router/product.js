// 引入express
const express = require('express')

// 引入连接池
const pool = require('../mysql/mysql')

// 创建路由器
const router = express.Router()

// 路由---
router.get('/product')

// 导出
module.exports = router