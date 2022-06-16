<template>
  <div class="lunbo">
    <div>
      <swiper
        @mouseover.native="stopSwiper"
        @mouseout.native="startSwiper"
        ref="swiper"
        class="swiper"
        :options="swiperOptions"
      >
        <swiper-slide class="swiper-lunbo">
          <img src="/img/index/carousel/1.jpg" alt="" />
        </swiper-slide>
        <swiper-slide class="swiper-lunbo">
          <img src="/img/index/carousel/2.jpg" alt="" />
        </swiper-slide>
        <swiper-slide class="swiper-lunbo">
          <img src="/img/index/carousel/3.jpg" alt="" />
        </swiper-slide>
        <swiper-slide class="swiper-lunbo">
          <img src="/img/index/carousel/4.jpg" alt="" />
        </swiper-slide>
        <!-- 分页器: 必须放入对应插槽中 -->
        <div class="swiper-pagination" slot="pagination"></div>
        <!-- 左右箭头: 必须放在对应的插槽中 -->
      </swiper>
    </div>
    <div>
      <index-floor></index-floor>
    </div>
  </div>
</template>

<script>
import IndexFloor from "@/components/IndexFloor.vue";
export default {
  components: { IndexFloor },
  data() {
    return {
      data: null, // 把请求数据存储到本地
      // swiper配置项:
      swiperOptions: {
        //效果,特效  默认为"slide"（普通位移切换），还可设置为"fade"（淡入）、"cube"（方块）、"coverflow"（3d流）、"flip"（3d翻转）
        effect: "fade",
        // 无限循环
        loop: true,
        // 自动滚动
        // autoplay: true, //默认的效果
        // 个性化配置
        autoplay: {
          delay: 2000, //间隔时长, 单位毫秒
          disableOnInteraction: false, //用户操作swiper后是否禁用自动滚动
        },
        // 分页器: 官方的API文档是 HTML版本的, 与 vue 中用法有细微差异
        pagination: {
          el: ".swiper-pagination",
          clickable: true, //响应点击事件
        },
      },
    };
  },
  methods: {
    // 鼠标进入时
    stopSwiper() {
      // console.log("我进来了!");
      //   console.log(this.$refs.swiper);
      // 中国.北京.丰台.大红门.xxx
      this.$refs.swiper.$swiper.autoplay.stop();
    },
    // 鼠标离开时
    startSwiper() {
      // console.log("我出来了!");
      this.$refs.swiper.$swiper.autoplay.start();
    },
    // 发送请求
  },
};
</script>

<style lang="scss" scoped>
</style>
<style lang="scss">
// scoped: 作用域 样式只影响当前组件中书写的元素
// 小圆点属于 swiper 组件内部子元素
.lunbo {
  width: 1200px;
  margin: 5px auto;
}
.swiper {
  width: 1200px;
  margin-bottom: 10px;

  .swiper-pagination-bullet {
    width: 16px;
    height: 16px;
    // background-color: red;
  }
}
.swiper-lunbo {
  padding: 10px;
}
.swiper-lunbo img {
  width: 1200px;
  height: 427px;
}
</style>