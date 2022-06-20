<template>
  <div>
    <my-header v-if="!this.$route.meta.isshow" />
    <router-view />
    <my-footer v-if="!this.$route.meta.isshow" />
  </div>
</template>

<script>
import MyFooter from "./components/MyFooter.vue";
import MyHeader from "./components/MyHeader.vue";
export default {
  components: { MyHeader, MyFooter },
};
</script>

<style lang="scss" scoped></style>
