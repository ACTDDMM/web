<template>
  <div class="my-header">
    <header>
      <!-- first header -->
      <div class="header-top clearfix">
        <div class="container">
          <div class="container-left">
            <!-- logo -->
            <a href="">
              <img src="../assets/img/index/logo.png" alt="" />
            </a>
          </div>
          <div class="container-input">
            <input type="text" placeholder="相机" />
            <button class="btn">搜索</button>
          </div>
          <div class="container-right">
            <ul>
              <li><a href="">登录</a></li>
              <li><a href="">注册</a></li>
              <li><a href="">购物车</a></li>
            </ul>
          </div>
          <div class="clear"></div>
        </div>
        <!--  container custom_container -->
      </div>

      <div class="nav">
        <div class="nav-container">
          <el-menu
            class="el-menu-demo"
            mode="horizontal"
            text-color="#333"
            active-text-color="#ffd04b"
          >
            <el-menu-item index="1">首页</el-menu-item>
            <el-menu-item index="2">关于我们</el-menu-item>
            <el-menu-item index="3">服务与支持</el-menu-item>
            <el-menu-item index="4">新品推荐</el-menu-item>
            <el-menu-item index="5">联系我们</el-menu-item>
            <el-submenu index="6">
              <template slot="title">个人中心</template>
              <el-menu-item index="6-1">修改个人信息</el-menu-item>
              <el-menu-item index="6-2">个人订单查询</el-menu-item>
            </el-submenu>
          </el-menu>
        </div>
      </div>
      <!-- third row -->
    </header>
  </div>
</template>

<script>
export default {};
</script>

<style scoped src="../assets/css/style.css"></style>
<style lang="scss" scoped></style>
