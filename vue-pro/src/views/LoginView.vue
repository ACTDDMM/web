<template>
  <div class="app">
    <el-form
      :model="ruleForm"
      status-icon
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <h1>用户登录</h1>
      <el-form-item label="手机号" prop="phone">
        <el-input
          v-model="ruleForm.phone"
          placeholder="请输入你的手机号"
        ></el-input>
      </el-form-item>

      <el-form-item label="密码" prop="pass">
        <el-input
          type="password"
          v-model="ruleForm.pass"
          autocomplete="off"
          placeholder="请输入你的密码"
        ></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="submitForm(ruleForm)">登录</el-button>

        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  data() {
    var checkPhone = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("手机号不能为空"));
      }
    };

    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass");
        }
        callback();
      }
    };

    return {
      ruleForm: {
        pass: "",
        phone: "",
      },
      rules: {
        pass: [{ validator: validatePass, trigger: "blur" }],
        phone: [{ validator: checkPhone, trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      console.log(formName);
      let params = `u_pwd=${formName.pass}&u_phone=${formName.phone}`;
      let url = "/user/login";
      this.axios.post(url, params).then(res => {
        console.log(res);
        if (res.data.code == 1) {
          res.data.loginstatus = true;
          alert(res.data.msg);
          // res.data.data[0] 将用户信息传至vuex
          this.updateLoginStatus(res.data.loginstatus);
          this.updateLoginUserId(res.data.data[0].u_id);
          this.updateUserInfo(res.data.data[0]);
          this.$router.push("/");
        } else {
          alert(res.msg);
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    ...mapMutations([
      "updateLoginStatus",
      "updateLoginUserId",
      "updateUserInfo",
    ]),
  },
};
</script>

<style lang="scss" scoped>
:root {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}
* {
  margin: 0;
  padding: 0;
}
.app {
  align-items: center;
  background: url("../assets/bg.png");
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  display: grid;
  height: 100vh;
  place-items: center;
}
.demo-ruleForm {
  width: 350px;
  height: 350px;
  padding: 20px;
}
.el-form-item {
  margin: 20px 0px;
}
.el-button {
  width: 70px;
  height: 40px;
  text-align: center;
  line-height: 40px;
}
</style>
