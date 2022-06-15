<template>
  <div>
    <my-header v-if="this.$route.path!='/login'"></my-header>
    <router-view />
    <my-footer  v-if="this.$route.path!='/login'"></my-footer>
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
