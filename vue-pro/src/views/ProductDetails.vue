<template>
  <div>
    <!-- <div>头</div> -->
    <!-- 单个商品内容 -->
    <div class="sp-content" v-if="data">
      <!-- 上部 -->
      <div class="top">
        <!-- 左侧图片展示栏 -->
        <div class="content-left">
          <img :src="`/img/details/${data.c_img}`" alt="" />
        </div>
        <!-- 右侧商品内容 -->
        <div class="content-right">
          <!-- 商品名称 -->
          <h3 class="title">{{ data.c_title }}</h3>
          <!-- 价格、服务承诺、客服 -->
          <div class="price">
            <div class="pro-price">
              <b>售价：</b>
              <span>￥{{ data.c_price }}</span>
            </div>
            <div class="promise">
              <b>服务承诺：</b>
              <span>*极速退款*2天内发货*7天无理由退货*退货补运费</span>
            </div>
            <!-- 客服 -->
            <p class="kefu">
              <b>客服：</b>
              <span class="connect">联系客服</span
              ><img
                class="gif"
                src="http://www.codeboy.com:9999/img/product_detail/kefuf.gif"
              />
            </p>
          </div>
          <!-- 数量、购买部分 -->
          <div class="count-buy-addcart">
            <!-- 数量 -->
            <div class="count">
              <b>数量：</b>
              <button class="numberMinus">-</button>
              <input type="text" value="1" class="number" />
              <button class="numberAdd">+</button>
            </div>
            <!-- 立即购买、加入购物车 -->
            <div class="buy-addcart">
              <!-- 立即购买 -->
              <div class="buy">
                <span>立即购买</span>
              </div>
              <!-- 加入购物车 -->
              <div class="addcart">
                <img
                  src="http://www.codeboy.com:9999/img/product_detail/product_detail_img7.png"
                  alt=""
                />
                <span>加入购物车</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 下部 -->
      <div class="bottom">
        <!-- 商品详情 -->
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <!-- 商品介绍 -->
          <el-tab-pane label="商品介绍" name="first">
            <div class="product-show">
              <div class="product-name">品牌: {{ data.c_category }}</div>
              <div class="product-canshu">
                <div class="canshu-details_1">
                  <div>商品名称: {{ data.c_name }}</div>
                  <div>类型: {{ data.c_type }}</div>
                  <div>商品毛重: {{ data.c_weight }}</div>
                  <div>商品产地：{{ data.c_chandi }}</div>
                </div>
                <div class="canshu-details">
                  <div>像素: {{ data.c_pixel }}</div>
                  <div>RAW照片输出: {{ data.c_output }}</div>
                  <div>功能: {{ data.c_gongneng }}</div>
                  <div>视频采样: {{ data.c_spcy }}</div>
                </div>
                <div class="canshu-details">
                  <div>传感器尺寸：{{ data.c_frame }}</div>
                  <div>滤镜直径：{{ data.c_ljzj }}</div>
                  <div>适用对象：{{ data.c_sydx }}</div>
                  <div>适用场景：{{ data.c_sycj }}</div>
                </div>
              </div>
              <!-- 商品视频、详图展示 -->
              <div style="display: flex">
                <div>
                  <div class="product-name">商品展示视频</div>
                  <div class="product-video">
                    <video
                      style="background: black"
                      width="640"
                      height="360"
                      src="/video/details/sony-ILCE-7M3.mp4"
                      poster="/img/details/fe35fd8fc4fe06e1.jpg"
                      controls
                    ></video>
                  </div>
                </div>
                <div>
                  <div class="product-name">商品细节图</div>
                  <div>
                    <swiper
                      class="swiper"
                      :options="swiperOptions"
                      ref="swiper"
                      @mouseover.native="stopSwiper"
                      @mouseout.native="startSwiper"
                    >
                      <swiper-slide>
                        <img
                          src="/img/details/details_img/sony/1.jpg.avif"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          src="/img/details/details_img/sony/2.jpg.avif"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          src="/img/details/details_img/sony/3.jpg.avif"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          src="/img/details/details_img/sony/4.jpg.avif"
                          alt=""
                        />
                      </swiper-slide>
                      <!-- swiper组件中的左右箭头：放到对应插槽里 -->
                      <div class="swiper-button-prev" slot="button-prev"></div>
                      <div class="swiper-button-next" slot="button-next"></div>
                    </swiper>
                  </div>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="规格与包装" name="second">规格与包装</el-tab-pane>
          <el-tab-pane label="售后保障" name="third">售后保障</el-tab-pane>
        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: null,

      activeName: "first",

      //swiper组件的各种配置项swiperOptions ———— 需要通过options属性 绑定在swiper组件上
      //变量名swiperOptions随便写，但是 最好见名知意
      swiperOptions: {
        //effect ———— 效果，特效
        //默认为slide（普通位移切换），还可设置为"fade"（淡入）、"cube"（方块）、"coverflow"（3d流）、"flip"（3d翻转）（可在swiper官方文档中选择合适的效果）
        effect: "slide",

        //自动滚动
        //autoplay: true, //默认的效果
        //个性化配置
        autoplay: {
          delay: 2000, // 间隔时长，单位毫秒
          disableOnInteraction: false, // 用户操作swiper后是否禁用自动滚动，默认是true ——— 禁用，false ——— 不禁用
          //pauseOnMouseEnter: true, //鼠标放上去暂停轮播(6版本的swiper组件使用)(当前版本得见下方methods中绑定的两个事件)
        },

        //swiper组件中的左右箭头的设置：
        navigation: {
          //nextEl：对应上面class="swiper-button-next"的div元素
          nextEl: ".swiper-button-next",
          //prevEl：对应上面class="swiper-button-prev"的div元素
          prevEl: ".swiper-button-prev",
        },
      },
    };
  },

  mounted() {
    // console.log(this);
    this.getSingleCamera();
  },

  methods: {
    getSingleCamera() {
      let url = `http://127.0.0.1:3000/product/single/${this.$route.params.id}`;
      this.axios.get(url).then(res => {
        console.log(res);
        this.data = res.data.data[0];
      });
    },

    handleClick(tab, event) {
      // console.log(tab, event);
    },

    //设置两个事件
    //1.鼠标进入swiper组件时，停止轮播
    stopSwiper() {
      // console.log("我进来了!");
      // console.log(this.$refs.swiper);
      this.$refs.swiper.$swiper.autoplay.stop();
    },
    //2.鼠标离开swiper组件时，开启轮播
    startSwiper() {
      // console.log("我出来了!");
      this.$refs.swiper.$swiper.autoplay.start();
    },
  },
};
</script>

