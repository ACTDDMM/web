# Vue

## WEB开发的发展史

- 早期: 利用原生 DOM 实现
- 中期: jQuery
  - 利用代码封装技巧, 简化了 DOM 操作的代码
  - `评价`: 旧时代的王者
- 现在: Vue
  - `自动化`: DOM操作全自动 -- 自动查找到元素然后进行操作 

## Vue目前有3个版本, 从2014年开始

> 官网: https://vuejs.bootcss.com/api/

- Vue1: `已淘汰`
- Vue2: `目前主流, 但是过渡期`
- Vue3: `未来的主流, 市场份额逐步深入`

> 目前工作中, 主流的技术 -- 不会vue很难找到工作

Vue以其`简单`著称, 特别适合`新手`

- jQuery理念: `Write Less, do More` 写的少, 做的多
- Vue理念: `不写, 也能做`  -- 不会DOM 依然能开发

Vue的开发方式: 分两种

- 脚本方式: 同jQuery, 适合入门阶段
- 脚手架方式: 工程化,类似 express, 适合实际开发

## 插值语法

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>插值语法</title>
</head>

<body>
  <!-- Vue为了简化DOM开发, 提供了大量的新语法, 需要背 -->
  <div id="app">
    <!-- DOM操作的难点之一: 如何选中要操作的元素 -->
    <!-- Vue提供了新的语法 {{}} 插值语法, 可以直观的把数据放在页面中 -->
    <div>亲爱的主人: {{name}}</div>
    <!-- {{}} : 相当于 模板字符串的 ${}, 把HTML当成是模板字符串来用就行 -->
    <!-- 可以在HTML中, 随意书写 JS 代码 -->
    <p>9*9 = {{9 * 9}}</p>
    <p>主人的资产: {{money}}</p>
  </div>

  <!-- 脚本分两种: 开发版vue.js 和 压缩版vue.min.js -->
  <!-- 开发版会提供更多的报错, 适合开发阶段使用 -->
  <script src="./vendor/vue.js"></script>
  <script>
    // Vue: 就是 vue.js 脚本中提供的构造函数
    // Vue会自动创建出一个对象, 来自动操作DOM元素 -- 钢铁侠的战甲
    // 固定的一些配置项, 需要设定

    // el : element元素, 值是 id选择器, 代表使用 Vue 管理的元素
    // 此时, 生成的 Vue对象, 就专为 id=app 的元素而服务
    const v = new Vue({
      el: '#app',
      // data: 数据,  给 el 关联的DOM元素使用的各种数据
      // data中的数据随便写

      // data属性中的元素, 会混入到 创建出来的vue对象里
      data: { money: 900000, name: "家乐" }

      // 我把 钱包(400块)交给了 家乐, 最终会混入到 家乐的口袋里
    })

    // 自动化: 数据变化时, 相关的DOM元素会 自动 更新
    // Vue框架核心竞争力: 数据驱动DOM的变化

    console.log(v)
  </script>
</body>

</html>
```

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>练习</title>
</head>

<body>
  <!-- vue代码只有在 vue管理的元素中使用, 才能生效 -->
  <div id="box">
    <div>姓名:{{name}}</div>
    <div>phone: {{phone}}</div>
  </div>


  <script src="./vendor/vue.js"></script>
  <script>
    // 1. 创建1个 Vue 对象, 来管理 id=box 的元素
    new Vue({
      el: '#box',
      data: { name: "楠姐", phone: '10086' }
    })
    // 2. 为元素提供一些数据, 例如 phone=10086, name=楠姐
    // 3. 把手机号 和 名字显示到 box 里 
  </script>
</body>

</html>
```

## 属性绑定

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>属性绑定</title>
</head>

<body>
  <!-- 
    1个标签由: 标签名 + 内容 + 属性 组成
   -->
  <a href="http://www.baidu.com" id="a1" class="danger" title="百度一下">Baidu</a>

  <div id="app">
    <!-- 标签内容, 用 {{}} 来书写JS代码 -->

    <!-- vue1语法: v-bind:属性名="JS代码" -->
    <!-- vue2语法: :属性名="JS代码" -->
    <a v-bind:href="h" :title="c" :id="a" :class="b">{{d}}</a>

    <!-- 属性名不带: 就是HTML的原生语法, 值是字符串 -->
    <button id="8+8">11</button>
    <!-- 属性名带: 是vue的语法, 其中的值作为JS代码运行 -->
    <button :id="8+8">22</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    new Vue({
      el: '#app', // 管理 id=app 的元素, el是固定的
      data: {
        a: 101,
        b: 'success',
        c: 'Tmooc',
        d: 'Welcome !',
        h: 'http://tmooc.cn'
      }
    })
  </script>
</body>

</html>
```

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>练习</title>
</head>

<body>
  <div id="box">
    <!-- :src="JS"  :代表属性的值是 JS代码 -->
    <img :src="a" alt="">
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    // 创建一个Vue对象, 管理 id=box 的元素
    // 添加数据项: a = http://www.codeboy.com:9999/img/index/banner1.png
    // 把图片地址 放到 img 里, 让图片显示出来
    new Vue({
      el: '#box',
      data: {
        a: 'http://www.codeboy.com:9999/img/index/banner1.png'
      }
    })
  </script>
</body>

</html>
```

## 事件

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>事件</title>
</head>

<body>
  <div id="app">
    <!-- Vue1 语法: v-on:事件名="方法名" -->
    <button v-on:click="a">点我</button>
    <!-- Vue2 语法: @事件名="方法名" -->
    <button @click="a">来呀!</button>
    <button @click="b">再碰下试试!</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    new Vue({
      el: '#app',
      // data: 专门存放数据的属性
      // methods: 专门存放方法的属性
      methods: {
        a: function () { alert('别碰我!') },
        // 语法糖: 可以省略 : function
        b() { alert('找揍啊你!') }
      }
    })
  </script>

</body>

