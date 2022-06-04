# 数据库  mysql

### **一.存储数据的方式有哪些**

 文件/内存/第三方云服务器/数据库服务器

### **二.数据库**

 数据库是按照一定的形式来组织存储数据，目的是为了更好的操作数据 —— 增删改查

####  1.数据库的发展历史

 网状数据库 -> 层次型数据库  -> 关系型数据库（SQL） -> 非关系型数据库(NoSQL)

####  2.关系型数据库逻辑结构   

   Server   -> Database -> Table ->   Row -> Column 

 数据库服务器 -> 数据库 -> 数据表   -> 行  ->   列                                 

###  三.MySQL

 Oracle：MySQL

 马丁：MariaDB

  Xampp：服务器套装，包含多款服务器  

####  1.MySQL**的部署结构**

#####  (1)服务器端

  负责存储维护数据 —— *银行的数据库服务器*

#####  (2)客户端

  负责连接数据库，对数据进行操作 —— *ATM机*

#####  (3)使用客户端连接服务器端  

  **mysql.exe -h127.0.0.1 -P3306 -uroot -p**

  **-h host**  连接的服务器的域名/**IP地址   localhost/127.0.0.1(自己电脑的)**

  **-P port**  端口号

  **-u user**   用户名，MySQL下默认有一个管理员账户root

**-p password**   密 码，xampp下root的密码为空

 **mysql -uroot**    简写形式

  连接的结束不要加分号  

####  **2.常用的管理命令**

  管理命令结尾必须加英文的**分号**.  

 **quit;** 退出服务器的连接

 **show databases;**  显示所有的数据库

 **use** 数据库名称;  进入到指定的数据库

 **show tables;**  显示当前数据库中所有的数据表

 **desc 数据表名称;**  描述指定的表都有哪些列

### **四.SQL命令**

 **SQL：结构化查询语言，专门用于操作关系型数据库服务器**

####  1.交互模式

 在客户端输入一行命令点击回车，服务器端就执行一行命令 —— 适用于临时性查看数据

####  2.脚本模式

 客户端把要执行的命令写在一个脚本文件中，然后一次性提交给服务器执行 —— 适用于批量的操作数据

   **mysql   -uroot<拖拽脚本**  



####  3.SQL命令的语法规范

 **一行命令可以跨越多行，最终以英文的分号作为结束**

 SQL命令**不区分大小写**，建议关键字大写，非关键字小写

 假设某一同命令出现语法错误，则此条命令往后所有命令不再执行

 分为单行注释(#..)和多行注释(/*..*/)，注释的代码不会执行

####  4.常用的SQL命令

#####  (1)丢弃数据库，如果存在

  ***drop database if exists 数据库名称;***

#####  (2)创建新的数据库

  create database 数据库名称;

 练习：编写脚本文件04_tedu.sql，先丢弃数据库tedu，再创建新的数据库tedu。

#####  (3)进入数据库

   use 数据库名称;

#####  (4)创建数据表

create table 数据表名称(

 列名称  类型

);

#####  (5)插入数据

  insert into 数据表名称 values( …. );

#####  (6)查询数据

  select * from 数据表名称;

##### ( 7).修改

 Update 数据表名称  set 列名称=值, 列名称=值…  where 条件;

##### (8).删除

 Delete from 数据表名称  where 条件;

### **五.计算机如何存储字符**

####  1.如何存储英文字符

 *ASCII：对128个英文字母及其符号进行了编码*

 *Latin-1：总共有256个，对欧洲字符进行了编码，兼容ASCII（MySQL默认使用这种编码）*

####  2.如何存储中文字符

 *GB2312：对常用的6千多汉字进行了编码，兼容ASCII*

 *GBK：对2万多的汉字进行了编码，兼容GB2312*

 *Unicode码：对世界上主流国家常用的语言进行了编码，分为三种存储方案，分别是utf-8，utf-16，utf-32*

####  3.解决MySQL中文乱码

  **脚本文件另存为的编码为utf8**

  **客户端连接服务器端的编码为utf8**

  **服务器端创建数据库，存储字符的编码为utf8**

​                                 

  **特殊情况：**如果以上在交互模式还有乱码，需要先退出交互模式，然后执行修改命令行的编码为utf8     chcp 65001  

### 六.**常见的列类型**

 列类型：在创建数据表的时候，指定的列所能存储的数据类型

 create table news(

  列名称  列类型

);

####  1.数值型 —— 可以不加引号

  **tinyint  微整型，**占1个字节，范围-128~127

  **smallint 小整型，**占2个字节，范围-32768~32767

  **int  整型，**占4个字节，范围-2147483648~2147483647

  **bigint  大整型，**占8个字节，范围

  **float  单精度浮点型**，占4个字节，存的值越大精度越低

  **double 双精度浮点型，**占8个字节，存的值越大精度越低

  **decimal(M, D)  定点小数**，存储的值小数点不会发生变化，M表示总的有效位数，D表示小数点后的有效位数

  **boolean  布尔型**，

