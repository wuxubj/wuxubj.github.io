---
title: C++中的const
copyright: true
date: 2016-12-20 19:37:26
categories:
- 编程语言语法
tags:
- C++
- const
permalink: const-in-cpp
---
## 1.基本概念
``const``限定符用于定义值不能被改变的变量。
```
const int bufSize = 512;
```
把``bufSize``定义成为一个常量，定义之后不允许重新对``bufSize``赋值。
const 对象一旦创建之后其值就不能再改变，所以 const 对象必须初始化。初始值可以是任意复杂的表达式：

<!--more-->
```
const int i = get_size();//正确：运行时初始化
const int j = 42; //正确：编译时初始化
const int k; //错误：未初始化
```
在 const 类型的对象上，只能执行不改变其内容的操作，可以用一个非 const 对象去初始化一个 const 对象：
```
int i = 42;
const int ci = i; //正确：i的值拷贝给了ci
int j = ci; //正确：ci的值拷贝给了j
```
拷贝一个对象的值并不会改变它，一旦拷贝完成，新的对象和原来的对象就没什么关系了。

## 2 const 的引用（常量引用）
把引用绑定到 const 对象上，称之为对常量的引用。常量只能绑定到 const 引用，而不能绑定到非 const 引用。
```
const int ci = 42;
const int &r1 = ci;
```
允许为一个常量引用绑定到非常量的对象：
```
int i = 42;
const int &r1 = i*2;
const int &r2 = 42;
```
常量引用仅对引用可参与的操作做出了限定，对于引用的对象本身是不是一个常量未做限定。
以上声明中``i``的值可变，只是不允许通过``r1``修改``i``的值。


## 3 指针和 const
与引用一样，可以令指针指向常量或非常量。
### 3.1 指向常量的指针
指向常量的指针，不能用于改变其所指对象的值，要想存放常量对象的地址，只能使用指向常量的指针。
```
const double pi = 3.14;
double *ptr = &pi; //错误：ptr是一个普通指针
const double *cptr = &pi; //正确：cptr是一个指向常量的指针
*cptr = 42; //错误：不能用指向常量的指针改变其所指对象的值
```
允许一个指向常量的指针指向一个非常量对象：
```
double dval = 3.14;
cptr = &dval;//正确
```
``dval``的值可以改变，只是不能通过``cptr``改变``dval``的值。
另外，指向常量的指针中，指针的值可以改变，即可以令指向常量的指针指向另外一个对象，如上例中``cptr``。

### 3.2 const 指针
指针是对象，而引用不是，因此允许把指针定为常量，即常量指针（const指针）。
常量指针必须初始化，而且一旦初始化完成，其值（存放在指针中的那个地址）就不能改变。
```
int errNumb = 0;
int *const curErr = &errNumb; //正确：curErr将一直指向errNumb
*curErr = 3; //正确：可以通过常量指针修改其所指对象的值
```
可以通过常量指针修改其所指（非常量）对象的值。

### 3.3 顶层 const和底层const
顶层 const 表示指针本身是一个常量，底层 const 表示指针所指对象是一个常量。
更一般的，顶层 const 可以表示任意的对象是常量，底层 const 则与指针和引用等复合类型的基本类型部分有关。
```
int i = 0;
int *const p1 = &i; //顶层const,不能改变p1的值
const int ci = 42; //顶层const,不能改变ci的值
const int *p2 = &ci; //底层const,允许改变p2的值
const int &r = ci; //用于声明引用的const都是底层const
```

