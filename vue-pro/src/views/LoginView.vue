<template>
  <div>
    <div class="window right-pannel-active" id="window">
      <!-- 登录框 -->
      <div class="window_from window_signin">
        <div class="window_form" id="form2">
          <h2 class="sigup_title">登录</h2>
          <input type="text" placeholder="请输入手机号" class="input" v-model="u_phone" />
          <input type="password" placeholder="请输入密码" class="input"  v-model="u_pwd"/>
          <a href="#" class="link">忘记密码？</a>
          <button class="btn" @click="login">登录</button>
        </div>
      </div>

      <div class="window_overlay">
        <div class="overlay">
          <div class="overlay_panel overlay--right">
            <button class="btn" id="signup">未有账号，注册账号</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      u_phone: '',
      u_pwd:'',
    }
  },
  methods: {
    login() {
      let url = 'http://127.0.0.1:3000/user/login'
      this.axios.post(url,params).then(res=>{})
    }
  },
};
</script>

<style scoped >
/* src='../assets/css/login.css' */
</style>
<style lang="scss" scoped>
</style>