<template>
  <div class="stars" style="background: url('../assets/bg_purple.png')">
    <div class="central-body">
      <img class="image-404" src="/img/notfound/404.svg" width="300px" />
      <router-link to="/" class="btn-go-home" target="_blank"
        >返回主页</router-link
      >
    </div>
    <div class="objects">
      <img class="object_rocket" src="/img/notfound/rocket.svg" width="40px" />
      <div class="earth-moon">
        <img class="object_moon" src="/img/notfound/moon.svg" width="80px" />
      </div>
      <div class="box_astronaut">
        <img
          class="object_astronaut"
          src="/img/notfound/astronaut.svg"
          width="140px"
        />
      </div>
    </div>
    <div class="glowing_stars">
      <div class="star"></div>
      <div class="star"></div>
      <div class="star"></div>
      <div class="star"></div>
      <div class="star"></div>
    </div>
  </div>
</template>

<script>
import "../assets/css/404.css";
export default {};
</script>

<style lang="scss" scoped>
</style>