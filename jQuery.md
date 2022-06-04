# jQuery

> 在`曾经`的年代,  jQuery`一家独大`, 前端必学的框架
>
> 作用: 利用封装技巧, 把 DOM 操作进行了封装, 提供了一个简单易用的框架
>
> 官方理念: `Write less, do More`  写的少 做的多
>
> 实际开发中, 很少书写 原生的DOM 代码, 因为`太长`!

## jQuery原理

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>选修-jQuery仿写</title>
</head>

<body>
  <div>Hello</div>
  <div>World</div>

  <script>
    // 原生DOM: 修改两个div的颜色 -- red
    const items = document.querySelectorAll('div')
    items.forEach(item => item.style.color = 'red')

    // 封装: 只要一次, 以后就可以随时复用
    function $(selector) {
      return document.querySelectorAll(selector)
    }

    // 向原型 NodeList 中,添加一个css方法
    NodeList.prototype.css = function (name, value) {
      // name: 是变量, 要用 [] 语法来赋值
      // items.forEach(item => item.style.color = 'red')
      this.forEach(item => item.style[name] = value)
    }

    // 访问器的方括号语法
    // var a = 'gege'
    // var obj = {}
    // obj[a] = '格格' // gege   []中的变量会换成其值
    // obj.a = '家乐' // a  点语法 写什么是什么

    const a = $('div') //结果同 items
    console.log(a);

    // 经过封装后: 希望如下写法
    $('div').css('color', 'blue')
    $('div').css('border', '2px solid gray')
  </script>
</body>

</html>
```



## 选择器

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>选择器</title>
</head>

<body>
  <div id="box">
    <button>111</button>
    <p>Hello</p>
    <p>World</p>
  </div>

  <!-- 使用第三方时, 需要先引入 -->
  <!-- 脚本通常分两个版本: 开发版 和 产品版 -->
  <!-- 开发版: 带注释,缩进 , 给人看 但是体积大 -->
  <!-- 产品版: 删除了注释和缩进, 作为产品, 体积小 -->
  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 原生DOM: 区分1个还是多个, 采用不同方法
    // 作者: 不需要用户区分个数, 统一查询出类数组 类型的对象
    // $: 函数名,  值是css选择器
    console.log($('button'))
    console.log($('p'))
    // 作者为查询出来的类数组的原型中: 添加了大量的方法可以使用
    // 比如 css ,可以自动遍历添加 样式
    $('p').css('color', 'red')
  </script>
</body>

</html>
```

## css

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>css</title>
</head>

