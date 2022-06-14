<template>
  <div>
    <my-header></my-header>
    <router-view />
    <my-footer></my-footer>
  </div>
</template>

<script>
import MyFooter from "./components/MyFooter.vue";

import MyHeader from "./components/MyHeader.vue";
export default {
  mounted() {
    console.log(this);
  },
  components: { MyFooter, MyHeader },
};
</script>

<style lang="scss" scoped>
</style>