<style lang="scss" scoped>
:root {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-color: rgb(247, 237, 237);
}

/* 单个商品上部展示部分 */
.top {
  width: 1200px;
  display: flex;
  flex-direction: row;
  margin: 10px auto;

  //左侧图片展示部分
  .content-left {
    width: 40%;
    display: flex;
    //图片水平居中
    justify-content: center;
  }

  //右侧内容展示部分
  .content-right {
    margin-bottom: 30px;
    display: flex;
    flex-direction: column;

    //商品名称
    .title {
      margin: 10px 0;
    }

    //商品价格部分
    .price {
      box-shadow: 0px 0px 10px rgb(129, 127, 127);

      //售价
      .pro-price {
        margin: 20px 20px;
        span {
          font: 34px "simhei";
          color: #0aa1ed;
          font-family: Arial;
        }
      }

      //服务承诺
      .promise {
        margin: 20px 20px;
      }

      //客服
      .kefu {
        margin: 20px 20px;
      }
    }

    //数量选择、购买部分
    .count-buy-addcart {
      margin: 20px 0;
      display: flex;
      flex-direction: column;

      //数量选择部分
      .count {
        margin: 10px 0;
        display: flex;
        flex-direction: row;

        .numberMinus {
          width: 35px;
          height: 35px;
        }

        .number {
          width: 50px;
          height: 35px;
          text-align: center;
        }

        .numberAdd {
          width: 35px;
          height: 35px;
        }
      }

      //购买
      .buy-addcart {
        display: flex;
        flex-direction: row;

        //立即购买
        .buy {
          width: 150px;
          height: 40px;
          display: inline-block;
          line-height: 40px;
          text-align: center;
          margin: 10px 10px 10px 48px;
          background-color: #0aa1ed;
          border: 1px solid gray;

          span {
            font: 18px "simhei";
            color: #fff;
            font-family: Arial;
          }
        }

        //加入购物车
        .addcart {
          width: 150px;
          height: 40px;
          margin: 10px 30px;
          background-color: #0aa1ed;
          border: 1px solid gray;

          img {
            position: relative;
            top: 9px;
            left: 10px;
          }

          span {
            position: relative;
            top: 5px;
            left: 20px;
            font: 18px "simhei";
            color: #fff;
            font-family: Arial;
          }
        }
      }
    }
  }
}

//单个商品下部展示内容
.bottom {
  width: 1200px;
  margin: 10px auto;

  .product-show {
    display: flex;
    flex-direction: column;

    .product-name {
      margin: 0 10px 10px 15px;
      font: 16px "simhei";
      color: #0aa1ed;
      font-family: Arial;
    }

    .product-canshu {
      display: flex;
      flex-direction: row;
      margin: 0 10px 10px 15px;
      font: 16px "simhei";
      color: black;
      font-family: Arial;

      .canshu-details_1 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin: 10px 70px 10px 0;

        div {
          margin: 10px 0;
        }
      }

      .canshu-details {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin: 10px 70px;

        div {
          margin: 10px 0;
        }
      }
    }

    //商品视频、详图展示
    .product-video {
      margin: 30px 10px 10px 15px;
    }

    .swiper {
      width: 450px;
      //是指上下边距为5象素,左右自动边距,一般用来自动居中
      margin: 20px 16px;

      .swiper-button-prev {
        width: 10px;
        height: 10px;
        color: black;
      }

      .swiper-button-next {
        width: 10px;
        height: 10px;
        color: black;
      }
    }
  }
}
</style>