<body>
  <div>Hello</div>
  <div>World</div>
  <div>Vue</div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 本质: $ 就是 document.querySelectorAll('div')
    $('div').css('color', 'blue')

    // jQuery作者 大量采用了 函数重载 技巧
    // 函数重载: 通过判断 参数的个数 或 类型不同, 执行不同的逻辑代码

    // css只有1个参数 且 是字符串: 则返回此样式的值
    console.log($('div').css('color'))

    // css只有1个参数 且 是对象: 则
    $('div').css({
      border: '1px solid black',
      backgroundColor: 'green',
      padding: '10px',
      margin: '5px'
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
  <button>11</button>
  <button>22</button>
  <button>33</button>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 事件要做为参数, 传递给 click 方法
    // 底层: 自动遍历选中的元素, 挨个 = 传入的方法
    $('button').click(function () {
      console.log(this)
    })
  </script>
</body>

</html>
```

## class

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>class</title>
  <style>
    #box {
      user-select: none;
    }

    #box>span {
      display: inline-block;
      background-color: #aaa;
      width: 80px;
      text-align: center;
      border-radius: 4px;
      line-height: 30px;
      margin: 0 10px 10px 0;
    }

    #box>span.active {
      background-color: orange;
      color: white;
    }
  </style>
</head>

<body>
  <div id="box">
    <span class="active">vue</span>
    <span>dom</span>
    <span>js</span>
    <span>express</span>
    <span>mysql</span>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // $():选择元素   JQ的方法们 自带遍历
    $('#box span').click(function () {
      // this: 运行时所在的对象
      // this.classList.add('active')
      console.log('this:', this);
      // this是DOM元素, 但是: 要想对DOM元素采用jQuery的语法
      // 必须把 DOM 转变成 jQuery 类型的对象
      // $(this): 把 this 即当前DOM元素, 装载到 jQuery 对象里
      console.log($(this))

      // siblings: 兄弟姐妹
      // 当前元素.添加(active).兄弟姐妹们.移除(active)
      $(this).addClass('active').siblings().removeClass('active')
    })
  </script>
</body>

</html>
```

## 显示与隐藏

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>显示与隐藏</title>

  <style>
    #box {
      width: 300px;
      height: 300px;
      margin-top: 10px;
      background-color: royalblue;
    }
  </style>
</head>

<body>
  <button>显示</button>
  <button>隐藏</button>
  <button>切换</button>

  <div id="box"></div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 考虑到 3个按钮都要操作 box, 提前查询出来备用
    // 一种约定俗成的规范: jQuery类型的变量, 用 $ 开头, 非强制
    // 类似: 结婚后 应该带婚戒, 一看就知道已婚. -- 不强制
    const $box = $('#box')

    // 找到第一个按钮
    $('button:first-child').click(function () {
      $box.show()  //show:显示
    })

    // 第二个按钮
    console.log($('button'))
    // 可以通过序号(从0开始数) 从查询结果中读取某个元素
    // 注意: 序号不是 nth-child, 是指查询结果中的元素序号
    // eq: equal缩写, 等于
    $('button:eq(1)').click(function () {
      $box.hide() //hide:隐藏
    })

    // 读取按钮中, 序号2 的
    $('button').eq(2).click(function () {
      // 参数可选, 代表动画时长: 'slow' 'fast' 或者 毫秒数
      $box.toggle(2000) // toggle:切换
    })
  </script>
</body>

</html>
```

## 菜单

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>菜单</title>
  <style>
    #menu {
      user-select: none;
    }

    /* #menu:hover>div:last-child {
      display: block;
    } */

    #menu>div:first-child {
      font-size: 1.2em;
      background-color: #eee;
      padding: 5px;
    }

    #menu>div:last-child {
      padding: 10px;
      background-color: #ccc;
      display: none;
    }
  </style>
</head>

<body>
  <div id="menu">
    <div>1号佳丽: 雷佳乐</div>
    <div>
      <div>肤白</div>
      <div>貌美</div>
      <div>大长腿</div>
      <div>唱跳rap,打篮球</div>
    </div>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#menu>div').eq(0).click(function () {
      // 下一个兄弟, 原生: nextElementSibling
      // next(): 获取下一个兄弟
      // $(this).next().toggle()

      // slideToggle: 滑动切换, 参数 slow fast 毫秒数字
      // 1000毫秒 = 1秒
      $(this).next().slideToggle(100)
    })
  </script>
</body>

</html>
```

## 属性操作

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>属性操作</title>
</head>

<body>
  <a href="http://tmooc.cn" id="a1" data-xx="111"></a>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 属性读取分两种方式:
    // 旧方案: getAttribute  setAttribute
    // 新方案: .属性名  .属性名=值

    // jQuery提供了两种操作属性的方案: prop(新方案)  attr(旧方案)
    const $a = $('a')
    console.log($a.attr('href'))
    console.log($a.attr('id'))
    console.log($a.attr('data-xx'))
    //修改
    $a.attr('href', 'http://www.baidu.com')

    // prop: 底层实现方式 是 DOM的新方案  元素.属性名
    console.log($a.prop('href'));
    console.log($a.prop('id'));
    $a.prop('href', 'http://douyu.com')

    // 自定属性读取: 专业的 data
    console.log($a.data('xx')) // data-xx

    // property : 财产,资源, 属性
    // 实践中: 推荐使用 prop 来读取系统属性,  data 读取自定义属性
    // attr 使用较少
  </script>
</body>

</html>
```

## 大小图切换

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>大小图切换</title>
  <style>
    body {
      background-color: #eee;
    }

    #box {
      user-select: none;
      width: 400px;
    }

    #box>img {
      width: 100%;
    }

    #box>div>img {
      width: 23%;
      /* transparent: 透明  */
      border: 2px solid transparent;
    }

    #box>div>img.active {
      border-color: orangered;
    }
  </style>
</head>

<body>
  <div id="box">
    <img src="./imgs/1_lg.jpg" alt="">
    <div>
      <!-- 利用自定义属性, 在小图上绑定 大图的名字 -->
      <img data-big="1_lg.jpg" class="active" src="./imgs/1.sm.jpg" alt="">
      <img data-big="2.lg.jpg" src="./imgs/2.sm.jpg" alt="">
      <img data-big="3.lg.jpg" src="./imgs/3.sm.jpg" alt="">
      <img data-big="4.lg.jpg" src="./imgs/4.sm.jpg" alt="">
    </div>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#box>div>img').mouseenter(function () {
      $(this).addClass('active').siblings().removeClass('active')

      // 自定义属性读取?  data
      const big = $(this).data('big')
      // src属性是否是 系统提供的?  是 ; 用 prop
      // src的值是路径, big只是图片名, 必须拼接成相对路径再用
      $('#box>img').prop("src", './imgs/' + big)
      console.log('./imgs/' + big);
      // img.src(参数1) = 值(参数2)
      // 原理同: css的仿写
    })
  </script>
</body>

</html>
```

## 标签栏

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>标签栏</title>
  <style>
    #tabs {
      user-select: none;
      width: 500px;
      background-color: #eee;
    }

    #tabs>div:first-child>span {
      display: inline-block;
      width: 120px;
      line-height: 40px;
      text-align: center;
    }

    #tabs>div:first-child>span.active {
      background-color: red;
      color: white;
    }

    #tabs>div:last-child>div {
      height: 200px;
      padding: 10px;
      border: 1px solid brown;
      margin-top: 1px;
    }

    /* 没有 active 样式的, 隐藏 */
    #tabs>div:last-child>div:not(.active) {
      display: none;
    }
  </style>
