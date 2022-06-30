<template>
  <div class="my-header">
    <header>
      <!-- first header -->
      <div class="header-top clearfix">
        <div class="container">
          <div class="container-left">
            <!-- logo -->
            <router-link to="/">
              <img src="/img/index/logo.png" alt="" />
            </router-link>
          </div>
          <div class="container-input">
            <input
              type="text"
              placeholder="请相机输入类型"
              v-model="serval"
              @keyup.enter="goProducts"
            />
            <button class="btn">
              <router-link
                :to="'/products/' + serval"
                style="color: #fff; text-decoration: none"
                >搜索
              </router-link>
            </button>
          </div>
          <div class="container-right">
            <ul v-if="!loginUname">
              <li><router-link to="/login">登录</router-link></li>
              <li><router-link to="/reg">注册</router-link></li>
            </ul>
            <ul class="container-right" v-if="loginUname">
              <li>
                <!-- <iframe src="circle1.svg"></iframe> -->
                <!-- <embed src="../assets/css/tou.svg" type="image/svg+xml" /> -->
                <img src="/img/index/个人头像_o.png" alt="" />
                <router-link to="/user">
                  <p>欢迎{{ loginUname }}</p>
                </router-link>
              </li>
              <li @click="updateLogin">退出登录</li>
              <li><router-link to="/shopcart">购物车</router-link></li>
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
            <el-menu-item index="1">
              <router-link to="/">首页</router-link>
            </el-menu-item>
            <el-menu-item index="2">
              <router-link to="/aboutus">关于我们</router-link>
            </el-menu-item>
            <el-menu-item index="3">服务与支持</el-menu-item>
            <el-menu-item index="4">新品推荐</el-menu-item>
            <el-menu-item index="5">联系我们</el-menu-item>
            <el-submenu index="6" v-show="loginUname">
              <template slot="title">个人中心</template>
              <router-link to="/user/information">
                <el-menu-item index="6-1"> 修改个人信息 </el-menu-item>
              </router-link>
              <router-link to="/user/order">
                <el-menu-item index="6-2"> 个人订单查询 </el-menu-item>
              </router-link>
            </el-submenu>
          </el-menu>
        </div>
      </div>
      <!-- third row -->
    </header>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";
export default {
  data() {
    return {
      serval: "",
    };
  },
  methods: {
    goProducts() {
      if (this.$route.params.serval != this.serval) {
        this.$router.push("/products/" + this.serval);
      }
    },

    updateLogin() {
      this.updateLoginUname(null);
      this.updateLoginStatus(false);
      this.updateLoginUserId(null);

      sessionStorage.clear();
      console.log(this);
      if (this.$route.path == "/") {
        return;
      } else {
        this.$router.push("/");
      }
    },

    ...mapMutations([
      "updateLoginUname",
      "updateLoginStatus",
      "updateLoginUserId",
    ]),
  },
  computed: {
    ...mapState(["loginUname"]),
  },
};
</script>

<style scoped src="../assets/css/style.css"></style>
<style lang="scss" scoped></style>
