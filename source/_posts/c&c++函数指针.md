---
title: c&c++函数指针
categories:
  - c/c++
tags:
  - c/c++
date: 2021-11-17 12:16:19
---

1. 使用函数的三个步骤:
- 提供函数定义
- 提供函数原型
- 调用函数

2.请创建与下面的描述匹配的原型：
a. igor() 没有参数，且没有返回值
```c++
void Igor();
```
b. tofu()，接收一个int 参数，并返回一个float
```
float tofu(int a);

```
c. mpg(),接收两个double 参数，并返回double

```
double mpg(double a,double b);
```
d. summation() 将long 数组名数组长度作为参数，并返回一个long 值
```
long summation(long[] a,long b);
```
e. doctor()接收一个字符串参数（不能修改该字符串），并返回一个double 值
```
double doctor(const char * a);

```
f. ofcourse()将boss 结构作为参数，不返回值

```
void ofcourse(boss bs);
```
g. plot 将map结构的指针作为参数，并返回一个字符串

```
string plot(map *m);
```

3.编写一个接受3 个参数的函数：int数组名、数组长度和一个int值，并将数组的所有元素都设置为该int值。

```c++
void test(int a[],int len,int val){
  for(int i=0;i<len;i++){
    a[i]=val;
  }
}
```

4.编写一个接受3个参数的函数：指向数组区间中第一个元素的指针、指向数组区间最后一个元素后 面的指针以及一个int值，并将数组中的每个元素都设置为该int值。

```


```