</head>

<body>
  <div id="tabs">
    <div>
      <!-- 通过自定义属性, 保存标题 对应的 详情元素的id -->
      <span data-id="tab1" class="active">商品介绍</span>
      <span data-id="tab2">规格与包装</span>
      <span data-id="tab3">售后保障</span>
      <span data-id="xxyy">家乐购物会</span>
    </div>
    <div>
      <div id="xxyy">家乐购物会...</div>
      <div id="tab1" class="active">商品介绍...</div>
      <div id="tab2">规格与包装...</div>
      <div id="tab3">售后保障...</div>
    </div>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#tabs>div:eq(0)>span').click(function () {
      $(this).addClass('active').siblings().removeClass('active')

      const id = $(this).data('id') //读取标题上存储的自定义属性
      // 假设 id='tab1',  
      // 下方拼接出的 '#tabs #tab1'
      $(`#tabs #${id}`).addClass('active').siblings().removeClass('active')
    })
  </script>
</body>

</html>
```

## 标签内容

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>标签内容</title>
</head>

<body>
  <div id="box">
    <a href="http://tmooc.cn">Go Tmooc</a>
  </div>

  <div id="app"></div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 读取标签内容有两种方式:
    // 1. innerHTML: 读取标签中的 HTML代码+文本
    // 2. innerText: 读取标签中的 文本
    console.log($('#box').html()) // HTML + 文本
    console.log($('#box').text()) // 文本

    // 设置文本
    $('#box').html('<h1>Hello</h1>') // 当做HTML解析
    $('#app').text('<h1>Hello</h1>') // 当做文本展示, 不解析

    // 累加拼接: 没有 += , 只能读取出来, 拼接, 再设置回去
    $('#app').html($('#app').html() + '333')
  </script>
</body>

</html>
```

## 轮播图

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>轮播图</title>
  <style>
    #banner {
      user-select: none;
      overflow: hidden;
      border: 2px solid red;
      width: 600px;
      /* 子绝父相 */
      position: relative;
    }

    #banner>div:last-child {
      position: absolute;
      bottom: 5px;
      /* border: 2px solid red; */
      width: 100%;
      text-align: center;
    }

    #banner>div:first-child {
      display: flex;
    }

    #banner img {
      width: 600px;
      transition: 0.5s;
    }

    /* 移动第一个图片, 剩余图片会随着变化 */
    #banner img:first-child {
      /* margin-left: -000%; */
      /* margin-left: -100%; */
    }

    #banner span {
      display: inline-block;
      width: 14px;
      height: 14px;
      border-radius: 50%;
      background-color: aqua;
    }

    #banner span.active {
      background-color: orange;
    }
  </style>
</head>

<body>
  <div id="banner">
    <div>
      <img src="./imgs/banner1.png" alt="">
      <img src="./imgs/banner2.png" alt="">
      <img src="./imgs/banner3.png" alt="">
      <img src="./imgs/banner4.png" alt="">
    </div>
    <div>
      <span class="active"></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#banner span').mouseenter(function () {
      $(this).addClass('active').siblings().removeClass('active')
      // jQuery提供了 index 方法, 用来获取指定元素的序号
      // [家乐, 鑫鑫, 波波].index(家乐) :  0  -- 代表家乐是序号0的
      // $('#banner span'): 查询到所有的span 小圆点
      // this: 当前的 span 小圆点
      const i = $('#banner span').index(this)
      console.log('i:', i)

      // 第一张图的 margin-left
      // $('#banner img:eq(0)').css('margin-left', -i + '00%')
      $('#banner img').css('transform', `translateX(${-i}00%)`)
      console.log(-i + '00%');
    })

    // 每两秒钟滚动一次
    setInterval(() => {
      // 当前激活的小圆点的 下一个
      let $next = $('#banner span.active').next()
      console.log($next)
      // 数组长度 length  1代表找到1个 0没找到
      if ($next.length == 0) {
        // 如果没找到, 则触发第一个小圆点
        $next = $('#banner span:eq(0)')
      }

      // 触发其 mounseenter 事件
      $next.mouseenter()  //直接用()触发, 不传参就是触发事件
    }, 2000);

    // var a = '家乐'
    // console.log('我喜欢a') // 这句话会打印出  我喜欢家乐 吗?
    // console.log(`我喜欢${a}`) // 这句话会打印出  我喜欢家乐 吗?
  </script>
</body>