</html>
```

## 事件的this

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>事件的this</title>
</head>

<body>
  <div id="app">
    <button @click="a">打我</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    const v = new Vue({
      el: '#app',
      // function的this是 运行时所在对象

      // methods中的元素, 最终会混入到 创建的Vue实例对象中
      // 所以 函数中的this 就是 Vue 实例对象
      methods: {
        // 错误答案: this是methods
        // 家乐买了个锤子,  那么 用锤子打人 就一定是家乐吗??  -- 不, 要看使用者
        a() {
          console.log('this:', this)
          console.log(this == v);
        }
      }
    })

    console.log(v);
  </script>
</body>

</html>
```

## 计数器

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>计数器</title>
</head>

<body>
  <div id="app">
    <button @click="add">{{num}}</button>

    <!-- 完全可以在 HTML中直接写JS 更方便 -->
    <button @click="num++">{{num}}</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    const v = new Vue({
      el: '#app',
      // data中的元素, 最终会存储在 实例对象里  v.num
      data: { num: 1 },
      // methods中的元素, 最终会存储在 实例对象里  v.add
      methods: {
        add() {
          // 解:
          // 因为: this == v
          // 所以: v.num == this.num
          this.num++
        }
      }
    })

    console.log(v)
  </script>
</body>

</html>
```

## 计数器升级

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>计数器练习</title>
</head>

<body>
  <div id="app">
    <!-- 当 num 是1, 则按钮不可用 disabled 属性 -->
    <!-- disabled: 不可用, 表单元素带有的属性 -->
    <!-- disabled=true 代表不可用状态生效, 即按钮不可用,  num是1  1==1 true -->
    <!-- disabled=false 代表 不不可用  就是可用 -->
    <button @click="num--" :disabled="num==1">-</button>
    <span>{{num}}</span>
    <!-- 当数量是10, num==10 为true, 不可用 -->
    <button @click="num++" :disabled="num==10">+</button>
    <p>单价: {{price}}</p>
    <!-- Vue的核心竞争力: 数据驱动DOM变化, 数据变化后, 凡是相关的DOM元素都自动变 -->
    <p>总价: {{price * num}}</p>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    new Vue({ el: '#app', data: { num: 5, price: 2000 } })
  </script>
</body>

</html>
```

## 事件参数

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>事件参数</title>
</head>

<body>
  <div id="app">
    <h2>选择你的英雄: {{hero}}</h2>
    <button @click="c">蔡文姬</button>
    <button @click="c">瑶</button>
    <button @click="c">猪八戒</button>
    <button @click="c">李白</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    // 凡是页面上变化的东西, 必然和 数据挂钩
    new Vue({
      el: "#app",
      data: { hero: '待定' },
      methods: {
        c(e) {
          // 事件参数: 凡是事件触发的方法, 都会自带事件参数
          // alert("选择英雄!")
          console.log(e)
          // 修改数据项 = 触发事件的元素上的内容, 页面自然会更新
          this.hero = e.target.innerHTML
        }
      }
    })
  </script>
</body>

</html>
```

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>练习</title>
</head>

<body>
  <div id="app">
    <h2>{{price}}</h2>
    <button data-price="4399" @click="choose">8G+256G</button>
    <button data-price="4899" @click="choose">12G+256G</button>
    <button data-price="4499" @click="choose">8G+512G</button>
    <button data-price="5299" @click="choose">12G+512G</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    // Vue的理念: 数据驱动 
    // 数据变化 驱动 页面的变化,  页面上变化的内容肯定绑定了数据
    new Vue({
      el: '#app',
      data: { price: 4399 },
      methods: {
        choose(e) {
          // 事件 e.target 是触发事件的DOM元素
          console.log(e)
          // dataset: 是存放自定义属性 data- 的
          this.price = e.target.dataset.price
        }
      }
    })
  </script>

</body>

</html>
```

## 自定义事件参数

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>自定义事件参数</title>
</head>

<body>
  <!-- 
    事件传参分两种方式
    - 1. 利用DOM 的 自定义属性实现,  @事件名="方法名" ,方法的默认第一参 就是事件

    - 2. 抛弃DOM,使用函数传参方式  @事件名="方法名(值, 值...)"
          -- 由于指定了实参后, 则默认的事件参数会消失, 必须用关键词 $event 来传递
   -->

  <div id="app">
    <h2>{{price}}</h2>
    <!-- 为不会自定义传参的用户, 提供了 函数传参语法 -->
    <!-- 自定义传参之后, 默认的事件传参会消失 -->
    <!-- 可以利用 $event 关键词, 来显式传递事件参数 -->
    <button @click="choose(4399, $event)">8G+256G</button>
    <button @click="choose(4899, $event)">12G+256G</button>
    <button @click="choose(4499, $event)">8G+512G</button>
    <button @click="choose(5299, $event)">12G+512G</button>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    new Vue({
      el: '#app',
      data: { price: 4399 },
      methods: {
        // Vue作者希望打造的效果: 让不会DOM的人也能书写
        // 自定义属性, 事件参数  都属于DOM知识点

        // 会DOM可以有更多做法, 不会DOM 也能实现 -- 灵活
        choose(p, e) {
          this.price = p
          console.log(e);
        }
      }
    })
  </script>

</body>

</html>
```

## 样式

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>样式</title>

  <style>
    .ok {
      padding: 10px;
      background-color: green;
      color: white;
    }

    .err {
      padding: 10px;
      background-color: red;
      color: white;
    }
  </style>
</head>

<body>
  <!-- 样式分两类:  style  和 class -->
  <div id="app">
    <!-- 需求: 点击文字, 让字体变大 -->
    <!-- 让属性变化, 代码是JS, 必须用 : 改造 -->

    <!-- :style="{属性名: 值}"   值是对象类型 -->
    <!-- CSS的属性名, 常见 - 间隔, 例如 border-color  font-size  padding-top
    在JS的对象类型里, 属性名不允许中划线   { a-b: 1 }
    解决方案: 1.改小驼峰 fontSize   2.用字符串 'font-size'

    -->
    <div style="color:red" :style="{fontSize: size+'px'}" @click="size++">Hello: {{size}}</div>

    <div style="color:red" :style="{'font-size': size+'px'}" @click="size++">Hello: {{size}}</div>

    <hr>
    <!-- 希望: size是偶数, 就让 ok生效,  奇数就让 err 生效 -->

    <!-- :class="{类名: 布尔值}"  如果值是true就生效, false则不生效 -->
    <div :class="{ok: size%2==0, err: size%2==1}">成龙</div>
  </div>

  <script src="./vendor/vue.js"></script>
  <script>
    // Vue特点: 数据驱动, 凡是页面上会变化的 一定会绑定数据
    new Vue({
      el: '#app',
      data: { size: 17 }
    })
  </script>
</body>

</html>
```

