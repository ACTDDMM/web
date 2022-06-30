import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

// swiper
import VueAwesomeSwiper from "vue-awesome-swiper";
import "swiper/css/swiper.css";
Vue.use(VueAwesomeSwiper);

// elementui
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
Vue.use(ElementUI);

// axios
import axios from "axios";
import VueAxios from "vue-axios";
axios.defaults.baseURL = "http://127.0.0.1:3000";
Vue.use(VueAxios, axios);

Vue.config.productionTip = false;
new Vue({
  router,
  store,
  render: h => h(App),
}).$mount("#app");
