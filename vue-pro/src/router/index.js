import Vue from "vue";
import VueRouter from "vue-router";
import NotFound from "../views/NotFound.vue";
import Index from "../views/Index.vue";

Vue.use(VueRouter);

const routes = [
  // 登录
  {
    path: "/login",
    name: "login",
    meta: {
      title: "用户登录",
      isshow: true,
    },
    component: () => import("../views/LoginView.vue"),
  },
  // 注册
  {
    path: "/reg",
    name: "register",
    meta: {
      title: "商品详情",
      isshow: true,
    },
    component: () => import("../views/RegView.vue"),
  },
  // 购物车路由
  {
    path: "/shopcart",
    name: "shopcart",
    meta: {
      title: "购物车",
    },
    component: () => import("../views/ShoppingCart.vue"),
  },
  {
    path: "/",
    name: "index",
    meta: {
      title: "相机商城-首页",
    },
    component: Index,
  },
  // 用户
  {
    path: "/user",
    name: "user",
    component: () => import("../views/User.vue"),
    props: true,
    redirect: "/user/order",
    children: [
      {
        path: "order",
        name: "order",
        meta: {
          title: "订单",
        },
        component: () => import("../components/Order.vue"),
      },
      {
        path: "information",
        name: "information",
        meta: {
          title: "用户信息",
        },
        component: () => import("../components/Information.vue"),
      },
    ],
  },
  {
    // 参数可选
    path: "/products/:serval?",
    name: "products",
    meta: {
      title: "搜索",
    },
    props: true,
    component: () => import("../views/ProductList.vue"),
  },
  {
    //商品详情页
    path: "/product/detail/:id",
    name: "ProductDetails",
    props: true,
    component: () => import("../views/ProductDetails.vue"),
    meta: {
      title: "商品详情",
    },
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

//添加全局前置守位
//凡是路由的跳转操作，都会触发守卫
router.beforeEach((to, from, next) => {
  document.title = to.meta.title;

  next(); //放行：让路由继续后续工作
});

export default router;