只有两个值，分别是true和false，代表真和假；常用于存储只有两个值得数据，例如：性别、是否在线、是否为会员…

  true和false是关键字，使用的时候不能加引号  boolean会自动转为tinyint，true转为1，false转为0；也可以直接插入1和0  

####  2.日期时间型 —— 必须加引号

 **date  日期型**  ‘2021-10-20’

 **time  时间型**  ’15:52:30 ’

 **datetime  日期时间型**   ‘2021-10-20 15:52:30’

####  3.字符串型  —— 必须加引号  

 **varchar(M)  变长字符串**，不会产生空间浪费，数据操作速度相对慢，常用于存储变化长度的数据，例如：文章标题，详情，姓名… M最大值是65535

 **char(M)   定长字符串，**可能会产生空间浪费，数据操作速度相对快，常用于存储固定长度的数据，例如：手机号码、身份证号码… M最大值是255

 **text(M)  大型变长字符串，M的最大值2G**

 

|        | varchar(5) | char(5)    |
| ------ | ---------- | ---------- |
| a      | a\0        | a\0\0\0\0  |
| ab     | ab\0       | ab\0\0\0   |
| 一二三 | 一二三\0   | 一二三\0\0 |

 **浮点型**

 123456.789E-1       12345.6789            1234.56789E1         123.456789E2

  TB  GB  MB  KB  Byte(字节) Bit(位)   1字节=8位

 ***选择合理的列类型***

 *create table t1(*

*id int,*

*name varchar(16),*

*sex boolean,*

*phone char(11),*

*birthday date,*

*detail varchar(5000),*

*age tinyint*

*);*

  **true 和 false 使用的时候不能加引号**

 

### **七.列约束**

 Mysql可以对插入的数据进行验证，只有通过验证才允许插入，例如：编号不能重复、性别只能是男或者女、一个人的成绩范围0~100

####  1.主键约束

 声明了主键约束的列不允许出现重复的值，**一个表中只能有一个主键约束**，通常加在编号列，可以加快数据的查找速度

  **null：**表示空，代表一个暂时无法确定的值，例如：无法确定一个员工手机号码，邮箱…   null是关键字，在使用这个值的时候不能加引号  

 **主键约束的列上不允许插入null**

####  2.非空约束 —— not null

 **声明了非空约束的列不允许插入null**

####  3.默认值约束 —— default

 **如果插入数据，不提供的值会使用默认值；**

 使用**<u>default</u>**关键字设置默认值

####  4.唯一约束 —— unique

 **声明了唯一约束的列上不允许出现重复的值**

 一个表中可以有多个的唯一约束，允许插入null，甚至多个null

 练习：给family的fname列添加唯一约束和非空约束，并插入数据测试

####  5.检查约束 —— check

 也称为**自定义约束**，用户可以自己指定约束条件

 create table student(

  score tinyint check(score>=0 and score<=0)

);

 ***mysql不支持检查约束，后期由JS代替***

####  6.外键约束

 声明了外键约束的列上插入的值必须在另一个表的主键列上出现过，目的是**为了确保两个表之间建立关联。允许插入null**

  **外键约束和另一个表主键的列类型保持一致**  

 **foreign key(外键列) references 另一个表(主键列)**

​                               

### **八**.**自增列**

 **auto_increment：自动增长，**如果设置了自增列，在插入编号的时候只需要赋值为null，就会获取最大值然后加1插入

  **自增列必须应用在整数形式的主键列  允许手动赋值**  

### 九.**简单查询**

####  1.查询特定的列

 示例：查询出所有员工的编号和姓名

 select eid,ename from emp;

####  2.查询所有的列

 Select eid,ename,sex,birthday,salary,deptid from emp;

 **Select * from emp;**

####  3.给列起别名

 示例：查询出所有员工的编号和姓名，使用一个字母作为别名

 select eid as a, ename as b from emp;

  **as 意思是作为，用来连接别名  as关键字可以省略，保留空格**  

####  4.显示不同的记录

 示例：查询出员工都分布在哪些部门

 select distinct deptid from emp;

####  5.查询时执行计算

 示例：计算出2+5-9+8*12

 Select 2+5-9+8*12;

####  6.查询结果排序

 示例：查询出所有的部门，结果按照编号**从小到大排**列

 Select * from dept order by did <u>asc</u>;     **#ascendant升序的**

 示例：查询出所有的部门，结果按照编号**从大到小排**列

 Select * from dept order by did **desc;**        **descendant 降序的**

  **按照字符串排列**，按照字符的编码排列  不加排序规则，默认是按照升序(asc)排列  

 示例：查询出所有员工，结果按照工资降序排列，如果工资相同，按照姓名排列

 Select * from emp order by salary desc, ename asc;

