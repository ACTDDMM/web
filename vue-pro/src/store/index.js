import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    loginStatus: sessionStorage.getItem("status"), //登录状态
    loginUserId: sessionStorage.getItem("userId"), //用户id
    loginUserInfo: null, //用户信息
  },
  getters: {},
  mutations: {
    updateLoginStatus(state, userInfo) {
      state.loginStatus = userInfo;
      sessionStorage.setItem("status", userInfo);
    },
    updateLoginUserId(state, userInfo) {
      state.loginUserId = userInfo;
      sessionStorage.setItem("userId", userInfo);
    },
    updateUserInfo(state, userInfo) {
      // let Info = userInfo.stringify();
      console.log(userInfo);
      state.loginUserInfo = userInfo;
      // sessionStorage.setItem("userInfo", Info);
    },
    quit(state, payload) {
      sessionStorage.removeItem("status");
      sessionStorage.removeItem("userId");
    },
  },
  actions: {},
  modules: {},
});
