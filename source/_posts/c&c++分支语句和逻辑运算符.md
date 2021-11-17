---
title: C++ 分支语句和逻辑运算符
categories:
  - c/c++
tags:
  - c/c++
date: 2021-11-17 12:16:19
---

1. 请看下面两个计算空格和换行符数目的代码片段:
// Version 1 
```c++
while (cin.get(ch)) // quit on eof
{
  if (ch == ' ')
    spaces++;
  if (ch == '\n') 
    newlines++;
}
// Version 2
while (cin.get(ch)) // quit on eof
(
  if (ch == ' ')
    spaces++; 
  else if (ch == '\n') 
    newlines++;
}
```
第二种格式比第一种格式好在哪里呢？

else if 在 判断了 if 为 true 后不会再执行，而第一种还会执行一次判断

2. 在程序清单6.2中，用 ch+1替换++ch将发生什么情况呢?

++ch 字符串打印，而 ch+1 数字输出

3. 请认真考虑下面的程序：
```c++
#include <iostream>
using namespace std; int main()
{
  char ch; 
  int ctl, ct2;
  ctl = ct2 = 0;
  while ((ch = cin.get()) != '$')
  {
    cout << ch;
    ctl++; 
    if (ch = '$') 
      ct2++; 
    cout << ch;
  }
  cout << "ctl = " << ctl << "， ct2 = " << ct2 << "\n";
  return 0;
} 
```
假设输入如下（请在每行末尾按回车键）：
Hi!
Send $10 or $20 now!
则输出将是什么（还记得吗，输入被缓冲）？

H$i$!$
S$e$n$d$ $ctl = 9, ct2 = 9

4. 创建表示下述条件的逻辑表达式：
a. weight大于或等于115,但小于125。 
b. ch 为 q 或 Q。
c. x 为偶数，但不是26。 
d. x 为偶数，但不是26的倍数。
e. donation 为 1000-2000 或 guest 为 1。
f. ch 是小写字母或大写字母（假设小写字母是依次编码的，大写字母也是依次编码的，但在大小写 字母间编码不是连续的）。

a. weight>=115 && weight <125
b. ch=='q' || ch=='Q'
c. x%2=0 && x!=26
d. x%2==0 && x%26!=0
e. (donation>=1000 && donation<=20000) || guest==1
f. (ch >='a' && ch <='z') || (ch >='A' && ch <='Z')

5. 在英语中，“I will not not speak （我不会不说）"的 意 思 与 "I will speak （我要说）”相同。在 C++
中，!!x是否与x 相同呢？ 

不相同 x 为非布尔值时候不一定相同

6. 创建一个条件表达式，其值为变量的绝对值。也是说，如果变量x 为正，则表达式的值为x;但如 果X为负，则表达式的值为-X—— 这是一个正值。
x<0?-x:x;

7. 用 switch改写下面的代码片段：
```c++
if (ch == 'A') 
  a_grade++;
else if (ch == 'B')
  b_grade++; 
else if (ch == 'C')
  c_grade++ ;
else if(ch == 'D')
 d_grade++;
else
  f_grade-++;
```

```c++

switch (ch){
  case 'A':
    a_grade++;
    break;
  case 'B':
    b_grade++;
    break;
  case 'C':
    c_grade++;
    break;
  case 'D':
    d_grade++;
    break;
  default:
    f_grade++;
    break;
}

```


8. 对于程序清单6.10,与使用数字相比，使用字符（如a 和 c） 表示菜单选项和case标签有何优点呢？ 想想用户输入q 和输入5 的情况。）





9. 请看下面的代码片段：
```c++
int line = 0;
char ch;
while(cin.get(ch))
{
  if (ch == 'Q') 
    break; 
  if (ch !='\n')
    continue;
  line++;
}
```
请重写该代码片段，不要使用break和 continue语句。
```c++
int line = 0;
char ch;
while(cin.get(ch)&& ch!='Q')
{
  if(ch =='\n')
    line++;
}
```