## 脚手架

> 脚手架是一类软件的总称:  用来生成完善的项目包, 类似`一键安装`
>
> 类似于:
>
> - 原始方式: 先安装电脑系统, 然后自己找软件个性化安装
> - 脚手架: 一键安装, 电脑系统 + 一套常见的软件

- 先安装脚手架软件

  - 前提: node版本在 `12 ~ 16 `   查看`node -v`

- npm需要中国镜像 -- `查看jQuery03 的文档`

- 执行全局安装命令: `npm i -g @vue/cli`

  - 安装完毕后, 通过 `vue --version` 或  `vue -V` 来查看版本号

利用脚手架来生成项目包

> 不是一定要自己生成, 可以使用别人生成的包, 例如 百度网盘上的 `vue-pro`

- 在你要生成项目的目录下, 执行命令: `vue create vue-pro`

  - 范式: `vue create 包名` , 即 `vue-pro` 是自定义的包名, 可以随便起

    

- 个性化选项

- 选择 vue2 版本

- 直接回车*3

  

- 如果安装了 Git 软件, 可能会有额外的提示, 不用管

- 如果生错了, 则到文件夹里 删除掉, 然后重新生

- 无法自己生成, 用百度网盘提供的包 或者 跟其他能生的同学要 都可以!

## 自带服务器

> 脚手架生成的项目包中, `自带服务器`

运行项目包中的服务器

- 在项目包目录下运行 cmd
- 命令: `npm run serve`

> 开启时 偶尔会卡住, 在命令行上按 回车 ,大概率能解决

端口号如果被占用, 会自动改成别的, 例如 8080  -> 8081  -> 8082...

## 项目包分析

`public`: 静态资源文件夹

- favicon.ico : 标签栏上的图标
- `index.html`: 固定名称的文件, 作为服务器默认的首页

`src`: 专门存放代码

- main.js

## key



> 关于key:
>
> - 有可能重复的 不可以
> - 有可能变化的 不可以, 例如 `序号`, 除非实在找不到唯一标识, 可以凑合用
> - 例如: `数据库查询出来的元素的 id ` 可以

### 选项/数据

data: 存放共享的数据 -- 全局使用 

props: 声明组件的形参 -- 组件接收外来传参

 computed: 计算属性 -- 使用时自动触发, 不需要() 

methods: 方法们 -- 需要手动触发; 常见在 事件相关

### 选项/资源

directives: 指令们

 自定义指令 v- 开头 filters: 过滤器们

 {{ 值 | 过滤器 }}

 components: 组件们 

把页面上的一部分, 抽离成独立的 .vue 文件, 实现复用

### 选项/生命周期钩子

beforeCreate: 创建之前 

created: 创建完毕

 beforeMount: 开始挂载到页面

 mounted: 挂载到页面 -- 显示出来

 beforeUpdate: 开始更新

 updated: 更新结束

 beforeDestroy: 开始销毁 

destroyed: 销毁结束

### 指令

v-text: innerText 

v-html: innerHTML

 v-show: css 的 display:none

 v-if: 移除/添加元素

​	 v-else; v-else-if;

 v-for: 遍历

​	 v-for="值 in/of 数组" 

​	v-for="(值,序号) in/of 数组"

​	 v-for="值 in 数字" 

​	v-on: 事件 @ 

​	v-bind: 属性 : 

​	v-model: 双向数据绑定, 用于获取表单元素的值

​	 v-slot: 插槽, 一个预留位, 使用时通过标签内容传入

​	 v-pre: 原样显示 {{}} 

​	v-once: 一次性渲染 

特殊属性 

​	key: 配合 v-for 使用的 唯一标识属性, 提升数组变更后的重新渲染效率 

​	ref: 把1个变量 和 DOM元素绑定在一起, 存储在 $refs 中

### 路由系统

Vue中提供的制作多页网站效果的技术

​	原生开发中, 通过切换html文件来实现多个页面的效果 -- 整个网页切换

现代化的开发方式, 流行局部切换

​	原生相当于-- 笔记本电脑 -- 集成化高, 更换CPU 就必须更换整个电脑

​	现代化的方式 -- 台式机 -- 模块化, 更换CPU 就只需要换CPU即可

​		用最小的消耗 来实现内容的变换

​	专业称呼: SPA -- S ingle P age A pplication 单页应用

​		整个网站只有一个页面, 然后通过局部的切换来实现 多页 效果

### **路由总结**

​	**作用: 局部切换组件, 让我们的网页产生一种 多页的效果, 此技术称为 SPA - 单页应用**

router-view : 一个占位符, 会根据路径 切换到 对应的组件

 views : 路由切换的组件, 存放在这里

 router/index.js : 路由配置

​	 配置 什么路径 对应 什么组件 

​	注意组件的加载方式

​		 import: 适合使用频率高的组件

​		 箭头: 适合使用频率低的组件

 router-link : 类似超链接 a 标签, 用来实现点击切换

​	 自带两个激活样式

​	 router-link-active: 模糊 

​	router-link-exact-active :精确

 $router : 路由对象, 存储在 vue 实例中, 可以操作路由 

路由传参:

 	旧: 通过 ? 来传递 to="/路径?参数=值&参数=值..."

 		组件中如何读取参数的值?? $route.query

​	 新: 简化书写 

​		路径配置中, 需要用 : 来标识参数 path: '/路径/:参数/:参数'

 		使用时 to="/路径/值/值" 

​		组件中如何读取参数的值? 

​			方式1: params $route.params

​	 		方式2: 利用 props 

​			注意: 必须在配置文件中开启此功能 props:true

### 配置文件