## 4 const在函数中的应用
### 4.1 顶层const与拷贝形参
当用实参初始化形参时会忽略形参的顶层 const，当形参有顶层 const 时，传给它常量对象或非常量对象都是可以的。
```
void fcn(const int i){/* fcn能够读取i,但不能改变i的值 */}
```
调用``fcn``时，既可以传入``const int``也可以传入``int``。忽略形参顶层 const 可能带来意想不到的错误：
```
void fcn(const int i){/* fcn能够读取i,但不能改变i的值 */}
void fcn(int i) {/**/} //错误：重复定义了fcn(int)
```
同时定义2个函数时，会出现函数重复定义。
同理，同时定义以下2个函数也会产生重复定义：
```
void fcn(int *i){};
void fcn(int *const ci){}; //重复定义了fcn(int *)
```
示例：以下函数嵌套调用并不会出错，因为顶层 const 形参被忽略：
<div class="codecopy codecopy1"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy1 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
double multi(double a,double b)
{
	return a*b;
}
double getValue(const double a,const double b)
{
	return multi(a,b);
}
int main()
{
	double x = 1.2, y = 2.3;
	cout<<getValue(x,y)<<endl;
	return 0;
}
```
</div>
### 4.2 底层const与指针和引用形参
如果形参是某种类型的指针或引用，则通过区分其指向的是常量对象还是非常量对象，可以实现函数重载。
此时的 const 是底层的：
```
void fcn(int &i);
void fcn(const int &i);
void fcn(int *ptr);
void fnc(const int *ptr);
```
以上为4个独立的重载函数。

const 对象只能传递给 const 形参，非 const 对象虽然能够转换成 const，但是编译器会优先选择非常量版本的函数。

### 4.3 返回const
函数可以返回 const 对象：
<div class="codecopy codecopy2"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy2 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
const string &shorterString(const string &s1,const string &s2)
{
	return s1.size() <= s2.size() ? s1 : s2;
}
```
</div>主要用于形参是 const，同时又要返回形参的情况。

## 5 const在类中的应用
### 5.1 const成员函数
在对象中，因为``this``总是指向这个对象，所以``this``是一个常量指针，我们不允许改变``this``中保存的地址。

默认情况下，``this``的类型是指向类类型非常量版本的常量指针，例如``Sales_data``成员函数中，``this``的类型是``Sales_data *const``，``this``中保存的地址不能变，但是可以通过``this``改变对象的值。因此默认情况下，我们不能把``this``绑定到一个常量对象上，这就使得我们不能在一个常量对象上调用普通的成员函数。

为了把``this``声明为指向常量的指针，需要把 const 关键字放在成员函数参数列表之后，像这样使用 const 的成员函数称为**常量成员函数**。
```
string Sales_data::isbn() const {return bookNo;}
```
等价于：
```
string Sales_data::isbn(const Sales_data *const this) {return bookNo;}
```
``isbn()``可以读取调用它的对象的数据成员，但是不能改变其数据成员的值。
常量对象以及常量对象的引用或指针只能调用常量成员函数。

> const 成员函数主要应用于： 
> * 调用该成员函数的对象是常量对象，则其只能调用常量成员函数;
> * 不希望改变调用该成员函数的对象的值，也需要将其设为常量成员函数。

可以根据是否是 const 成员函数，对成员函数进行重载：
<div class="codecopy codecopy3"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy3 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
class Screen{
public:
	Screen &display(ostream &os)
		{do_display(os);return *this;}
	const Screen &display(ostream &os) const
	{do_display(os);return *this;}

private:
	void do_display(ostream &os) const {os<<contents;}
	string contents;
}
```
</div>在非常量版本的 display 成员函数中，``this``指向一个非常量对象，返回一个非常量的引用，而在常量版本的 display 成员函数中，``this``指向一个常量对象，返回一个常量引用。

虽然非常量对象也可以调用常量成员函数，但在存在非常量成员函数的情况下，编译器还是会优先选择非常量版本的成员函数。

### 5.2 const成员函数嵌套调用
const 成员函数若要调用类内其他成员函数，则被调用的其他成员函数也必须为常量成员函数。例如，以下代码编译时会报错：
<div class="codecopy codecopy4"> ```cpp <i class="fa fa-clipboard" data-clipboard-target=".codecopy4 .code pre" aria-label="复制成功！" title="点击复制代码"></i>
class Screen{
public:
	void display(ostream &os) const
	{do_display(os);}

private:
	void do_display(ostream &os)  {os<<contents;}
	string contents;
}
```
</div>编译时报错：``cannot convert 'this' pointer from 'const Screen' to 'Screen &'.`` 因为 const 成员函数的 const 为底层 const ，其 const 对象无法转换为非 const 对象。



---








