<template>
  <div class="index-floor">
    <div class="index-floor1">
      <div class="floor_content">
        <img src="/img/index/客服.png" alt="" />
        <div class="floor_content_1">
          <span>人工客服</span>
        </div>
      </div>
      <div class="floor_content">
        <img src="/img/index/安全支付.png" alt="" />
        <div class="floor_content_1">
          <span>安全支付</span>
          
        </div>
      </div>
      <div class="floor_content">
        <img src="/img/index/礼品卡.png" alt="" />
        <div class="floor_content_1">
          <span>精美礼品</span>
          
        </div>
      </div>
      <div class="floor_content">
        <img src="/img/index/运输.png" alt="" />
        <div class="floor_content_1">
          <span>运输服务</span>
          
        </div>
      </div>
    </div>
    <div class="index-floor2">
      <h1>热销商品</h1>

      <div class="floor-content1">
        <div class="floor-content1-item">
          <img :src="'/img/index/product/'+items[0].pic" alt="" />

          <p class="item1">
           {{items[0].title}}
          </p>
          <p class="item2">¥{{items[0].price}}</p>
        </div>

        <div class="floor-content1-item">
          <img :src="'/img/index/product/'+items[1].pic"  alt="" />

          <p class="item1">
          {{items[1].title}}
          </p>
          <p class="item2">¥{{items[1].price}}</p>
        </div>

        <div class="floor-content1-item">
          <img :src="'/img/index/product/'+items[2].pic"  alt="" />

          <p class="item1">
           {{items[2].title}}
          </p>
          <p class="item2">¥{{items[2].price}}</p>
        </div>

        <div class="floor-content1-item">
          <img :src="'/img/index/product/'+items[3].pic"  alt="" />

          <p class="item1">
             {{items[3].title}}
          </p>
          <p class="item2">¥{{items[3].price}}</p>
        </div>

        <div class="floor-content1-item">
          <img :src="'/img/index/product/'+items[4].pic"  alt="" />

          <p class="item1">
            {{items[4].title}}
          </p>
          <p class="item2">¥{{items[4].price}}</p>
        </div>
      </div>
    </div>

    <div class="index-floor3">
      <div class="floor-content2">
        <img src="/img/index/楼层2.jpeg" alt="" />
      </div>
      <div class="floor-content2">
        <img src="/img/index/indexfloor1.jpeg" alt="" />
      </div>
      <div class="floor-content2">
        <img src="/img/index/indexfloor3.jpeg" alt="" />
      </div>
    </div>
    <div class="index-floor4">
      <h1>精美单品</h1>
      <div class="index-floor-item">
        <div class="floor-content3">
          <div class="floor-content3-item">
            <img class="imgbig" :src="'/img/index/product/'+items[5].pic"   alt="" />
          </div>
          <div class="floor-content3-contanier">
            <p> {{items[5].title}}</p>
            <p>¥{{items[5].price}}</p>
            <p><a href="">查看详情</a></p>
          </div>
        </div>
        <div  class="floor-content4">
          <img class="imgsm" :src="'/img/index/product/'+items[6].pic"  alt="" />
          <p>{{items[6].title}}</p>
          <p>¥{{items[6].price}}</p>
          <p><a href="">查看详情</a></p>
        </div>
        <div class="floor-content4">
          <img class="imgsm" :src="'/img/index/product/'+items[7].pic"  alt="" />
          <p>{{items[7].title}}</p>
          <p>¥{{items[7].price}}</p>
          <p><a href="">查看详情</a></p>
        </div>
      </div>
    </div>
    <div class="index-floor5">
        <div class="floor-conten5">
            <img src="/img/index/2.jpeg" alt="">
        </div>
        <div class="floor-conten5">
            <img src="/img/index/3.jpeg" alt="">
        </div>
    </div>
  </div>
</template>

<script>
export default {
  props:['items']
};
</script>

<style lang="scss" scoped>
</style>
<style scoped src="../assets/css/indexfloor.css">
</style> 