```vue
import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
// 目前: 假设网站中有 100 个页面
// 做法1: 网站刚加载, 就把100个页面全加载完毕, 然后等着使用
// - 优点: 用户进入不同页面, 瞬间切换
// - 缺点: 首次进入网站, 要进行大量操作, 首次慢; 用户如果没浏览其他页面, 亏了
// 做法2: 网站刚加载, 就加载用户使用的, 其他页面等到用户使用时再加载
// - 优点: 首次加载速度快
// - 缺点: 每个新的页面浏览时, 都要临时加载
// 最佳方案: 先加载最常用的几个页面, 把不常用的用懒加载方式进行
// 非懒加载: 网站加载时, 默认自动加载 -- 适合最常用的几个页面
import JiaLe from '../views/JiaLe.vue'
import FeiFan from '../views/FeiFan.vue';
// 假设 yufei 和 yumeng 使用频率低 -- 改造成懒加载
// import YuFei from '../views/YuFei.vue';
// import YuMeng from '../views/YuMeng.vue';
// 总结: 根据页面的使用频率
// -- 频率高: 用 import
// -- 频率低: 懒加载 箭头函数方式
Vue.use(VueRouter)
// 配置文件: 配置 路径 和 组件的对应关系
const routes = [
// vroute-named
{
// 路径声明时, 可以用 : 来指定参数
path: '/dy/:type/:id',
name: 'dy',
// 小马的狂化状态: true
props: true, // props功能: 开启, 默认是 false, 不开启
component: () => import('../views/DY.vue'),
},
{
path: '/douyu',
name: 'douyu',
component: () => import('../views/DouYu.vue'),
},
{
// 路径必须带 / 开头
// 区分大小写吗?? 代码非常严谨, 永远区分大小写
path: '/yumeng',
// 懒加载语法: 用箭头函数, 在被调用时才会临时引入
component: () => import("../views/YuMeng.vue")
},
{
meta: { title: "雨飞" },
path: '/yufei',
component: () => import("../views/YuFei.vue")
},
{
path: '/feifan',
component: FeiFan,
meta: { title: "非凡" },
},
{
// path: 路径,
path: "/jiale",
// component: 组件
component: JiaLe,
// name属性: 为这个路由配置项起个名字, 后期调试时 找BUG用, 加不加都行
name: '家乐',
// meta: 固定的属性, 称为 元数据: 可以存放各种自定义的内容
meta: {
x: '12121',
y: 433,
suibian: true,
title: "家乐"
}
},
{
path: '/',
name: 'home',
component: HomeView,
meta: { title: "首页" }
},
{
meta: { title: "关于" },
path: '/about',
name: 'about',
// route level code-splitting
// this generates a separate chunk (about.[hash].js) for this route
// which is lazy-loaded when the route is visited.
component: () => import(/* webpackChunkName: "about" */
'../views/AboutView.vue')
}
]
const router = new VueRouter({
路由入门
mode: 'history',
base: process.env.BASE_URL,
routes
})
// 必须在 router 赋值后, 书写代码
// 路由守卫: 看大门的 -- 监听路由的各种跳转操作
// beforeEach: 路由前置守卫, 在路由跳转前触发
router.beforeEach((to, from, next) => {
console.log('to:', to); // 到哪去
console.log('from:', from); //从哪来
// DOM中, 如何修改 标签的标题??
document.title = to.meta.title
//next: 放行, 允许路由继续运行
next()
})
export default router

```

### 路由入门

```
<template>
<div>
<!-- 路由系统: 属于组件的高级应用方式 -->
<!-- 希望: 能够根据路径 切换 页面上显示的组件 -->
<!-- views文件夹: 专门存放 路由系统切换的组件 -->
<!-- router-link: vue对 a 标签进行了封装, 进而得到了更加强大的 router-link-->
<!-- 虽然最终呈现在页面上的是 a 标签, 但是其在切换路径时, 不会导致重新加载 -->
<router-link to="/">首页</router-link>
<router-link to="/about">关于</router-link>
<router-link to="/jiale">家乐</router-link>
<!-- 把 yumeng yufei 也做成链接跳转 -->
<router-link to="/yumeng">雨萌</router-link>
<router-link to="/yufei">雨飞</router-link>
<!-- 不要直接用a标签, 会导致页面重新加载 -->
<a href="/feifan" target="_blank">非凡</a>
<div id="box">
<!-- router:路由 -- 通过路径 可以找到什么 -->
<!-- router-view: 路由的占位符, 会根据具体的路径 替换成 对应的组件 -->
<!-- 例如 localhost:8080/ 会显示 HomeView 组件 -->
<!-- localhost:8080/about 会显示 AboutView 组件 -->
<router-view />
</div>
</div>
</template>
<script>
export default {};
</script>
编程式跳转
<style lang="scss" scoped>
#box {
background-color: orange;
padding: 10px;
}
// router-link 最终表现出来的是 a 标签
// 所以直接给 a 标签添加样式即可
a {
margin: 10px;
display: inline-block;
padding: 10px 20px;
// 文本-修饰 即 上中下 3个线
text-decoration: none;
color: white;
background-color: #666;
opacity: 0.8;
transition: 0.3s;
&:hover {
opacity: 1;
border-radius: 4px;
}
}
// router-link: 会自动为当前激活项添加class
// router-link-active: 模糊匹配
// 例如 路径是 /a/b/c , 与之模糊匹配的路径有4种 / /a /a/b /a/b/c
// 即: 1个路径的 父级路径 都会匹配成激活状态 -- 一人得道鸡犬升天/株连九族
a.router-link-active {
background-color: orange;
}
// 因为模糊匹配, 所有 /about 会导致 / 和 /about 都带上橘黄色背景
// router-link-exact-active
// exact: 精确的
a.router-link-exact-active {
// background-color: orange;
}
// 因为精确匹配, 所以只有 /about 带有背景色
</style>

```

### 编程式跳转