</html>
```



## 自定义动画

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>自定义动画</title>
    <style>
      #box {
        width: 100px;
        height: 100px;
        background-color: gray;
        position: relative;
      }
    </style>
  </head>

  <body>
    <button>开始动画</button>
    <button>结束动画</button>
    <div id="box"></div>

    <script src="./vendor/jquery-3.6.0.js"></script>
    <script>
      $("button:eq(0)").click(function () {
        // animate(): 设置动画效果
        // 参数1: 目标css样式   参数2: 动画时长   参数3:完成后的回调
        $("#box").animate({
          borderRadius: "50%",
          top: "100px",
          left: "200px",
        });

        // 动画队列: 书写多个动画, 则会依次执行
        $("#box").animate({ left: 0 }).animate({ top: 0 });

        // animate:不支持 颜色 和 transform
        // 参数2: 持续时长,  单位 毫秒
        // 参数3: 动画完成后的回调
        $("#box").animate({ borderRadius: 0 }, 1000, function () {
          alert("动画执行完毕!");
        });
      });

      // 停止动画
      $("button:eq(1)").click(function () {
        // 默认: 停止当前动画, 开始下一次的动画
        // 参数1: boolean类型, 代表是否要停止整个动画队列
        // 参数2: 停止时, 是否立刻变为动画的最终效果
        $("#box").stop(true, true);
      });
    </script>
  </body>
</html>

```



## 循环轮播图

<img src="jQuery02.assets/image-20220513114420018.png" alt="image-20220513114420018" style="zoom:67%;" />

<img src="jQuery02.assets/image-20220513120232638.png" alt="image-20220513120232638" style="zoom:67%;" />

## 评分

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>评分</title>
  <style>
    #score>img {
      width: 50px;
      height: 50px;
    }
  </style>
</head>

<body>
  <h2>1</h2>
  <div id="score">
    <img src="./imgs/pj1.png" alt="">
    <img src="./imgs/pj0.png" alt="">
    <img src="./imgs/pj0.png" alt="">
    <img src="./imgs/pj0.png" alt="">
    <img src="./imgs/pj0.png" alt="">
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#score img').mouseenter(function () {
      // 获取当前项的序号
      const i = $('#score img').index(this)
      const src = `./imgs/pj${i + 1}.png`
      console.log('src:', src);

      $(this).prop('src', src)
      // prevAll:  前方所有的兄弟
      $(this).prevAll().prop('src', src)
      // nextAll: 后面的所有兄弟
      $(this).nextAll().prop('src', './imgs/pj0.png')

      $('h2').html(i + 1)
    })
  </script>
</body>

</html>
```

## 准备就绪

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>准备就绪</title>
  <script src="./vendor/jquery-3.6.0.js"></script>
  <!-- 代码从上 向下执行, 执行脚本时, DOM元素还没加载, 所以不好用
  理论上: JS代码应该书写在 body 的最后面
  -->
  <!-- 实际工作中: 往往要把 JS 代码书写在外部的js文件 -->
  <script>
    $('#box').css('color', 'green')
  </script>

  <script src="./06.js"></script>
</head>

<body>
  <div id="box">加油, 小马! 站起来</div>

  <!-- 正常人引入外部脚本, body最后 -->
  <!-- <script src="./06.js"></script> -->
</body>

</html>
```

```js
// 实际工作时, 往往会团队合作
// 人员的技术能力 参差不齐, 例如 家乐就有极大的可能 把 外部js 在head中引入, 那就会失效
// 家乐肯定会想: 什么垃圾框架, 都不好用!

// 作为高手写代码: 一定要 防御性编程 -- 让不会用的人一样能好用

// 监听: DOM加载完毕的时机, 再调用方法
// window.onload = function(){
//   // 页面加载完毕时, 才自动调用
//   $('#box').css('border', '2px solid red')
// }

// jQuery进行了封装, 提供更简单的书写方式
// $(函数): 在DOM加载完毕时, 自动触发函数
$(function(){
  $('#box').css('border', '2px solid red')
})

// 稍微复杂点的写法, 没人用, 但是你要知道
// $(document).ready(function(){
//   $('#box').css('border', '2px solid red')
// })
```

## 动态新增数据

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>数据的动态新增</title>
  <style>
    #box {
      padding: 10px;
      background-color: #eee;
    }
  </style>
</head>

<body>
  <button id="add">新增数据</button>

  <div id="box">
    <button>家乐</button><button>天宝</button>
    <button>蔡瑶</button>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#add').click(function () {
      // box.innerHTML += '<button>小龙</button>'

      // append: 添加子元素
      $('#box').append('<button>小龙</button>')
    })

    // 事件委托: jQuery提供专门的 on 方法, 实现委托
    // on: 当....时

    // 参数1: 事件名, 例如 click  mouseenter  keyup...
    // 参数2: 过滤 -- 过滤出指定的 事件当事人, this指向当事人
    // 参数3: 回调函数
    $('#box').on('click', 'button', function () {
      // 冒泡: 怎么获取谁触发的事件  e.target
      console.log('点击:', this);
      $(this).remove() // remove: 删除元素自身
    })
  </script>
