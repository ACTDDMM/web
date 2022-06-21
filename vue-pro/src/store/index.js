import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    loginStatus: false,
    loginUserId: null,
  },
  getters: {},
  mutations: {
    updateLoginStatus(state) {},
    updateLoginUserId(state) {},
  },
  actions: {},
  modules: {},
});
