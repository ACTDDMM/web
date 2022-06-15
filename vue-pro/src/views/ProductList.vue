<template>
  <div>
    <!-- <div>头</div> -->
    <!-- 商品内容 -->
    <div class="content">
      <!-- 左侧展示栏 -->
      <div class="content-left">
        <template v-if="newCamera">
          <div style="text-align: left; padding: 2px 2px 2px 8px">最新上架</div>
          <div
            class="left-items"
            v-for="{ c_id, c_img, c_name, c_price } in newCamera"
            :key="c_id"
          >
            <div class="item-img">
              <img :src="'/img/products/' + c_img" alt="" />
            </div>
            <div class="item-text">
              <h4 class="itme-title">{{ c_name }}</h4>
              <h4 class="item-price">￥{{ c_price }}.00</h4>
            </div>
          </div>
        </template>
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
  props: ["serval"],
  mounted() {
    this.getCameraList();
    this.getNewCamera();
    console.log(this);
  },
  watch: {
    serval() {
      this.getCameraList();
    },
  },
  data() {
    return {
      data: null,
      newCamera: null,
    };
  },
  methods: {
    getCameraList() {
      let url = `http://127.0.0.1:3000/product/list?kw=` + this.serval;
      this.axios.get(url).then((res) => {
        this.data = res.data.data;
        console.log(this.data);
      });
    },
    getNewCamera() {
      let url = "http://127.0.0.1:3000/product/newcamera";
      this.axios.get(url).then((res) => {
        this.newCamera = res.data.data;
        console.log(res);
      });
    },
  },
};
</script>

<style scoped src="../assets/css/products_list.css"></style>
<style lang="scss" scoped></style>
