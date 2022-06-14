<template>
  <div>
    <!-- <div>头</div> -->
    <!-- 商品内容 -->
    <div class="content">
      <!-- 左侧展示栏 -->
      <div class="content-left">
        <div class="left-items">
          <div style="text-align: left; padding: 2px 2px 2px 8px">热销商品</div>
          <div class="item-img">
            <img src="../assets/img/products/024b930cf2be7ec8.jpg" alt="" />
          </div>
          <div class="item-text">
            <h4 class="itme-title">索尼(SONY)Alpha 7</h4>
            <h4 class="item-price">2222.22</h4>
          </div>
        </div>
      </div>
      <!-- 右侧商品内容 -->
      <div class="content-rigth" v-if="data">
        <!-- 商品内容 -->
        <div
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
        </div>
      </div>
      <!-- 分页 -->
      <div class="paging"></div>
    </div>
    <!-- <div>尾</div> -->
  </div>
</template>

<script>
export default {
  mounted() {
    this.getCameraList();
    console.log(this);
  },
  data() {
    return {
      data: null,
    };
  },
  methods: {
    getCameraList() {
      let url = "http://127.0.0.1:3000/product/list";
      this.axios.get(url).then(res => {
        this.data = res.data.data;
        console.log(this.data);
      });
    },
  },
};
</script>

<style scoped src="../assets/css/products_list.css"></style>
<style lang="scss" scoped></style>
