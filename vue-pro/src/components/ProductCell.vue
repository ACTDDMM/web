<template>
  <div>
    <div class="product-content">
      <div class="pro_img">
        <img :src="`/img/products/${p.c_img}`" alt="" />
      </div>
      <div class="pro_text">
        <router-link :to="`/product/detail/${p.c_id}`">
          <span>{{ p.c_title }} </span>
        </router-link>
        <h4>￥{{ p.c_price }}.00</h4>
      </div>
    </div>
  </div>
</template>

<script>
import "../assets/css/products_list.css";
export default {
  props: ["p"],
  mounted() {
    console.log(this.p);
  },
};
</script>

<style lang="scss" scoped></style>
