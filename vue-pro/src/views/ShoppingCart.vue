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
        <!-- 勾选框 -->
        <el-table-column type="selection" width="55"></el-table-column>
        <!-- 商品 -->
        <el-table-column label="商品" width="150">
          <template slot-scope="scope"
            ><img :src="scope.row.img" alt=""
          /></template>
        </el-table-column>
        <!-- 标题 -->
        <el-table-column prop="name" label="标题" width="150">
        </el-table-column>

        <!-- 价格 -->
        <el-table-column
          prop="price"
          label="价格"
          width="150"
        ></el-table-column>
        <!-- 数量 -->
        <el-table-column label="数量" width="210">
          <template slot-scope="scope">
            <el-input-number
              size="mini"
              v-model="scope.row.num"
              :min="1"
              label="描述文字"
            ></el-input-number>
          </template>
        </el-table-column>
        <!-- 金额 -->
        <el-table-column label="金额" width="150">
          <template slot-scope="scope">
            {{ (scope.row.price * scope.row.num).toFixed(2) }}
          </template>
        </el-table-column>
        <!-- 操作 -->
        <el-table-column label="操作" min-width="15%">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="summery">
        <div class="summery-left">
          <h2>合计：</h2>
        </div>
        <div class="summery-right">
          <div class="right-pro">
            <span>已选购1商品</span>
            <p>共计：<span>￥8888.00元</span></p>
            <span>结算</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import "../assets/css/shoppingcart.css";
export default {
  data() {
    return {
      ...mapState(["loginUserId"]),
      tableData: [
        {
          id: 1,
          img: "/img/index/carousel/1.jpg",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
          price: "10086",
          num: 1,
        },
        {
          id: 2,
          img: "/img/index/carousel/1.jpg",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
          price: "10086",
          num: 1,
        },
      ],
      multipleSelection: [],
    };
  },

  methods: {
    toggleSelection(rows) {
      if (rows) {
        rows.forEach(row => {
          this.$refs.multipleTable.toggleRowSelection(row);
          console.log(1);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
        console.log(2);
      }
    },
    handleSelectionChange(val) {
      console.log(val);
      this.multipleSelection = val;
    },
    handleDelete(index, row) {
      console.log(index, row);
    },
    getSummaries(param) {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = "总价";
          return;
        }
        const values = data.map(item => Number(item[column.property]));
        if (!values.every(value => isNaN(value))) {
          sums[index] = values.reduce((prev, curr) => {
            const value = Number(curr);
            if (!isNaN(value)) {
              return prev + curr;
            } else {
              return prev;
            }
          }, 0);
          sums[index] += " 元";
        } else {
          sums[index] = "N/A";
        }
      });

      return sums;
    },
    // 获取当前用户的购物车列表
    getUserCart(){
      
    }
  },
};
</script>
