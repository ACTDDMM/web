<template>
  <div>
   <my-header></my-header>
   <router-view/>
    <my-footer></my-footer>
  </div>
</template>

<script>
import MyFooter from './components/MyFooter.vue'

import  './assets/css/style.css';

import MyHeader from './components/MyHeader.vue';
  export default {
  components: { MyFooter, MyHeader },
    
  }
 
</script>

<style lang="scss" scoped>

</style>
