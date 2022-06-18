<template>
  <div class="app">
    <div class="shopcart">
      <div style="margin-top: 20px">
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div>
      <!--  -->
      <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        style="width: 100%"
        max-height="650"
        @selection-change="handleSelectionChange"
      >
        <!--  -->
        <el-table-column type="selection" width="55"></el-table-column>
        <!--  -->
        <el-table-column label="商品" width="150">
          <template slot-scope="scope"
            ><img :src="scope.row.img" alt=""
          /></template>
        </el-table-column>
        <!--  -->
        <el-table-column prop="name" label="标题" width="150">
        </el-table-column>
        <!--  -->

        <!--  -->
        <el-table-column label="价格" width="150"></el-table-column>
        <el-table-column label="数量" width="210"> </el-table-column>
      </el-table>
      <template>
        <button></button>
      </template>
    </div>
  </div>
</template>

<script>
import "../assets/css/shoppingcart.css";
export default {
  data() {
    return {
      tableData: [
        {
          img: "/img/index/carousel/1.jpg",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
          price: "10086",
        },
      ],
      multipleSelection: [],
      num: 1,
    };
  },

  methods: {
    toggleSelection(rows) {
      if (rows) {
        rows.forEach(row => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleChange(value) {
      console.log(value);
    },
  },
};
</script>
