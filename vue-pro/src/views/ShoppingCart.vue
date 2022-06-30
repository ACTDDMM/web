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
            ><img :src="'/img/products/' + scope.row.c_img" alt=""
          /></template>
        </el-table-column>
        <!-- 标题 -->
        <el-table-column prop="c_name" label="标题" width="150">
        </el-table-column>

        <!-- 价格 -->
        <el-table-column
          prop="c_price"
          label="价格"
          width="150"
        ></el-table-column>
        <!-- 数量 -->
        <el-table-column label="数量" width="210">
          <template slot-scope="scope">
            <el-input-number
              size="mini"
              v-model="scope.row.count"
              :min="1"
              label="描述文字"
            ></el-input-number>
          </template>
        </el-table-column>
        <!-- 金额 -->
        <el-table-column label="金额" width="150">
          <template slot-scope="scope">
            {{ (scope.row.c_price * scope.row.count).toFixed(2) }}
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
            <p>
              共计：<span>￥{{ total }}元</span>
            </p>
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
  // 监听multipleSelection 和 count（监听不到） 变化 更新总价
  watch: {
    multipleSelection() {
      // 遍历数据 找到 count price 累加结果 赋给total
      let total = 0;
      this.multipleSelection.forEach(value => {
        total += value.count * value.c_price;
      });
      this.total = total.toFixed(2);
    },
  },
  mounted() {
    this.getUserCart();
  },
  data() {
    return {
      ...mapState(["loginUserId"]),
      total: "0.00",
      tableData: [],
      multipleSelection: [],
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
      console.log(val);
      this.multipleSelection = val;
    },
    // 删除当前购物车项
    handleDelete(index, row) {
      console.log(index, row);
      // 发送请求 删除当前用户点击的购物车项
      let url = "/shopcart/delitem?cid=";
      let params = "cid=" + row.cid;
      this.axios.post(url, params).then(res => {
        console.log(res);
        alert(res.data.msg);
        if (res.data.code == 1) {
          this.getUserCart();
        }
      });
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
    getUserCart() {
      let url = "/shopcart/serlist?u_id=" + this.$store.state.loginUserId;
      // + this.$store.state.loginUserId;
      this.axios.get(url).then(res => {
        console.log(res);
        this.tableData = res.data.data;
      });
    },
  },
};
</script>
