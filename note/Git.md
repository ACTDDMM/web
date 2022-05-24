# **Git**

## 1.本地连接远程仓库

```
　　初始化仓库：git init

　　建立连接：git remote add origin 远程仓库地址

　　远程仓库pull到本地：git pull origin master
```



## 2.git中常用的概念

工作目录：是一个目录，用于保存项目中的文件

暂存区：是内存中的一个区域，用于临时存储文件的修改

Git仓库：是一个特殊的目录，保存项目中所有的文件及每次修改的记录



## 3.git常用命令

| 命令               | 说明                                     |
| ------------------ | ---------------------------------------- |
| `git init`         | 初始化仓库                               |
| `git clone`        | 拷贝一份远程仓库，也就是下载一个项目。   |
| `git add`          | 添加文件到暂存区                         |
| `git status`       | 查看仓库当前的状态，显示有变更的文件。   |
| `git diff`         | 比较文件的不同，即暂存区和工作区的差异。 |
| `git commit`       | 提交暂存区到本地仓库。                   |
| `git reset`        | 回退版本。                               |
| `git rm`           | 删除工作区文件。                         |
| `git mv`           | 移动或重命名工作区文件。                 |
| `git log`          | 查看历史提交记录                         |
| `git blame <file>` | 以列表形式查看指定文件的历史修改记录     |
| `git remote`       | 远程仓库操作                             |
| `git fetch`        | 从远程获取代码库                         |
| `git pull`         | 下载远程代码并合并                       |
| `git push`         | 上传远程代码并合并                       |

```
例：
$ git add .  # 添加所有操作到工作目录
$ git commit -m "本次提交的内容描述"  #提交到暂存区
$ git push origin master    # 推送到 Github
$ git pull origin master  # 从git仓库中更新内容
```

