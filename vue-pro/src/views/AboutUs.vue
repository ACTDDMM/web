<template >
<div v-if="data">
<div v-html="data.data[0].content">

</div>
</div>
</template>

<script>
export default {
  data() {
    return {
      data:null, 
    }
  },
  methods: {
    getData(){
      const url='http://127.0.0.1:3000/index/aboutus';
      this.axios.get(url).then((res)=>{
        console.log(res);
        this.data=res.data
      })
    }
  },
    mounted() {
      this.getData();
  },
};
</script>

<style>
    .dm {
      width: 1200px;
      margin: 0 auto;
      text-align: center;
    }
    .dm>.dz>.dz2,
    .dz3 {
      margin: 10px auto;
      font-weight: bold;
    }
</style>