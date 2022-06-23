<template>
  <div>
    <!-- 背景 -->
    <div class="bg">
      <!-- 版心↓↓↓↓↓↓↓↓ -->
      <div class="w">
        <!-- 钱包模块↓↓↓↓↓↓↓↓ -->
        <div class="qianbao">
          <!-- VIP卡片包 -->
          <div class="card">
            <div class="card1">
              <img src="/img/user/no-img_mid_.jpg" alt="" />
              <h3>admin_HD</h3>
              <div class="vip">VIP</div>
              <div class="score">积分值 8848</div>
            </div>
            <div class="card2">
              <span>VIP会员尊享10大权益</span>
              <a href="">去逛逛</a>
            </div>
          </div>
          <!-- 我的钱包 -->
          <div class="qianbao-big">
            <div class="qianbao1"><span>我的钱包</span></div>
            <div class="qianbao2">
              <div class="top">
                <div>
                  <h2>17</h2>
                  <span>优惠券</span>
                  <a href="">领券</a>
                </div>
                <div>
                  <h2>0.00￥</h2>
                  <span>余额</span>
                  <a href="">详情</a>
                </div>
                <div>
                  <h2>1227</h2>
                  <span>积分</span>
                  <a href="">赚积分</a>
                </div>
                <div>
                  <h2>17.22￥</h2>
                  <span>红包</span>
                  <a href="">查看&nbsp;|&nbsp;领取</a>
                </div>
                <div>
                  <h2>0.00￥</h2>
                  <span>昨日收益</span>
                  <a href="">查看</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 侧边导航栏模块↓↓↓↓↓↓↓↓ -->
        <el-container style="height: 800px">
          <el-aside height="400px" width="200px" style="background-color: #fff">
            <el-menu
              class="left-item"
              :default-active="$route.path"
              :router="true"
            >
              <el-menu-item class="item-text" index="/user/order">
                <i class="el-icon-document"></i>
                <span slot="title">个人订单查询</span>
              </el-menu-item>

              <el-menu-item class="item-text" index="/user/information">
                <i class="el-icon-edit-outline"></i>
                <span slot="title">修改个人信息</span>
              </el-menu-item>
            </el-menu>
          </el-aside>
          <el-main class="mmain">
            <router-view></router-view>
          </el-main>
        </el-container>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style src="../assets/css/user_style.css" scoped></style>