```
<template>
<div>
<!-- 标签式跳转 -->
<router-link to="/">Home</router-link>
<router-link to="/about">About</router-link>
<!-- 编程式跳转 -->
<button @click="goMeng">3秒后,切换到雨萌</button>
<!-- 占位符: 被替换成对应组件 -->
<router-view />
</div>
</template>
当当前前路路由由信信息息
<script>
export default {
methods: {
goMeng() {
var num = 3;
console.log(this); // 在后台找到 router
// 在 vue 对象中, 有很多 $ 开头的属性
// Vue自带的属性, 都是 $ 开头, 一个标识, 用户看到就知道是系统的
// $router: 就是 路由对象, 其中包含了路由相关的各种操作
const a = setInterval(() => {
num--;
console.log("num:", num);
// push: 推入一个新的页面
if (num == 0) {
this.$router.push("/yumeng");
clearInterval(a);
}
}, 1000);
},
},
};
</script>
<style lang="scss" scoped>
</style>
```

### 当前路由信息

```
<template>
<div>
<!-- 需求: 在输入框中按回车, 切换到 /about 路径 -->
<!-- 实际开发时, 往往会跳转到 搜索页面 -->
<input type="text" placeholder="搜索..." @keyup.enter="goAbout" />
<router-view />
</div>
</template>
<script>
export default {
methods: {
goAbout() {
// 编程式跳转: 如果重复跳转, 会报错 -- 避免重复导航到 当前路径
// 解决方案: 在跳转之前, 添加判断, 当前路径 和 目标路径(要往哪里跳) 不相同再跳转
// 当前路径信息的读取方式
// $router.currentRoute
// 由于 当前路径 信息经常被读取使用, 所以作者好心的提供了 $route 的属性, 用于快速读
取路径配置信息
console.log(this.$route);
// 注意区分:
// $router : 路由对象, 包含路由的所有信息 和 操作
路由传参
// $route : 当前路由信息, 属于 $router 的一部分
console.log(this);
// 如果当前路径的 path 和 要跳转的地址不同, 再跳转
if (this.$route.path != "/about") {
this.$router.push("/about");
}
},
},
};
</script>
<style lang="scss" scoped>
</style>

```

### 路由传参

```
<template>
<div>
<!-- 路由参数 -->
<div>
<router-link to="/">首页</router-link>
<!-- 路由传参借鉴了 GET传参的语法, 利用? 来间隔 路径?参数=值 -->
<router-link to="/douyu?type=yz">颜值</router-link>
<router-link to="/douyu?type=LOL">英雄联盟</router-link>
<router-link to="/douyu?type=wzry">王者荣耀</router-link>
</div>
<router-view />
</div>
</template>
<script>
export default {};
</script>
<style lang="scss" scoped>
a {
margin: 10px;
display: inline-block;
text-decoration: none;
color: black;
&.router-link-exact-active {
color: orange;
}
}
</style>
<template>
<div>
<h2>斗鱼: type - {{ $route.query.type }}</h2>
<template v-if="data">
<!-- 从返回值中找 数组 进行遍历 -->
<div
class="cell"
v-for="{ rid, roomName, roomSrc } in data.data.list"
:key="rid"
>
<img :src="roomSrc" alt="" />
<span>{{ roomName }}</span>
</div>
</template>
</div>
</template>
<script>
// 安装axios模块: npm i axios vue-axios
// https://douyu.xin88.top/api/room/list?type=??
// 使用时, 需要读取路由参数 type, 然后拼接到路径里, 才能请求到对应数据
// 1. methods -> getData -> 拼接出url -> axios 请求
// 2. data 中, 声明 data 属性, 存储数据
// 3. mounted中, 调用 getData
// 4. 遍历展示数据到页面, 有房间名和图片就行
import axios from "axios";
export default {
data() {
return {
data: null,
};
},
// mounted: 挂载, 组件显示在页面上时触发
// 组件存活期间, 只会触发一次 -- 生出来时
mounted() {
// $route: 当前路由的相关配置信息
console.log(this.$route);
// 路由的参数存放在 query 属性里
this.getData();
},
// 监听器: watch
watch: {
// 监听 路由的参数 type
// 因为变量名不能有 点, 只能用字符串书写
"$route.query.type"(to, from) {
// 自带两个参数: 新值, 旧值
console.log("新值to:", to);
console.log("旧值from:", from);
// 当变化时, 再次触发 getData 获取最新的数据
this.getData();
},
},
methods: {
// getData: 必须触发才能执行
getData() {
// 接口的参数: 是服务器指定的, type属于固定参数
const type = this.$route.query.type;
const url = "https://douyu.xin88.top/api/room/list?type=" + type;
console.log("url:", url);
axios.get(url).then((res) => {
console.log(res);
this.data = res.data; // 本地数据 = 远程的
路由传参
});
},
},
};
</script>
<style lang="scss" scoped>
.cell {
width: 250px;
display: inline-flex;
margin: 10px;
flex-direction: column;
img {
width: 100%;
}
}
</style>
```

### 路由传参

```
<template>
<div>
<router-link to="/">Home</router-link>
<!-- ? 传参语法 结构复杂, 实际开发中有更好的方案 -->
<router-link to="/dy/DNF/33">DNF</router-link>
<!-- <router-link to="/dy?type=ecy&id=11">二次元</router-link> -->
<router-link to="/dy/ecy/11">二次元</router-link>
<router-link to="/dy/hpjy/22">和平精英</router-link>
<!-- 路由配置 path:"/dy/:type/:id" -->
<!-- 占位符 -->
<router-view />
</div>
</template>
<script>
export default {};
</script>
<style lang="scss" scoped>
a {
margin: 10px;
text-decoration: none;
&.router-link-exact-active {
color: orange;
}
}
</style>
<template>
<div>
<h2>DY 欢迎您</h2>
<p>type: {{ $route.params.type }}</p>
<p>type: {{ type }}</p>
</div>
mmeettaa 和和 路路由由守守卫卫
</template>
<script>
export default {
// 作者贴心的帮你 简化了 路由参数的读取方式 : 仅限于新式传参
// props: 可以用来声明参数接收路由传参
// 这个用 props 接收路由传参的功能, 必须手动开启 -- 配置文件 router/index.js
props: ["type"],
// watch: 监听器, 可以监听 vue的任意属性的变化
watch: {
// 通过 ? 传参 : 存储在query里
// 通过新式传参 : 存储在params里
$route(to, from) {
console.log("to:", to);
this.getData();
},
},
mounted() {
this.getData();
},
methods: {
// 触发场景分两种:
// 1. 页面首次展示
// 2. 路由参数变化时
getData() {
// const type = this.$route.params.type;
// 当使用 props 来接收参数, 只需要 this.type 就可以使用
const url = "https://douyu.xin88.top/api/room/list?type=" + this.type;
console.log("url:", url);
},
},
};
</script>
<style lang="scss" scoped>
</style>

```

