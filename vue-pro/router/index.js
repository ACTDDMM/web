import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/inf',
    name: 'inf',
    component: () => import('../testing/Inf.vue'),
  },
  {
    path: '/swipe',
    name: 'swipe',
    component: () => import('../testing/Swipe.vue'),
  },
  {
    path: '/',
    redirect:'/home/index'
  },
  {
    path: '/tabbar',
    name: 'tabbar',
    component: () => import('../testing/Tabbar.vue'),
  },
  {
    path: '/vantregister',
    name: 'vant',
    component: () => import('../views/VantRegister.vue'),
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/Login.vue'),
  },
  {
    path: '/register',
    name: 'register',
    component: () => import('../views/Register.vue'),
  },
  {
    path: '/field',
    name: 'fidld',
    component: () => import('../testing/Field.vue'),
  },
  {
    path: '/navbar',
    name: 'navbar',
    component: () => import('../testing/Navbar.vue'),
  },
  {
    path: '/header',
    name: 'header',
    component: () => import('../testing/Header.vue'),
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    children:[
      {
        path: 'index',
        component: () => import('../views/Index.vue'),
      },
      {
        path: 'me',
        component: () => import('../views/Me.vue'),
      },
    ],
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
