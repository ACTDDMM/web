<template>
  <div>
    <!-- <div
      class="product-content"
      v-for="{ c_title, c_price, c_img, c_id } in this.data"
      :key="c_id"
    >
      <div class="pro_img">
        <img :src="`/img/products/${c_img}`" alt="" />
      </div>
      <div class="pro_text">
        <a href="">
          <span>{{ c_title }} </span>
        </a>
        <h4>￥{{ c_price }}.00</h4>
      </div>
    </div> -->
  </div>
</template>

<script>
export default {
  props: [""],
};
</script>

<style lang="scss" scoped></style>