</body>

</html>
```

## 待办事项

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>待办事项</title>
</head>

<body>
  <div>
    <input type="text" placeholder="请输入待办事项">
    <!-- 表单元素都具有的 disabled 属性, 不可用 -->
    <button disabled>确定</button>
  </div>
  <ul>
    <li>
      <span>吃饭</span><button>删除</button>
    </li>
    <li>
      <span>睡觉</span><button>删除</button>
    </li>
    <li>
      <span>打亮亮</span><button>删除</button>
    </li>
  </ul>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 输入框的值实时变化监听
    // 作者没有封装  input 事件, 只能通过通用的 on 方式添加
    $('input').on('input', function () {
      console.log(this.value);
      // disabeld: 不可用
      // if (this.value == '') {
      //   $(this).next().prop('disabled', true)
      // } else {
      //   // 不 不可用 -> 可用
      //   $(this).next().prop('disabled', false)
      // }

      // 空字符串 -> false -> !false -> true
      $(this).next().prop('disabled', !this.value)
    })


    // 考虑到 子元素会动态新增, 所以给父元素添加委托
    $('ul').on('click', 'button', function () {
      // this指向 参数2 过滤出来的元素
      console.log('this:', this);
      $(this).parent().remove()
    })

    $('div>button').click(function () {
      // jQuery类型的元素, 存储在变量里, 最好是 $ 开头
      const $inp = $(this).prev() //prev: 上一个元素
      // 输入框的值: 原生value  JQ: val
      const kw = $inp.val()
      console.log($inp);
      console.log(kw);

      $('ul').append(`<li>
        <span>${kw}</span><button>删除</button>
      </li>`)

      // 把输入框的value 改成 空字符串
      $inp.val('') // val(): 如果传参, 就是赋值操作
      // 点击确定按钮后, 让其不可用
      $(this).prop('disabled', true)
    })

    // 键盘:
    $('input').keyup(function (e) {
      // 按键编号13 是回车
      if (e.keyCode == 13) {
        // 触发 确定按钮相同的操作
        // 判断按钮 可以用, 再触发
        const $btn = $('div>button')
        // 不不可用 == 可用: 双重否定表肯定
        !$btn.prop('disabled') && $btn.click()
        // 逻辑短路:  逻辑与中,  前面是真的, 才会执行后续的
      }
    })

    // 操作动态新增的子元素 -- 用委托
  </script>
</body>

</html>
```

## 克隆

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>克隆</title>
  <style>
    #box1 {
      padding: 10px;
      background-color: lightcoral;
    }
  </style>
</head>

<body>
  <div id="box">
    <button>红烧牛肉</button>
    <button>鲜虾鱼板</button>
    <button>老坛酸菜</button>
    <button>香辣牛肉</button>
    <button>小鸡炖蘑菇</button>
  </div>

  <hr>
  <h3>今日午餐:</h3>
  <div id="box1"></div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 点击 div#box 中的 按钮, 把这个按钮添加到 div#box1 的子元素中
    $('#box button').click(function () {
      // clone: 复制元素
      const c = $(this).clone()
      // 把复制出来的, 添加到子元素
      $('#box1').append(c)
    })
  </script>
</body>

</html>
```

## 替换

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>替换</title>
</head>

<body>
  <div id="box">
    家乐的男神是: <button>胡歌</button>
  </div>
  <hr>
  <div id="box1">
    <button>胡歌</button>
    <button>彭于晏</button>
    <button>杨洋</button>
    <button>智超</button>
    <button>陈浪浪</button>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 委托: 给父元素加事件, 监听指定的子元素button
    $('#box1').on('click', 'button', function () {
      // replace: 替换     with: 和...
      $("#box>button").replaceWith($(this).clone())
    })
  </script>
</body>

</html>
```

## 序号相关

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>序号相关选择器</title>
</head>

<body>
  <ul>
    <li>楠姐0</li>
    <li>楠姐1</li>
    <li>楠姐2</li>
    <li>楠姐3</li>
    <li>楠姐4</li>
    <li>楠姐5</li>
    <li>楠姐6</li>
  </ul>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 以下都是根据 查询出来的 元素的序号进行操作
    console.log($('li'))

    // even  -- 偶数,  4个字母
    // odd   -- 奇数,  3个字母
    $('li:even').css('background-color', 'gray')

    $('li:odd').css('background-color', 'blue')

    // lt : less than 小于
    // gt:  greater than  大于
    $('li:lt(3)').css('color', 'red')
    $('li:gt(4)').css('color', 'green')

    // eq: 等于 equal
    $('li:eq(3)').css('padding', '10px')

  </script>
</body>

