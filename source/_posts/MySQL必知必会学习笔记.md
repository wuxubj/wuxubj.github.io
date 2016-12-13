---
title: 《MySQL必知必会》学习笔记
date: 2016-07-19 20:56:50
categories:
- 数据库
tags:
- mysql
permalink: mysql-learning-notes
copyright: true
---
![mysql](http://images.wuxubj.cn/201607/mysql_title.jpg)
[《MySQL必知必会》](https://book.douban.com/subject/3354490/)是MySQL入门书籍，本文是阅读该书的一些学习笔记，主要记录相关知识要点。
<!--more-->
### 第三章 使用MySQL
<div class="codecopy codecopy1"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
msql -u username -p -h myserver -P port //连接数据库
USE database_name //打开数据库
SHOW DATABASES //显示可用数据库列表
SHOW TABLES //返回数据库中数据表的列表
SHOW COLUMNS FROM table_name //显示表中字段信息
自动增量的定义
```
</div>

### 第四章 检索数据
<div class="codecopy codecopy2"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy2 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT field_name FROM table_name;
//从表中检索选定的列

SELECT field_name1，field_name2 FROM table_name;
//从表中检索多列

SELECT * FROM table_name;
//检索表中所有列

SELECT DISTINCT field_name FROM table_name;
//从表中检索选定的列(消除重复行)

SELECT field_name FROM table_name LIMIT lines;
//返回检索结果的前几行

SELECT field_name FROM table_name LIMIT strat_pos,lines;
//返回检索结果中，从第strat_pos行开始的lines行

SELECT products.prod_name FROM crashcourse.products;
//使用完全限定的表名(功能与第一个用法相同)
```
</div>

### 第五章 排序检索数据
<div class="codecopy codecopy3"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy3 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT prod_name FROM products 
ORDER BY prod_id;
//对prod_name列，以prod_id的字母顺序排列数据

SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_prices,prod_name;
//通过多列数据对结果排序（首先依据prod_prices排序，
//prod_prices相同时，再依据prod_name排序）

SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_prices DESC,prod_name;
//以prod_prices降序，prod_name升序排列数据，mysql默认升序排列，
//如果想同时以prod_name降序排列，需要在prod_name后也加上DESC,
//因为DESC关键字只应用到直接位于其前面的列名上。

SELECT prod_price
FROM products
ORDER BY prod_prices DESC
LIMIT 1；
//找出一个列中最高的值
```
</div>**Tips：**
1.mysql默认升序排列数据
2.DESC关键字只应用到直接位于其前面的列名上，根据多列降序，则每列都要加上DESC关键字
3.ORDER BY子句必须是SELECT语句中的最后一条子句（一个子句通常由一个**关键字**和所提供的**数据**组成，FROM products是子句，ORDER BY prod_prices也是子句，但DESC和LIMIT&nbsp;1不是子句）。

### 第六章 过滤数据
<div class="codecopy codecopy4"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy4 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT prod_name,prod_price
FROM products
WHERE prod_name='fuses';
//返回prod_name的值为Fuses的一行。

SELECT prod_name,prod_price
FROM products
WHERE prod_price<=10;
//列出价格小于或等于10美元的所有产品

SELECT prod_name,prod_price
FROM products
WHERE prod_price BETWEEN 5 AND 10;
//检索价格在5美元和10美元之间的所有产品(包括5和10)

SELECT cust_id
FROM customers
WHERE cust_email IS NULL;
//返回没有email的顾客id
```
</div>**Tips：**
1.mysql的where子句支持的操作符有=，!=,<,<=,>,>=,BETWEEN
2.未知具有特殊的含义，数据库不知道它们是否匹配，所以在匹配过滤或不匹配过滤时都不返回它们。

### 第七章 数据过滤
<div class="codecopy codecopy5"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy5 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT prod_id,prod_price,prod_name
FROM products
WHERE vend_id=1003 AND prod_price <=10;
//检索由供应商1003制造且价格小于等于10美元的所有产品

SELECT prod_name,prod_price
FROM products
WHERE vend_id=1002 OR vend_id=1003;
//检索供应商1002和1003制造的所有产品

SELECT prod_name,prod_price
FROM products
WHERE (vend_id=1002 OR vend_id=1003) AND prod_price>=10;
//检索价格为10美元（含）以上且由1002或1003制造的所有产品
//SQL在处理OR操作符前，优先处理AND操作符，所以上面的括号不能少，
//否则将得不到想要的结果

SELECT prod_name,prod_price,vend_id
FROM products
WHERE vend_id IN(1002,1003)
ORDER BY prod_name;
//检索供应商1002和1003制造的所有产品

SELECT prod_name,prod_price
FROM products
WHERE vend_id NOT IN(1002,1003)
ORDER BY prod_name;
//检索1002和1003之外供应商制造的所有产品
```
</div>**Tips：**
1.SQL在处理OR操作符前，优先处理AND操作符，使用()控制优先级
2.IN操作符完成与OR相同的功能，但IN操作执行更快，而且IN中还可以包含其他SELECT语句，使得能够更动态地建立WHERE子句
3.WHERE子句中的NOT操作符有且只有一个功能，那就是否定它之后所跟的任何条件
4.MySQL仅支持使用NOT对IN、BETWEEN和EXISTS子句取反。

### 第八章 用通配符进行过滤
<div class="codecopy codecopy6"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy6 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE '%anvil%';
//匹配任何包含文本anvil的值

SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE '_ ton anvil';
//_只能匹配一个字符
```
</div>**Tips：**
1.为在搜索子句中使用通配符，必须使用LIKE操作符；
2.通配符``%``可以匹配0个、1个或多个字符，但不能匹配NULL；
3.通配符``_``总是匹配一个字符，不能多也不能少；
4.不要过度使用通配符，通配符搜索的处理一般要比前面讨论的其他搜索所花时间更长；
5.把通配符置于搜索模式的开始处，搜索起来是最慢的。

### 第九章 用正则表达式进行搜索
<div class="codecopy codecopy7"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy7 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
SELECT prod_name
FROM products
WHERE prod_name LIKE '1000'
ORDER BY prod_name;
//匹配完整串1000

SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000'
ORDER BY prod_name;
//匹配子串1000

SELECT prod_name
FROM products
WHERE prod_name REGEXP '.000'
ORDER BY prod_name;
//.匹配任意一个字符

SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000|2000'
ORDER BY prod_name;
// |为正则表达式的OR操作符,它表示匹配其中之一，
// 因此1000和2000都匹配并返回

SELECT prod_name
FROM products
WHERE prod_name REGEXP '[123] Ton';
//匹配几个字符之一

SELECT prod_name
FROM products
WHERE prod_name REGEXP '[^123] Ton';
//匹配123以外的几个字符之一

SELECT prod_name
FROM products
WHERE prod_name REGEXP '[1-5] Ton';
//匹配范围，常见范围：[1-9],[a-z]，[a-zA-Z0-9]

SELECT prod_name
FROM products
WHERE prod_name REGEXP '\\([0-9] sticks?\\)';
// 双斜杠\\为转义字符，sticks?匹配stick和sticks

SELECT prod_name
FROM products
WHERE prod_name REGEXP '[[:digit:]]{4}';
// 匹配连在一起的任意4位数字
// [:digit:]代表数字集合，{4}要求它前面的字符出现4次

SELECT prod_name
FROM products
WHERE prod_name REGEXP '^[0-9\\.]';
//找出以数字或小数点开始的所有prod_name
//
```
</div>**Tips：**
1.LIKE和REGEXP的不同在于，LIKE匹配整个串而REGEXP匹配子串；
2.MySQL中的正则表达式匹配（自版本3.23.4后）不区分大小写（即，大写和小写都匹配）。为区分大小写，可使用BINARY关键字，如``WHERE prod_name REGEXP BINARY 'JetPack .000'``；
3.``^``有两种用法。在集合中（用[和]定义），用它来否定该集合，否则，用来指串的开始处。

### 第十章 创建计算字段
<div class="codecopy codecopy8"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy8 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
mysql> SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')')
    -> AS vend_title
    -> From vendors
    -> ORDER BY vend_name;
+------------------------+
| vend_title             |
+------------------------+
| ACME(USA)              |
| Anvils R Us(USA)       |
| Furball Inc.(USA)      |
| Jet Set(England)       |
| Jouets Et Ours(France) |
| LT Supplies(USA)       |
+------------------------+
//拼接字段并使用别名

mysql> SELECT prod_id,quantity,item_price,
    -> quantity*item_price AS expanded_price
    -> FROM orderitems
    -> Where order_num = 20005;
+---------+----------+------------+----------------+
| prod_id | quantity | item_price | expanded_price |
+---------+----------+------------+----------------+
| ANV01   |       10 |       5.99 |          59.90 |
| ANV02   |        3 |       9.99 |          29.97 |
| TNT2    |        5 |      10.00 |          50.00 |
| FB      |        1 |      10.00 |          10.00 |
+---------+----------+------------+----------------+
//执行计算字段
```
</div>**Tips：**
1.Concat()函数用于拼接多个字段；
2.RTrim()函数去掉串右边的空格，LTrim()函数去掉串左边的空格，Trim()函数去掉串左右两边的空格；
3.AS(alias)关键字，为字段赋予别名。

### 第十一章 使用数据处理函数
<div class="codecopy codecopy9"> ```sql <i class="fa fa-clipboard" data-clipboard-target=".codecopy9 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
mysql> SELECT vend_name,Upper(vend_name) AS vend_name_upcase
    -> FROM vendors
    -> ORDER BY vend_name;
+----------------+------------------+
| vend_name      | vend_name_upcase |
+----------------+------------------+
| ACME           | ACME             |
| Anvils R Us    | ANVILS R US      |
| Furball Inc.   | FURBALL INC.     |
| Jet Set        | JET SET          |
| Jouets Et Ours | JOUETS ET OURS   |
| LT Supplies    | LT SUPPLIES      |
+----------------+------------------+
//文本处理函数

SELECT cust_id,order_num
FROM orders
WHERE Date(order_date)='2005-09-01';
//日期和事件处理函数
//检索order_date为2005-09-01的订单记录

SELECT cust_id,order_num
FROM orders
WHERE Date(order_date) BETWEEN '2005-09-01' AND '2005-09-30';
// 日期和事件处理函数
// 检索2005年9月下的所有订单

SELECT cust_id,order_num
FROM orders
WHERE Year(order_date)=2005 AND Month(order_date)=9;
// 日期和事件处理函数
// 检索2005年9月下的所有订单
```
</div>**Tips：**
1.三种数据处理函数：文本处理、日期和时间处理、数值处理。