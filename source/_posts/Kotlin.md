---
title: Kotlin
date: 2020-10-10 14:58:17
categories:
- Android
tags: 
- android
- kotlin
---

## 函数

fun methodName(param1: Int, param2: Int): Int {
      return 0
}

单行代码函数的语法糖：fun methodName(param1: Int, param2: Int) = 0
直接将唯一的一行代码写在函数定义的尾部，中间用等号连接即可。
return关键字也可以省略，等号足以表达返回值的意思

### 逻辑控制

### if语句返回值
```
fun largerNumber(num1: Int, num2: Int): Int {
    return if (num1 > num2) {
        num1
    } else {
        num2
    }
}

//=>

fun largerNumber(num1: Int, num2: Int) = if (num1 > num2) num1 else num2

```
### when 条件语句

当需要判断的条件非常多的时候，可以考虑使用when语句来替代if语句。

```
fun getScore(name: String) = when (name) {
    "Tom" -> 86
    "Jim" -> 77
    "Jack" -> 95
    "Lily" -> 100
    else -> 0
}
```
when语句还允许进行类型匹配。
```
fun checkNumber(num: Number) {
    when (num) {
        is Int -> println("number is Int")
        is Double -> println("number is Double")
        else -> println("number not support")
    }
}
```

### 循环
val range = 0..10
表示创建了一个0到10的区间，并且两端都是闭区间，这意味着0到10这两个端点都是包含在区间中的，用数学的方式表达出来就是[0, 10]

val range = 0 until 10
表示创建了一个0到10的左闭右开区间，它的数学表达方式是[0, 10)

```
fun main() {
    for (i in 0..10) {
        println(i)
    }
}

```
跳过其中的一些元素，可以使用step关键字
```
fun main() {
    for (i in 0 until 10 step 2) {
        println(i)
    }
}
```
降序的区间，可以使用downTo关键字
```
fun main() {
    for (i in 10 downTo 1) {
        println(i)
    }
}
```

## 类

```
class Person {
    var name = ""
    var age = 0

    fun eat() {
        println(name + " is eating. He is " + age + " years old.")
    }
}

```
创建对象

```
fun main() {
    val p = Person()
    p.name = "Jack"
    p.age = 19
    p.eat()
}

```
Kotlin类可以被继承，需要主动声明open关键字
```
open class Person {
    …
}

要让另一个类去继承Person类，则需要使用冒号关键字：

class Student : Person() {
    var sno = ""
    var grade = 0
}
```

## 接口

```
interface Study {
    fun readBooks()
    fun doHomework()
}

Kotlin中实现接口的关键字变量了冒号，和继承使用的是同样的关键字：

class Student(val name: String, val age: Int) : Study {
    override fun readBooks() {
        println(name + " is reading.")
    }
    override fun doHomework() {
        println(name + " is doing homework.")
    }
}
```

### 数据类
data关键字可以定义一个数据类
```
data class Cellphone(val brand: String, val price: Double)

```
Kotlin会根据数据类的主构造函数中的参数将equals()、hashCode()、toString()等固定且无实际逻辑意义的方法自动生成，从而大大简少了开发的工作量。

### 单例类
object关键字可以定义一个单例类
```
object Singleton {
    fun singletonTest() {
        println("singletonTest is called.")
    }
}

```
调用单例类中的函数比较类似于Java中静态方法的调用方式
Singleton.singletonTest()

## Lambda

### 集合

始化一个集合

```
val list = listOf("Apple", "Banana", "Orange", "Pear", "Grape")
val set = setOf("Apple", "Banana", "Orange", "Pear", "Grape")
val map = mapOf("Apple" to 1, "Banana" to 2, "Orange" to 3, "Pear" to 4, "Grape" to 5)
```

Lambda表达式的语法结构：
{参数名1: 参数类型, 参数名2: 参数类型 -> 函数体}

首先最外层是一对大括号，如果有参数传入到Lambda表达式中的话，我们还需要声明参数列表，参数列表的结尾使用一个->符号，表示参数列表的结束以及函数体的开
始，函数体中可以编写任意行代码，并且最后一行代码会自动作为Lambda表达式的返回值。

集合中的map函数是最常用的一种函数式API，它用于将集合中的每个元素都映射成一个另外的值，映射的规则在Lambda表达式中指定，最终生成一个新的集合。比如，
这里我们希望让所有的水果名都变成大写模式，就可以这样写：

fun main() {
    val list = listOf("Apple", "Banana", "Orange", "Pear", "Grape", "Watermelon")
    val newList = list.map({ fruit: String -> fruit.toUpperCase() })
    for (fruit in newList) {
        println(fruit)
    }
}
- 当Lambda参数是函数的最后一个参数时，可以将Lambda表达式移到函数括号的外面。

- 如果Lambda参数是函数的唯一一个参数的话，还可以将函数的括号省略。

- 由于Kotlin拥有出色的类型推导机制，Lambda表达式中的参数列表其实在大多数情况下也`不必声明参数类型`。

- 当Lambda表达式的参数列表中只有一个参数时，也不必声明参数名，而是可以使用`it`关键字来代替。

因此，Lambda表达式的写法可以进一步简化成如下方式：

val newList = list.map { it.toUpperCase() }

### 空指针

Kotlin中引入了一个可空类型系统的概念，它利用编译时判空检查的机制几乎杜绝了空指针异常。

```
fun doStudy(study: Study) {
    study.readBooks()
    study.doHomework()
}

```

这段代码实际上它是没有空指针风险的，因为Kotlin默认所有的参数和变量都不可为空，所以这里传入的Study参数也一定不会为空，可以放心地调用它的任何函数。

Kotlin提供了另外一套可为空的类型系统，就是在类名的后面加上一个问号。比如，Int表示不可为空的整型，而Int?就表示可为空的整型；String表示不可为空的字符串，而String?就表示可为空的字符串。

使用可为空的类型系统时，需要在编译时期就把所有的空指针异常都处理掉才行。


Kotlin提供了一系列的辅助工具，使开发者能够更轻松地进行判空处理。


?. 操作符表示当对象不为空时正常调用相应的方法，当对象为空时则什么都不做。比如：

if (a != null) {
    a.doSomething()
}

这段代码使用?.操作符就可以简化成：

a?.doSomething()

?: 操作符表示如果左边表达式的结果不为空就返回左边表达式的结果，否则就返回右边表达式的结果。比如：

val c = if (a ! = null) {
    a
} else {
    b
}

这段代码的逻辑使用?:操作符就可以简化成：

val c = a ?: b

### 字符串

Kotlin中字符串内嵌表达式的语法规则如下：

"hello, ${obj.name}. nice to meet you!"

当表达式中仅有一个变量的时候，还可以将两边的大括号省略：

"hello, $name. nice to meet you!"

### 参数默认值

```
fun printParams(num: Int, str: String = "hello") {
    println("num is $num , str is $str")
}

```