<template>
  <!-- 订单模块↓↓↓↓↓↓↓↓ -->
  <div class="information">
    <!-- 我的订单 -->
    <div class="information_head">
      <span>我的信息</span>
    </div>
    <div class="information_body">
      <div class="information_body_1">
        <span>用户头像:</span>
        <img src="/img/user/no-img_mid_.jpg" alt="" />
        <a>更改头像</a>
      </div>
      <div class="information_body_2">
        <span>用户名称:</span>
        <input type="text" placeholder="请输入用户名" v-model="uname" />
      </div>
      <div class="information_body_4">
        <span>修改电话:</span>
        <input type="text" placeholder="请输入电话" v-model="uphone" />
      </div>
      <div class="information_body_5">
        <span>修改邮箱:</span>
        <input type="text" placeholder="请输入邮箱" v-model="uemail" />
      </div>
      <div class="information_body_5">
        <span>更改密码:</span>
        <input type="text" placeholder="请输入密码" v-model="upwd" />
      </div>
      <div class="information_body_6">
        <div @click="setUserInfo">保存更改</div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  data() {
    return {
      uname: "",
      uphone: "",
      uemail: "",
      upwd: "",
    };
  },
  mounted() {
    console.log(this);
  },
  // 修改当前用户信息
  methods: {
    ...mapMutations(["quit"]),
    setUserInfo() {
      let url = "http://127.0.0.1:3000/user/upuser";
      let params = `u_name=${this.uname}&u_phone=${this.uphone}&u_email=${this.uemail}&u_pwd=${this.upwd}&u_id=${this.$store.state.loginUserId}`;
      console.log(params);
      this.axios.post(url, params).then(res => {
        console.log(res);
        if (res.data.code == 1) {
          alert("修改成功");

          this.quit();
          this.$router.push("/");
        }
      });
    },
  },
};
</script>

<style src="../assets/css/user_style.css" scoped></style>