### meta 和 路由守卫

```
<template>
<div>
<router-link to="/">Home</router-link>
<router-link to="/about">About</router-link>
<router-link to="/jiale">家乐</router-link>
<router-link to="/feifan">非凡</router-link>
<router-link to="/yufei">雨飞</router-link>
<router-view />
</div>
</template>
<script>
export default {};
</script>
```

### 外部文件使用

```
<template>
<div>
<img src="./assets/logo.png" alt="" />
<one-com />
<two-com />
<div class="danger">DANGER</div>
<div>
<p>家乐</p>
<p>小马</p>
</div>
</div>
</template>
<script>
import OneCom from "./components/OneCom.vue";
import TwoCom from "./components/TwoCom.vue";
// 外部文件的使用
// JS CSS 图片
// 图片: 本地图片应该存储在 assets 目录下
// css: 存储在 assets 目录下
// JS: 放哪里都可以, 在 src 目录下即可
import my from "./suibian/my"; // .js 后缀名可以省略
export default {
components: { OneCom, TwoCom },
mounted() {
my.show();
},
};
</script>
<style lang="scss" scoped>
</style>
```

### Vuex

​	Vuex: 全局状态共享
​	https://vuex.vuejs.org/zh/

​	打比方:
​	以前: 小马单身 -- 钱都放在自己身上, 只能自己用
​	现在: 小马有媳妇,有儿子 -- 钱就要存储到 家庭资金卡里, 给媳妇儿子 自己 一起用

多个页面 或 组件中共享的数据 存储在 共享的对象中: Vuex

​	store: 存储共享的数据

​	使用时: $store.state.数据

修改分两种方式:

​	简单粗暴(不推荐,不安全): 直接修改 $store.state

规矩(安全):

必须在 mutations 中声明方法, 来进行允许的修改操作
通过 commit 方法提出申请, 触发对应的修改操作
作者为了方便大家使用, 提供了简化的操作方式 -- 辅助函数

Vuex:
简单: 应用方式极其容易, 因为 有 辅助函数 大杀器的存在
难:

团队合作时:你要照顾猪队友 -- 不会辅助函数 则原生的写法就偏难

​	$store.state.xxx
​	或者 自己写 映射
辅助函数的原理: 不需要掌握, 但是最好知道

### vuex初步

```
<template>
<div>
<!-- Vuex: 全局状态管理 -- 组件间的数据共享 -->
<!-- store文件夹: 仓库, 放共享数据 -->
<three-com />
<four-com />
<hr />
<button @click="addNum">num+1</button>
<p>num: {{ $store.state.num }}</p>
<p>uname: {{ $store.state.uname }}</p>
<p>isLogin: {{ $store.state.isLogin }}</p>
</div>
</template>
<script>
import FourCom from "./components/FourCom.vue";
import ThreeCom from "./components/ThreeCom.vue";
export default {
components: { ThreeCom, FourCom },
methods: {
addNum() {
// commit:提交
// 向 $store 提交申请, 触发 名字是 numAdd1 的方法
this.$store.commit("numAdd1");
// 共享数据的修改, 必须保障安全 -- 必须提供专业渠道来修改
},
},
mounted() {
console.log(this); //查看其中有没有 store 这个仓库
// this.$store.state
},
};
</script>
<style lang="scss" scoped>
</style>



import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
// 场景模拟:
// 小马把自己的工资上缴 家库, 全家人都能用
// 小马想给 女主播 刷礼物 -- 500元
// 做法1: 小马直接从 家库 中拿钱
// 如果启动严格模式: 则做法1 依然可以,但是会报错
//
// 做法2: 规矩 -- 要想修改共享的数据, 必须通过 指定的方法
export default new Vuex.Store({
// 严格模式:
strict: true,
// state: 状态 -- 共享数据都存储在这里
state: {
num: 1,
isLogin: true, //当前是否登录
uname: '小马哥'
},
// 计算属性:
getters: {
// 通过已有的属性, 计算返回新的值
status(state) {
// 参数1: 固定的 state, 代表共享的数据项
return state.isLogin ? '登录' : '未登录'
}
},
// 变化: 在这个属性中, 书写用于修改 共享数据的方法
mutations: {
// 登录分 true 和 false 两种值, 则需要传参
updateLogin(state, x) {
state.isLogin = x
},
numAdd1(state) {
// 参数1: 固定传入的,共享数据所在的对象
state.num++
}
},
actions: {
},
modules: {

```

### 辅助函数原理

```
<template>
<div>
<!-- 传统写法 -->
<div>num: {{ $store.state.num }}</div>
<div>uname: {{ $store.state.uname }}</div>
<div>isLogin: {{ $store.state.isLogin }}</div>
<hr />
<!-- 利用计算属性简化 -->
<div>num: {{ num }}</div>
<div>uname: {{ uname }}</div>
<div>isLogin: {{ isLogin }}</div>
</div>
</template>
<script>
// 把传入的数组, 转换成 对象类型
function mapState(arr) {
var obj = {};
// name是数组中每个元素的值
for (let name of arr) {
// 假设 name 是 num
// 则下方代码: obj.num = function (){ return this.$store.state.num }
// 因为name是变量, 所以必须用中括号语法才能赋值
obj[name] = function () {
return this.$store.state[name];
};
}
return obj;
}
console.log(mapState(["num", "uname", "isLogin"]));
export default {
// 利用计算属性简化
computed: {
// 展开符 ... 破掉对象类型 {}
// mapState: 自动帮你生成所有的函数
...mapState(["num", "uname", "isLogin"]),
// 方法在使用时, 自动触发 不需要()
// num: function () {
// return this.$store.state.num;
// },
// uname: function () {
// return this.$store.state.uname;
// },
// isLogin: function () {
// return this.$store.state.isLogin;
// },
},
};
</script>
<style lang="scss" scoped>
</style>
```

