---
title: mongo笔记
date: 2020-09-29 17:01:43
tags:
---
## 数据备份
mongodump /h 10.1.56.74 /port 27017   /d JHQDB /o ./

## 数据恢复
 mongorestore.exe -h localhost:27017 -d JHQDB d:\mongo\localdate\JHQDB 

##数据导出
mongoexport /h 10.11.36.66 /port 27017 /d VISITORDB /o register_record.json /c register_record


## 数据库
use test
db
show dbs
db.dropDatabases()
db.colllection.drop()
## curd
db.user.insert("name":"a","age":"23")
db.user.find()
可以将数据定义为变量
userb=({"name":"b","age":"34"});
db.user.insert(userb)
删除
db.user.remove({"name":"a"})
删除所有
db.user.remove({})
格式化显示
db.user.find().pretty()、



## 聚合

mongodb 中聚合（aggregate）主要用于处理数据（诸如统计平均值求和等），并返回计算后的处理结果。



### 语法

db.collection.aggregate(aggregate_options)



| 表达式 | 描述     | 实例                                            |
| ------ | -------- | ----------------------------------------------- |
| $sum   | 计算总和 | db.mycol.aggregate([{$group:{_id:"$by_user"}}]) |



## 练习

### 数据

```js
db.user.insert({"name":"qlq1","age":20,"sex":"男"})

db.user.insert({"name":"qlq2","age":22,"sex" :"男"})

db.user.insert({"name":"qlq3","age":23,"sex":"女"})

db.user.insert({"name":"qlq4","age":24,"sex":"女"})
```

`使用方法：使用管道过滤数据之后利用表达式对数据进行操作：`

- 测试分组与管道表达式:$group 分组统计

  ##### 1. 按性别分组，并统计男女人数

  ```javascript
  db.user.aggregate([{$group:{_id:"$sex",num:{$sum:1}}}])
  ```

  解释:_id:"$sex"表示按sex属性分组，$sum表示求和，如果$sum:1就相当于count(*)，一行记录算一个

  ##### 2. 按性别分组，计算年龄和

  ```
  db.user.aggregate([{$group:{_id:"$sex",num:{$sum:"$age"}}}])
  ```

  ##### 3. 按性别分组，并拿到每个组的第一个年龄

  ```javascript
  db.user.aggregate([{$group:{_id:"$sex",num:{$first:"$age"}}}])
  ```

  ##### 4. 先按性别分组，分完组之后将age属性映射到数组中

  ```
  db.user.aggregate({$group:{_id:"$sex",num:{$push:"$age"}}})
  ```

  `如果是将所有列都添加到数组中用 $push:$$ROOT`

  ```
  db.user.aggregate([{$group:{_id:"$sex",num:{$push:"$$ROOT"}}}])-
  ```

  - $match :类似于find，只是find不能统计，现在可以过滤并统计

  ##### 1. 查询年龄大于23小于等于50的

    ```
db.user.aggregate([{$match:{age:{$gt:23,$lt:50}}}])
    ```
  
  
  
  