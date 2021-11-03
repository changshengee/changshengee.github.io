---
title: Cmake 指令
date: 2020-01-304 15:58:02
categories: c/c++
tags: 
- c/c++
- linux
---

## 二进制，是计算机处理数据的基础

内存条是一个非常精密的部件，包含了上一个电子元器件，它们很小，达到了纳米级别。这些元器件实际上就是电路。电路的电压会变化，要么0V，要么5V。只有这
两种电压。5V是通电，用1来表示，0V是断电，用0来表示。所以，一个元器件有两种状态，0和1.
我们通过电路来控制这些元器件的通断电，会得到很多0,1的组合。例如8个元器件，有2^8=256种不同组合。给组合赋予定义，则构成了值。

一般情况下我们不一个一个使用元器件，而是将8个元器件看做一个单位。1表示为0000001；

一个元器件称为1个比特（bit）,8个元器件称为一字节（byte），以此类推。1024个字节为1kb；。。。

## 指令

### PROJECT

PROJECT(projectname [CXX][C][JAVA])
用于定义工程名称，并可以指定工程支持的语言。支持的语言列表是可以忽略的，默认情况表示支持所有语言。
这个指令隐式的定义了两个cmake 变量：<projectname>_SOURCE_DIR 、<projectname>_BINARY_DIR.
同时cmake系统也帮我们预定义了PROJECT_SOURCE_DIR 以及 PROJECT_BINARY_DIR

### SET

SET(VAR[VALUE][CACHE TYPE DOCSTRING[FORCE]])
显式的定义变量

### MESSAGE

MESSAGE([SEND_ERROR|STATUS|FATAL_ERROR]"message to display")

输出信息
- SEND_ERROR ,产生错误，生成过程被跳过。
- STATUS ,输出前缀为1的信息。
- FATAL_ERROR,立即终止所有的cmake过程。

### ADD_EXECUTABLE

ADD_EXECUTABLE(hello,)