</html>
```

## 包含关系

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>包含关系选择器</title>
</head>

<body>
  <ul>
    <li>楠姐666</li>
    <li>亮哥888</li>
    <li>铭铭322</li>
    <li>家乐678</li>
  </ul>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 把标签内容中含有 6 的标红
    // contains :包含
    $('li:contains(6)').css('color', 'red')

    // 练习: 把 包含  哥  字的标签 变蓝 blue
    $('li:contains(哥)').css('color', 'blue')

    // :not()  不, 反向
    $('li:not(:contains(哥))').css('border', '2px red solid')

    // 感兴趣, 查文档:  find 方法
    // 在选出来的元素里, 接着进行选择
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
  <title>包含关系</title>
</head>

<body>
  <div></div>
  <div>
    <a href="">Tmooc</a>
  </div>
  <div>
    <button>我是按钮</button>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 查找到 空的div,  empty
    $('div:empty').css({
      height: '30px', border: '3px solid red'
    })

    // 查找到 非空的div,  parent 父母
    $('div:parent').css('border', '2px dashed green')

    // 把带有按钮子元素的div
    // has: 有.   
    $('div:has(button)').css('padding', '10px')
  </script>
</body>

</html>
```

## ajax

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ajax</title>
  <style>
    #box {
      user-select: none;
      width: 800px;
      margin: 0 auto;
    }

    #box>div {
      display: flex;
      /* 空白在中间间隔 */
      justify-content: space-between;
      padding: 10px;
      border-bottom: 1px dashed gray;
    }
  </style>
</head>

<body>
  <div id="box">
    <!-- 套路: 应该先用假数据 配合 css 做出效果, 然后换成真数据 -->
    <div>
      <span>题目</span>
      <span>时间</span>
    </div>
  </div>

  <!-- Ajax: 利用 JS 来发送网络请求, 从服务器获取数据 -->
  <!-- 前提:要有网 -->
  <!-- 原生的Ajax使用起来颇为繁琐, 在 jQuery中作者进行了封装 -->

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 这是用PHP制作的服务器接口, 可以直接使用
    const url = 'http://www.codeboy.com:9999/mfresh/data/news_select.php'

    // 请求分多种, 其中 GET 和 POST 最常见
    // get: 封装得到的发送get请求的方法
    // 参数1: 请求的接口地址    参数2: 成功后的回调函数

    // 对于数据是哪里来的感兴趣 - 复习亮亮的 express

    // $.取餐(隔壁的肯德基, 外卖 => { })
    $.get(url, data => {
      console.log(data)
      // 先把数据映射成 HTML代码的数组
      const a = data.data.map(value => {
        const { title, pubTime } = value
        // 真数据, 替换掉 假数据
        return `<div>
          <span>${title}</span>
          <span>${pubTime}</span>
        </div>`
      })

      console.log(a)
      // 拼接成字符串, 放到box里
      // jQuery: 当检测到内容是数组, 会自动拼接成字符串
      // $('#box').html(a) //做法1: innerHTML, 覆盖效果

      // 做法2:  append: 添加子元素, 累加效果
      $('#box').append(a)
    })
  </script>
</body>

</html>
```

## 番剧

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 阻止防盗链 -->
  <meta name="referrer" content="no-referrer">
  <title>番剧</title>
  <style>
    #box>div {
      margin: 0 10px 10px 10px;
      display: inline-block;
      width: 150px;
      border: 1px solid gray;
    }

    #box>div>img {
      width: 150px;
    }
  </style>
</head>

<body>
  <div id="box">
    <div>
      <img src="" alt="">
      <div>标题</div>
    </div>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    const url = 'https://api.xin88.top/bilibili/timeline.json'

    $.get(url, data => {
      console.log(data)

      const a = data.result.map(({ title, square_cover }) => {
        return `<div>
          <img src="${square_cover}" alt="">
          <div>${title}</div>
        </div>`
      })

      $('#box').html(a)
    })
  </script>
</body>

</html>
```

## post

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>POST</title>
</head>

<body>
  <!-- 
    常见网络请求方式: GET 和 POST
    - GET: 获取 -- 通常用来从服务器获取数据, 对应的数据库 查询操作
    - POST: 传输 -- 通常用来向服务器传递数据, 对应数据库的 增删改 操作

    两者在使用时的差异: 主要在于参数传递方式的不同
    - GET:  路径?参数=值&参数=值
          例如: getNews.php?page=1&size=10   代表获取第一页的10条数据
    - POST: 路径 和 参数需要分开传递
         例如: getNews.php    {page:1, size:10}
   -->
  <div id="box">
    <input type="text" placeholder="请输入您的用户名">
    <br>
    <input type="password" placeholder="请输入您的密码">
    <br>
    <button>登录</button>
  </div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    $('#box>button').click(function () {
      const uname = $('input').eq(0).val() // val - value
      const upwd = $('input').eq(1).val()
      // POST参数和路径分开
      const url = 'http://www.codeboy.com:9999/data/user/login.php'
      // 参数是 uname 和 upwd, 由服务器规定
      const params = { uname, upwd } // { uname:uname, upwd:upwd}
      // 属性名:变量  如果属性名和变量一样, 则可以合写
      $.post(url, params, data => {
        console.log(data)
        // 正确的账号: doudou  密码:123456
      })
    })
  </script>