### 辅助函数

<template>
<div>
<!-- 传统写法 -->
<div>num: {{ $store.state.num }}</div>
<div>uname: {{ $store.state.uname }}</div>
<div>isLogin: {{ $store.state.isLogin }}</div>
<hr />
<!-- 利用计算属性简化 -->
<div>num: {{ num }}</div>
<div>uname: {{ uname }}</div>
<div>isLogin: {{ isLogin }}</div>
</div>
</template>
<script>
// vuex: 提供了辅助函数 mapState, 帮你自动生成计算属性, 简化state的使用
import { mapState } from "vuex";
// 辅助函数的原理, 参考 App.4 : 感兴趣了解下
// 不感兴趣: 直接背语法即可 : 在 computed 中, 书写 ...mapState([名称, 名称])
export default {
// 利用计算属性简化
computed: {
// 展开符 ... 破掉对象类型 {}
// mapState: 自动帮你生成所有的函数
...mapState(["num", "uname", "isLogin"]),
// 方法在使用时, 自动触发 不需要()
// num: function () {
// return this.$store.state.num;
// },
// uname: function () {
// return this.$store.state.uname;
// },
// isLogin: function () {
// return this.$store.state.isLogin;
// },
},
};
</script>
<style lang="scss" scoped>
</style>

<script>
// 在使用vuex 的内容时, 分3种写法
// 1. 直接用 $store.state.xx $store.commit(...)
// 2. 手动通过 计算属性 或 methods 来映射
// 3. 使用辅助函数 mapXxxx 来实现映射
// 辅助函数有些人不会
// 团队合作时很麻烦, 不一定你的队友会哪种, 所以你 都要会才能兼容别人!
import { mapMutations } from "vuex";
export default {
methods: {
// 作者提供了辅助函数, 帮你自动实现映射代码
// 在数组中书写 要映射的mutations 中的方法名即可
...mapMutations(["numAdd1", "updateLogin"]),
// numAdd1() {
// this.$store.commit("numAdd1");
// },
// updateLogin(x) {
// this.$store.commit("updateLogin", x);
// },
},
mounted() {
console.log(this); // 找到 getters.status
},
};
</script>
<style lang="scss" scoped>
</style>

### vuex总结

<template>
<div>
<div>count:{{ count }}</div>
<div>num: {{ num }}</div>
<div>age: {{ age }}</div>
<button @click="countJian10">更新count</button>
<button @click="numJia1">更新num</button>
<button @click="ageJiaN(10)">更新age</button>
<hr />
<p>{{ age_db }}</p>
<p>{{ num_db }}</p>
<p>{{ count_db }}</p>
<!-- double 双倍 db -->
</div>
</template>
<script>
import { mapGetters, mapMutations, mapState } from "vuex";
export default {
computed: {
// 辅助函数, 把 state 中的值映射到组件中使用                                             ...mapState(["count", "num", "age"]),
// 自动触发的, 放计算属性
...mapGetters(["age_db", "num_db", "count_db"]),
},
// mutations: 属于主动触发的方法, 应该放在 methods里
methods: {
// 辅助函数: 把 mutations中的方法映射到组件里用
...mapMutations(["numJia1", "countJian10", "ageJiaN"]),
},
};
</script>
<style lang="g="scss" scoped>
</style>

​                   

```
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
export default new Vuex.Store({
// 共享的数据存储在state里
state: {
count: 100,
num: 1,
age: 30
},
// 用于存储修改 state 中的值的方法
mutations: {
numJia1(state) {
state.num += 1
},
countJian10(state) {
state.count -= 10
},
ageJiaN(state, n) {
state.age += n
}
},
// 计算属性: 把 state 中的值 ,计算后返回一个新的值
getters: {
age_db(state) {
return state.age * 2
},
num_db(state) {
return state.num * 2
},
count_db(state) {
return state.count * 2
}
}
})
```

### Swiper 

​	官网: https://www.swiper.com.cn/

```
npm install swiper@5.* vue-awesome-swiper@4.*
```

API文档:

 https://www.swiper.com.cn/api/index.html 

案例库:

 https://github.surmon.me/vue-awesome-swiper

### 鼠标悬停暂停

原理: 鼠标进入时 调用停止方法, 鼠标离开时调用 开始方法
绑定两个方法给 swiper 组件
swiper是自定义组件, 默认无法绑定原生的事件方法
但是: 可以通过事件修饰符.native 来强制绑定原生事件
利用 ref 把变量 和 swiper 组件绑定在一起
通过 变量, 找到 swiper中的 autoplay 中的 相关方法进行调用

### 组件的复用

当页面上有多个部分: 结构相同 , 样式相同, 但是 值不同
组件的复用: 重复使用组件, 通过传参的方式 传递不同的数据

### 搜索栏路由传参流程 

路径: 相当于一个运输车, 例如 从 河北 运输大白菜到 北京 

河北.vue 



props: 用来接收外部传入的 

data: 组件自身拥有的属性

### Vue3 

目前的主流开发版本: vue2 

目前正处于新旧交接的阶段: vue3 逐渐在流行 

​	每个月都会新增新的特性 -- 学习成本较高

 与vue2相比, 采用TS 代替了 JS

### TypeScript

​	是 微软公司 在JS基础上, 混合了大量的 JAVA 语言特征制作而成 : 混血生物

​		 官网: https://www.tslang.cn/

全局安装 typescript 编译器：

```
npm install -g typescript

安装后, 利用 tsc -v 可以查看版本
```

### Vue3项目包

​	可以到FTP下载获取 

​	可以到百度网盘下载获取 

​	也可以自己生 

生成命令: vue create vue3-pro

​	 注意检查你要生成项目包的目录下, 是否有重名的文件夹, 可以通过改名规避

安装axios模块: **npm i axios** 

​	vue3 不支持优雅方式, **只能单独引入**

### setup