####  7.条件查询

 示例：查询出编号为10的员工

 Select * from emp where eid=10;

  **比较运算符  >    <    >=    <=    =     !=(不等于)**  

####  8.模糊条件查询

 **不明确的条件，常用于搜索**

 示例：查询出员工姓名中**含有字母e的**员工有哪些

 select * from emp where ename like '%e%';

 示例：查询出员工姓名中**以e结尾**的员工有哪些

 select * from emp where ename like '%e';

示例：查询出员工姓名中**倒数第2个字符是e的**员工有哪些

 select * from emp where ename like '%e_';

  **% 匹配任意个字母      >=0**           

  **_ 匹配任意1个字符  =1**   

**以上匹配符号必须结合like关键字使用**  

####  9.分页查询

 **查询的结果中有太多的数据，一次显示不完可以做成分页显示**

 需要有两个已知的条件：**当前的页码、每页的数据量**

  **每页开始查询的值 = (当前的页码-1)*每页的数据量**  

 **select * from emp limit 开始查询的值, 每页的数据量;**

 *示例：假设每页显示5条数据，查询出前4页每页的数据*

 *第1页：select * from emp limit 0,5;*

 *第2页：select * from emp limit 5,5;*

 *第3页：select * from emp limit 10,5;*

 *第4页：select * from emp limit 15,5;*

  **注意事项：limit后的两个值必须是数值型，不能加引号**  

### 十.**复杂查询**

####  1.聚合查询/分组查询

 示例：查询出所有员工的数量

 select count(*) from emp;

 示例：使用员工的编号列查询出数量

 select count(eid) from emp;  #**推荐使用主键列**

  **函数**：是一个功能体，需要提供若干个数据，返回结果  聚合函数  **count()/sum()/avg()/max()/min()   数量  总和   平均  最大  最小**  

 示例：查询出所有女员工的工资总和

 select sum(salary) from emp where sex=0;

 示例：查询出10号部门的平均工资

 select avg(salary) from emp where deptid=10;

 示例：查询出男员工的最低工资

 select min(salary) from emp where sex=1;

示例：查询出年龄最小员工的生日(生日的最大值)

 select max(birthday) from emp;

  **分组查询通常查询聚合函数和分组条件**  

 示例：查询出男女员工的数量、平均工资、工资总和

 select count(eid), avg(salary), sum(salary),sex from emp group by sex;

 示例：查询出各部门的工资总和，最高工资，最低工资

 select sum(salary), max(salary), min(salary), deptid from emp group by deptid;

####  2.子查询

 是多个SQL命令的组合，将一个查询的结果作为另一个的条件。

 示例：查询出高于平均工资的员工有哪些

  步骤1：查询出平均工资 —— 11125

  select avg(salary) from emp;

  步骤2：查询出工资大于11125的员工

  select * from emp where salary>11125;

  综合：

  select * from emp where salary>(select avg(salary) from emp);

#####   **year()获取日期中的年份**  

示例：查询出所有员工出生的年份  select  year(birthday) from emp;  

示例：查询出1993年出生员工  

select  * from emp where year(birthday)=1993;  

 **示例：查询出和tom同一年出生的员工有哪些**

  步骤1：查询出tom出生的年份 —— 1990

  select year(birthday) from emp where ename='tom';

  步骤2：查询出1990年出生的员工

  select * from emp where year(birthday)=1990;

  综合：

  select * from emp where year(birthday)=(select year(birthday) from emp where ename='tom') and ename!='tom';

####  3.多表查询

 **要查询的数据分别在多个表中，前提表之间已经建立了关联**

 示例：查询出所有员工的姓名及其部门名称

 select ename,dname from emp,dept where deptid=did;

 select emp.ename,<u>dept.dname</u> from emp,dept where <u>emp.deptid</u>=dept.did;

#####  (1)内连接

  select ename,dname from emp inner **join** dept **on** deptid=did;

  和之前的查询结果一致

#####  (2)左外连接

  select ename,dname from emp left **outer** join dept on deptid=did;

  显示左侧表中所有记录，先写哪个表哪个就是左

#####  (3)右外连接

  select ename,dname from emp right **outer** join dept on deptid=did;

  显示右侧表中所有记录，后写哪个表哪个就是右

  左外和右外连接中outer关键字可以省略

#####  (4)全连接

  同时显示左侧和右侧表中所有记录

  full join .. on

  **mysql不支持全连接** 

   **union all  联合后不合并相同的项**

   **union  联合后合并相同的项**

  (select ename,dname from emp left **outer** join dept on deptid=did)

  union

  (select ename,dname from emp right **outer** join dept on deptid=did);

  **解决方案：将左外和右外连接进行联合，合并相同的项。**

 

 

 

 

 