</body>

</html>
```

## load

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>load</title>
  <style>
    div {
      padding: 10px;
      background-color: lightgray;
      margin: 10px;
    }
  </style>
</head>

<body>
  <!-- 
    真正的大型网页, 页面代码非常多, 涉及到 拆分 和 复用 

    - HTML:  外部html文件  .html  利用 JQ的 load 引入
    - CSS:  外部css  .css文件, 利用 link 引入
    - JS:  外部 js   .js文件, 利用 script 引入
   -->
  <div id="box1"></div>
  <div id="box2"></div>
  <div id="box3"></div>

  <script src="./vendor/jquery-3.6.0.js"></script>
  <script>
    // 必须用服务器打开, 即 live server 插件
    // 右键当前文件 open with live server

    // load: 加载,  把指定文件中的代码 加载到子元素里
    // load: 就是把文件中的代码复制到了 指定的元素里
    // 注意: 如果多个文件中代码有冲突会报错, 例如 css 冲突, const变量名冲突http://127.0.0.1:5500/15.load.html
    $('#box1').load('./16.com.html')

    $('#box2').load('./16.com.html')

    $('#box3').load('./06.ajax.html')

  </script>
</body>

</html>
```

## 如何生成Express项目包

- node环境搭建
  - node软件版本需要在 `12 ~ 16` 之间
  - 做开发, 优先使用稳定版 -- 兼容性强
  - 版本号查看: `node -v`
- npm: node的扩展包的管理工具, 默认的下载源是 外国的服务器, 速度`极慢`
  - 修改为中国镜像 `npm config set registry https://registry.npm.taobao.org/`
  - 查看当前镜像: `npm config get registry`

## 开启服务器

<img src=".\assets\image-20220517091938947.png" alt="image-20220517091938947" style="zoom:67%;" />

### nodemon

侦测修改, 自动重启服务器的软件: `nodemon`

![image-20220517093521482](.\assets\image-20220517093521482.png)

安装完毕后, 使用 nodemon 来启动服务器: `nodemon app.js`

![image-20220517093655641](.\assets\image-20220517093655641.png)

## 跨域

> 跨域: 浏览器具有`同源`策略
>
> - 同源: 在网页中利用 `AJAX`发送网络请求, 必须是同一个服务器上的
>
>   - 通俗来说:自己家里人可以互相访问, 比如  成亮的钱  成小亮可以随意使用, 但是 雷佳乐跟成亮要钱花, 就会被果断`拒绝` -- 因为他们不熟
>
> - 通过 `http://localhost:3000` 来访问的`index.html` 文件
>
> - 在 index.html 文件中, 使用 ajax 发送请求
>
>   <img src=".\assets\image-20220517101507797.png" alt="image-20220517101507797" style="zoom: 33%;" />
>
>   姓: http,  名字是 localhost   端口:3000

跨域报错: `在自己家里, 访问了别人家的东西 -- 不同源,就报错!`

- 场景: 利用 live server, 开启index.html  `http://localhost:5500`
- 在这个地址中, 请求`http://localhost:3000/skills`

![image-20220517101710087](.\assets\image-20220517101710087.png)

## 跨域解决

目前流行`前后端分离` 项目

- 由于现在的网站访问量很大, 如果把所有操作都放在一台计算机上, 负载太高, 压力大
- 做法: 拆分
  - 数据库放在一个服务器上
  - 前端页面放在另一个电脑上
- 不是同一台电脑, 非同一个服务器 互相之间访问, 必然会跨域
- 所以: 解决跨域问题是 前端程序员必备技能!!!

解决方案主流有3种

- CORS: 最主流推荐
  - 原理:在服务器上添加一个白名单, 通过响应头告知浏览器, 不要拦截指定来源的
- PROXY: 代理方案, 适合服务器不可修改的场景
- JSONP: 比较适合PHP服务器, 日常使用较少

![image-20220517104110985](.\assets\image-20220517104110985.png)



## 接口抓取

由于前后端分离项目, 都是通过 ajax 发送请求, 我们可以通过浏览器抓到这个接口来用

<img src=".\assets\image-20220517112223398.png" alt="image-20220517112223398" style="zoom:67%;" />

<img src=".\assets\image-20220517112324631.png" alt="image-20220517112324631" style="zoom:67%;" />

<img src=".\assets\image-20220517112346699.png" alt="image-20220517112346699" style="zoom:67%;" />

> https://m.douyu.com/api/room/list?page=2&type=yz

代理服务器

