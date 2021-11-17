---
title: C++ 复合结构
categories:
  - c/c++
tags:
  - c/c++
date: 2021-11-03 23:16:19
---

## 数组

## string

## 结构

### 结构数组

### 结构中的位字段
### 共用体

每次只能存储一个值，长度为最大成员的长度。

```c++
union one4all{
  int ina_val;
  long long_val;
  double double;
}

```
可以使用 one4all 变量来存储int、long、或 double,条件是在不同的时间进行。

```
one4all pail;
pail.int_val=15; //store a int
pail.double_val=234.23; // store a double ,int value is lost
```

匿名共用体;

```
struct widget{
    char brand[20];
    int type;
    union{
      id_num;
      id_char;
    };
};

...
widget prize;
...

prize.id_num=123;

```

由于共用体是匿名的，所以id_num和id_char被视为prize的两个成员。

### 枚举

```
enum type{cicle,pace,smile}
```
### 指针和自由空间

存储数据时必须跟踪的三种属性：
- 信息存储在何处
- 存储的值为多少
- 存储的信息是什么类型

（声明、指针）  

&: 取地址运算符
*: 解除引用

指针在大多数系统上占据8个字节。

一定要在对指针解除引用运算符之前，将指针初始化为一个确定的、适当的地址。

指针不是整型

##### 4.8.4 c++中使用new来分配内存

为一个数据对象获得并分配内存的通用格式茹如下：
typeNmae * pointer_name = new typeName

必须声明指针所指向的类型的原因：
- 地址本身只指出了对象存储地址的开始，而没有指出其类型（使用的字节数）。
- 指向int 指针的长度和指向double 指针的长度相同，他们都是地址，但 new 出的指针若不加类型则使用时候指针不知道从内存中取出多少合适。


声明存储在栈中，new存储在堆中

使用 delete 释放内存

##### 4.8.5

- 自动存储：函数内部常规变量,函数调用时产生，函数结束时消亡。通常存储在栈中，后进先出释放变量。
- 静态存储：程序执行期间都存在，关键字static声明或者在函数外面定义。
- 动态存储：new + delete

#### 4.10 数组替代

c++98 vector；c++11 array；



