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
              <span>￥{{ data.c_price }}.00元</span>
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
              <button
                class="numberMinus"
                :disabled="userInput == 1"
                @click="userInput--"
              >
                -
              </button>
              <input
                ref="userInput"
                type="text"
                v-model="userInput"
                @change="changeUserInput"
                class="number"
              />
              <button class="numberAdd" @click="userInput++">+</button>
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
                <span @click="addShoppingCart">加入购物车</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 下部 -->
      <div class="bottom">
        <!-- 商品详情 -->
        <el-tabs v-model="activeName">
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
                      :src="`/video/details/${data.c_video}`"
                      :poster="`/img/details/${data.c_img}`"
                      controls
                    ></video>
                  </div>
                </div>
                <div style="margin-left: 20px">
                  <div class="product-name">商品细节图</div>
                  <div style="padding-top: 5px">
                    <swiper
                      class="swiper"
                      :options="swiperOptions"
                      ref="swiper"
                      @mouseover.native="stopSwiper"
                      @mouseout.native="startSwiper"
                    >
                      <swiper-slide>
                        <img
                          :src="`/img/details/details_img/${data.c_swiper1}`"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          :src="`/img/details/details_img/${data.c_swiper2}`"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          :src="`/img/details/details_img/${data.c_swiper3}`"
                          alt=""
                        />
                      </swiper-slide>
                      <swiper-slide>
                        <img
                          :src="`/img/details/details_img/${data.c_swiper4}`"
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
          <el-tab-pane label="规格与包装" name="second">
            <div class="product-show">
              <!-- <div class="product-name">品牌: {{ data.c_category }}</div> -->
              <div class="product-canshu" style="color: gray">
                <div class="canshu-details_1">
                  <div>商品名称: {{ data.c_name }}</div>
                  <div>商品毛重: {{ data.c_weight }}</div>
                  <div>商品产地：{{ data.c_chandi }}</div>
                  <div>像素: {{ data.c_pixel }}</div>
                </div>
                <div class="canshu-details">
                  <div>类型: {{ data.c_type }}</div>
                  <div>视频采样: {{ data.c_spcy }}</div>
                  <div>功能: {{ data.c_gongneng }}</div>
                  <div>传感器尺寸：{{ data.c_frame }}</div>
                </div>
                <div class="canshu-details">
                  <div>适用场景：{{ data.c_sycj }}</div>
                  <div>RAW照片输出: {{ data.c_output }}</div>
                  <div>适用对象：{{ data.c_sydx }}</div>
                  <div>滤镜直径：{{ data.c_ljzj }}</div>
                </div>
              </div>

              <p class="paper_2">
                <img
                  src="http://www.codeboy.com:9999/img/product_detail/product_detail_icon_2.png"
                  alt=""
                  class="ys5"
                />
                &nbsp;包装清单
              </p>
              <p class="content" style="color: gray">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;相机 x1 适配器 x1 电源线 x1 电池 x1
                便携式相机套 x1 说明书（电子版）x1
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;备注：相机的机身上只会标注此相机的系列，例如：FUJIFILM
                XT-3
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;如果您需要核实此相机的具体配置型号是否与商城介绍相符，可电话咨询服务热线：13501014101
              </p>
            </div>
          </el-tab-pane>
          <el-tab-pane label="售后保障" name="third">
            <div class="sale_content">
              <p class="paper" id="sale_protect">
                <img
                  src="http://www.codeboy.com:9999/img/product_detail/product_detail_img16.png"
                  alt=""
                />
                正品保障
              </p>
              <p class="content">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本商城向您保证所售商品均为正品行货，所有自营商品开具机打发票或电子发票。
              </p>

              <p class="paper">
                <img
                  src="http://www.codeboy.com:9999/img/product_detail/product_detail_img16.png"
                  alt=""
                />
                全国联保
              </p>
              <p class="content">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;凭质保证书及本商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。本商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
              </p>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  data() {
    return {
      data: null,

      userInput: 1,

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

  computed: {
    //引入辅助函数...mapState()函数，校验登录状态
    ...mapState([
      "loginStatus",
      "loginUserId",
      "loginUname",
      "DetailUserInput",
      "DetailCid",
      "DetailCTitle",
    ]),
  },

  mounted() {
    console.log(this);
    this.getSingleCamera();
  },

  methods: {
    //请求数据库的商品表接口并接收商品页传递过来的商品的c_id
    getSingleCamera() {
      let url = `http://127.0.0.1:3000/product/single/${this.$route.params.id}`;
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data[0];
      });
    },

    //表单元素修改产品个数
    changeUserInput(e) {
      //用户输入进来的文本 * 1
      let value = e.target.value * 1;
      //如果用户输入进来的非法，出现NaN或者小于1
      if (isNaN(value) || value < 1) {
        this.userInput = 1;
      } else {
        //正常大于1但不能出现小数，若出现小数则向上取整
        this.userInput = parseInt(value);
        // console.log(this.userInput);
      }
    },

    //下方区域页签栏操作
    // handleClick(tab, event) {
    //   // console.log(tab, event);
    // },

    //设置两个事件
    //1.鼠标进入swiper组件时，停止轮播
    stopSwiper() {
      // console.log("我进来了!");
      // console.log(this.$refs);
      this.$refs.swiper.$swiper.autoplay.stop();
    },
    //2.鼠标离开swiper组件时，开启轮播
    startSwiper() {
      // console.log("我出来了!");
      this.$refs.swiper.$swiper.autoplay.start();
    },

    //引入mapMutations辅助函数
    ...mapMutations([
      "updateDetailUserInput",
      "updateDetailCid",
      "updateDetailCTitle",
    ]),

    //点击添加至购物车后，使用elementui的弹窗组件判断是否登录，若已登录则携参跳转至购物车页面，若未登录，跳转到登录页面
    addShoppingCart() {
      if (this.loginStatus == false || this.loginUserId == null) {
        //使用elementui的弹窗组件
        this.$confirm("尊敬的用户，在购买或添加到购物车前请先登录", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          center: true,
        })
          .then(() => {
            this.$router.push("/login");
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "添加到购物车失败，请先登录",
            });
          });
      } else {
        //将用户选择的商品c_id、c_title以及数量userInput存入vuex和sessionStroage
        this.updateDetailUserInput(this.userInput);
        this.updateDetailCid(this.data.c_id);
        this.updateDetailCTitle(this.data.c_title);

        //发axios请求再将用户选择的商品c_id、c_title以及数量userInput存入数据库的购物车表
        let params = `u_id=${this.loginUserId}&c_id=${this.data.c_id}&count=${this.userInput}`;
        let url = `http://127.0.0.1:3000/shopcart/addcart`;
        this.axios.post(url, params).then((res) => {
          console.log(res);
          if (res.data.code == 1) {
            alert(res.data.msg);
            this.$router.push("/shopcart");
          } else {
            alert(res.msg);
          }
        });
      }
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

    img {
      width: 350px;
      height: 350px;
    }
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

    //商品视频、详图轮播展示
    .product-video {
      margin: 30px 10px 10px 15px;
    }

    .swiper {
      width: 350px;

      margin: 20px 50px 20px 50px;

      img {
        width: 350px;
        height: 350px;
      }

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

    .paper_2 {
      margin-top: 15px;
      margin-left: 5px;
      font: 20px "simhei";
      color: #0aa1ed;
      font-family: Arial;
    }

    .content {
      font: 16px "simhei";
      color: black;
      font-family: Arial;
      margin-bottom: 30px;
    }
  }

  .sale_content {
    .paper {
      margin-top: 10px;
      font: 20px "simhei";
      color: #0aa1ed;
      font-family: Arial;
    }

    .content {
      font: 16px "simhei";
      color: black;
      font-family: Arial;
      margin-bottom: 30px;
    }
  }
}
</style>