<template>
<!-- 快捷: v3ts -->
<!-- vue3 和 vue2 的 html 代码部分几乎无差异 -->
<!-- vue3 不再要求只有一个子元素 -->
<div>
<p>num:{{ num }}</p>
<p>count:{{ count }}</p>
<p>uname:{{ uname }}</p>
<button @click="show">点我</button>
</div>
<!-- <div>二儿子</div>
<div>三儿子</div> -->
</template>
<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
// setup: 就是 created 周期, 组件创建完毕时
// vue3: 就是把 vue2 的data 改名成 setup
setup() {
console.log("setup: 组件创建完毕");
// vue2: 要显示在页面上的数据, 必须存储在 data 属性里
// vue3: 通过 setup的 return 返回到页面上展示
return {
num: 10,
count: 20,
uname: "小马",
show() {
alert("我会vue3!");
},
};
},
// vue2: methods computed watch
// 方法 计算属性 监听器
// 作者的想法: 不同功能的代码 存放在不同的对象里
// 小马吐槽: 记不住
// vue3: 全都放在 setup 里返回
// setup: 就是 data methods computed watch 的集合体
// data(){
// return {
// num: 10
// }
// }
});
</script>
<style scoped>
</style>

### 变量

变量不再自动更新DOM, 必须手动设定为更新DOM
单个变量: ref()
	JS中操作 ref的变量值, 必须用 value
	在HTML中不需要, 作者对语法上做了简化
对象类型: reactive()
	操作属性不需要 value, 因为是 Proxy代理模式实现的
对象类型解构成单个变量: toRefs()

<template>
<!-- v3ts -->
<div>
<div>num:{{ num }}</div>
<button @click="addNum">num+1</button>
</div>
</template>
<script lang="ts">
import { defineComponent, ref } from "vue";
export default defineComponent({
setup() {
// 网络喷子-小马哥: 老由, 每个data中的变量在变化时都会更新DOM元素
// 每个变量在底层都做了相关的处理--监听器, 浪费性能!
// 鱿鱼须: vue3 就改成手动添加监听器模式, 为想更新DOM的值手动加监听器
// 小马: vue2中, 所有的东西都加载在全局的vue对象里, 导致对象臃肿
// 鱿鱼须: vue3是按需引入, 不再有全局对象, vue3没有 this 关键词
// -- 追求极致的性能 (废人)
var num = ref(20);
// 钢铁侠战甲(小马) : 把小马放到战甲中, 拥有了强大功能
// ref(): 把 20 包装成 Ref 对象, 拥有了监听器等技能, 能自动更新DOM
console.log("num:", num);
var addNum = () => {
// 必须修改 value属性, 才能触发更新操作
num.value++;
console.log(num);
};
return { num, addNum };
},
});
</script>
<style scoped>
</style>

<template>
<!-- v3ts -->
<div>
<button @click="data.num++">num: {{ data.num }}</button>
<button @click="data.count++">count: {{ data.count }}</button>
<button @click="data.age++">age: {{ data.age }}</button>
<hr />
<!-- 在 html中, 不需要用 .value 来修改值, 作者做了处理 --><button @click="x++">x: {{ x }}</button>
<!-- 更简单: -->
<button @click="num++">num: {{ num }}</button>
</div>
</template>
<script lang="ts">
import { defineComponent, reactive, ref, toRefs } from "vue";
export default defineComponent({
setup() {
// 喷子马: 单独修改一个个属性, 真麻烦
// 鱿鱼须: 允许把属性放在对象中, 一起修改
var data = reactive({ num: 1, count: 10, age: 30 });
// 喷子马: 对象类型的值在使用时, 必须是 对象.属性名 来用, 太烦了!!
// 我还是喜欢 ref 的直接使用方式
// 鱿鱼须: 提供一个 toRefs, 帮你把对象展开, 类似解构
console.log(toRefs(data));
var x = ref(1000);
// reactive: 利用了 ES6 的 Proxy 代理特性, 来为对象类型添加监听
// Proxy是啥: 面试时可能会问 -- 面试前看老师的扩展视频
// ... :展开符, 把data中转化出来的内容展开, 放到 return 里
return { data, x, ...toRefs(data) };
},
});
</script>
<style scoped>
</style>
### 计算属性和监听器

<template>
<div>
<button @click="num++">{{ num }}</button>
<p>num翻倍: {{ num_2 }}</p>
</div>
</template>
<script lang="ts">
import { computed, defineComponent, ref, watch } from "vue";
export default defineComponent({
setup() {
var num = ref(10);
// watch(要监听的变量, (新值, 旧值)=>{})
watch(num, (to, from) => {
console.log("to:", to);
console.log("from:", from);
});
return {
num,
// 计算属性: 值通过函数计算得到num_2: computed(() => num.value * 2),
};
},
});
</script>
<style scoped>
</style>

### 生命周期+axios

<template>
<div v-if="data">
<div v-for="{ title, nid } in data.data" :key="nid">
{{ title }}
</div>
</div>
</template>
<script lang="ts">
import { defineComponent, onMounted, ref } from "vue";
// axios: 因为vue3取消了全局的vue对象 -- 过于臃肿, 没有this
// 导致axios 没有全局引入, 只能单独引入
// 前提要安装: npm i axios
import axios from "axios";
// axios是对象, 改一次就行, 其他组件使用时, 都是同一个对象
axios.defaults.baseURL = "http://www.codeboy.com:9999/mfresh/data/";
export default defineComponent({
setup() {
const data = ref(null);
// 生命周期: 输入v3 看提示
onMounted(() => {
console.log("onMounted: 挂载完毕");
const url = "news_select.php";
axios.get(url).then((res) => {
console.log(res);
data.value = res.data;
});
});
return { data };
},
});
</script>
<style scoped>
</style>

### vuex和路由

<template>
<div></div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useStore } from "vuex";
export default defineComponent({
setup() {
// 目前vue3 不支持 map 辅助函数
// vue2: this.$store
// vue3: 必须用 useStore() 来获取 $store
const $store = useStore();
console.log($store);
// $route
const $route = useRoute();
// $router
const $router = useRouter();
console.log($route);
console.log($router);
return {};
},
});
</script>
<style scoped>
</style>