> 通俗的例子:  假设 `家乐` 和 `建军` 关系不好, 见面就打架,  但是 家乐想跟建军借 游戏机玩.  `晓婷` 和 `建军` `家乐` 关系都不错
>
> <img src=".\assets\image-20220517113714459.png" alt="image-20220517113714459" style="zoom:67%;" />

![image-20220517113310260](.\assets\image-20220517113310260.png)



![image-20220517115549982](.\assets\image-20220517115549982.png)



## 代码

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>首页</title>
</head>

<body>
  <!-- 文件名 index.html 这是固定的特殊文件名,代表首页 -->
  <!-- 特点: 当访问服务器时, 默认找到名字是 index.html 的 -->
  <h1>Welcome to Express!</h1>

  <script src="./jquery-3.6.0.js"></script>
  <script>
    const url = 'http://localhost:3000/skills'

    $.get(url, data => {
      console.log(data)
    })

    // 斗鱼服务器采用了 cors. 设置了白名单, 导致其他服务器无法访问
    // 场景: 服务器无法修改, 不能操作 添加 cors
    // 
    // 办法: 代理模式
    // const dy = 'https://m.douyu.com/api/room/list?page=2&type=yz'
    const dy = 'http://localhost:3000/dy/api/room/list?page=2&type=yz'
    $.get(dy, data => {
      console.log(data)
    })
  </script>
</body>

</html>
```

## cors入门

```js
const express = require('express')

const app = express()

// 指定静态文件 -- html文件存储的路径
app.use(express.static('public'))

// CORS: 在服务器添加白名单, 允许来自其他来源的访问即可
// all: 代表所有类型的网络请求, POST GET DELETE PUT ...
// * : 通配符, 匹配所有请求的地址
// 回调函数有3个参数:  函数的重载机制 -- 检测参数的个数, 如果是3个就被当做是拦截器来使用
// 拦截所有类型的网络请求, 所有的请求地址, 统一返回一个 响应头, 会传递给浏览器, 告诉浏览器, 允许的来源
app.all('*', (req, res, next) => {
  // 不安全: 直接允许所有来源 不安全
  // 所以: 可以采用 第三方 cors 模块, 来精确配置允许的来源
  res.header('Access-Control-Allow-Origin', '*')
  //          访问 - 控制 - 允许 - 来源   :  * 代表任何来源
  next()
})

app.listen(3000, () => {
  console.log('服务器启动成功, 端口3000');
})

// 关于命令行工具, 推荐采用 cmd , 另外一款工具 power shell 对脚本支持不好
// 启动: 在 my-server 文件夹下, 运行命令  node app.js
// 通过浏览器访问 localhost:3000

// 服务器上的 app.js 如果有修改, 必须重启服务器才能生效
// 重启服务器分 手动 和 自动两种方式
// 手动: 在命令行按 ctrl+c 停止, 再用 node app.js 启动
// 自动: 安装 nodemon 模块
//    -- 全局安装  npm i -g nodemon

// GET接口
// localhost:3000/skills
app.get('/skills', (req, res) => {
  // res: response响应,  响应用户发来的请求, 返回数据给用户
  // send: 发送, 可以把内容发送给用户
  res.send(['vue', 'react', 'angular', 'uniapp', 'dom', 'JS'])

  // 如果是实际项目: 数据应该是从 mysql 查询出来

})
```

## cors模块

```js
const express = require('express')
// cors模块: 可以精确配置 白名单
// 先安装, 在 my-server 目录下执行: npm i cors
const cors = require('cors')

const app = express()

// 利用 cors 直接允许所有来源, 不安全
// app.use(cors())

// 精确配置
app.use(cors({
  // 数组类型,可以加多个地址, 代表允许的来源
  origin: ['http://127.0.0.1:5500', '可以书写更多地址']
}))
// 测试方式: 通过 live server 运行 index.html
// 手动把浏览器地址 从 127.0.0.1 改成 localhost 试试
// 结果: 127的不报错, 因为在 origin中
// localhost会报错, 因为不在 origin 里


app.use(express.static('public'))

app.listen(3000, () => {
  console.log('服务器启动成功, 端口3000');
})

app.get('/skills', (req, res) => {
  res.send(['vue', 'react', 'angular', 'uniapp', 'dom', 'JS'])
})
```

## 代理

```js
const express = require('express')
const cors = require('cors')
// 代理模块: npm i express-http-proxy
const proxy = require('express-http-proxy')

const app = express()
// 允许所有来源: 接受任何来源的访问
app.use(cors())

// 必须写在 cors 下方, 否则可能出现跨域
// 参数1 是自定义的,  /xxx
app.use('/dy', proxy('https://m.douyu.com'))
// 凡是 localhost:3000/dy/....  都会转到  https://m.douyu.com/.... 

app.use(express.static('public'))

app.listen(3000, () => {
  console.log('服务器已启动');
})

// node app.js
```