---
title: 操作系统中 heap 和 stack 的区别
date: 2020-10-09 09:47:28
categories: 计算机基础
tags: 
- 堆栈
---

## 基本概念

堆栈是两种数据结构，是一种数据项按序排列的数据结构，只能在一端进行插入删除操作。
堆：队列优先，先进先出。
栈：先进后出。

## 区别（操作系统）

1. 空间分配

堆：一般由程序员分配释放，若程序员不释放，程序结束时可能由os回收，分配方式；类似于链表。
栈：由操作系统自动释放，存放函数的参数值、局部变量的值等，类似于数据结构中的栈。

2. 缓存方式
堆：二级缓存，生命周期由虚拟机的垃圾回收算法来决定。
栈：一级缓存，被调用时处于存储空间中，调用完毕立即释放。

3.数据结构
堆：树
栈：先进后出

## 区别（Java）

