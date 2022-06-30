import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    loginStatus: sessionStorage.getItem("status"), //登录状态
    loginUserId: sessionStorage.getItem("userId"), //用户id
    // loginUserInfo: sessionStorage.getItem("userinfo"), //用户信息
    loginUname: sessionStorage.getItem("uname"), //用户名

    //
    //

    DetailUserInput: sessionStorage.getItem("product_count"), //用户选择加入购物车的商品数量
    DetailCid: sessionStorage.getItem("product_c_id"), //用户选择加入购物车的商品id
    DetailCTitle: sessionStorage.getItem("product_c_title"), //用户选择加入购物车的商品标题
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

    // updateUserInfo(state, userInfo) {
    //   state.loginUserInfo = userInfo;
    //   sessionStorage.setItem("userInfo", JSON.stringify(userInfo));
    // },

    updateLoginUname(state, uname) {
      state.loginUname = uname;
      sessionStorage.setItem("uname", uname);
    },

    //
    //

    updateDetailUserInput(state, product_count) {
      state.DetailUserInput = product_count;
      sessionStorage.setItem("product_count", product_count);
    },

    updateDetailCid(state, product_c_id) {
      state.DetailCid = product_c_id;
      sessionStorage.setItem("product_c_id", product_c_id);
    },

    updateDetailCTitle(state, product_c_title) {
      state.DetailCTitle = product_c_title;
      sessionStorage.setItem("product_c_title", product_c_title);
    },
  },

  actions: {},

  modules: {},
});
