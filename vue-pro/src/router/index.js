import Vue from "vue";
import VueRouter from "vue-router";
import NotFound from "../views/NotFound.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/products/:c_id",
    name: "products",
    component: () => import("../views/ProductList.vue"),
  },
  {
    path: "*",
    name: "404",
    component: NotFound,
  },
  {
    path: "/aboutus",
    name: "aboutus",
    component: () => import("../views/AboutUs.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
