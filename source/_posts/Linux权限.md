---
title: Linux权限
categories: 操作系统
tags:
  - linux
date: 2021-11-03 11:05:09
---

# 用户

## 1.添加用户

```text
useradd [options] [name]

options:
-c comment 指定一段注释性描述。
-d 目录 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
-g 用户组 指定用户所属的用户组。
-G 用户组，用户组 指定用户所属的附加组。
-s Shell文件 指定用户的登录Shell。
-u 用户号 指定用户的用户号，如果同时有-o选项，则可以重复使用其他用户的标识号。

```
```bash
useradd -d /home/admin -m admin
```

## 2.删除用户
```text
userdel [options] [name]

options:
-r 删除同时删除用户主目录

```
```bash
userdel -r admin
```

## 3.修改用户
```text
usermod [options] [name]

options: 和useradd 一样
```
```bash
userdel -r admin
```

### 4.用户密码

```text
passwd [options] [name]

options:
-l 锁定口令，即禁用账号。
-u 口令解锁。
-d 使账号无口令。
-f 强迫用户下次登录时修改口令。


```
普通用户密码修改
```bash
passwd
```
超级用户，可以指定任何用户的口令
```bash
passwd admin 
```

# 组

### 1.添加用户组

```text
groupadd [options] [name]

options:
-g GID 指定新用户组的组标识号（GID）。
-o 一般与-g选项同时使用，表示新用户组的GID可以与系统已有用户组的GID相同。

```
添加admin 组
```bash
groupadd admin
```

### 2.删除组
```bash
groupdel  admin 
```

### 3.修改组
```bash
groupmod -g 10000 -n  admin admin1 
```

```text
-g GID 为用户组指定新的组标识号。
-o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
-n新用户组 将用户组的名字改为新名字
```