# 幻兽帕鲁 (PalWorld) Linux 服务器脚本

### 一、自动备份

> Backup.sh
> 功能: 当服务器启动后，每10分钟自动备份一次存档目录。

+ 安装 net-tools 包。

```
$ (sudo) apt install net-tools
```

+ 将 Backup.sh 放到服务器目录内。

```
# WARNING: 目录因人而异
$ cp ./Backup.sh ~/Steam/steamapps/common/PalServer
```

+ 将 Backup.sh 设置为可执行文件。

```
$ chmod +x ./Backup.sh
```

+ 将脚本文件设置为定时任务。

```
$ (sudo) crontab -e

# 在文件末尾添加以下代码，${Your_Server_Path}替换为你的服务器目录
*/10 * * * * '${Your_Server_Path}/Backup.sh'
```

### 二、监控内存结束进程

> Restart.sh
> 功能: 在服务器内存达到阈值(1024M)后，自动终止游戏进程，防止服务器崩溃。

+ 安装 net-tools 包。

```
$ (sudo) apt install net-tools
```

+ 将 Restart.sh 放到服务器目录内。

```
# WARNING: 目录因人而异
$ cp ./Restart.sh ~/Steam/steamapps/common/PalServer
```

+ 将 Restart.sh 设置为可执行文件。

```
$ chmod +x ./Restart.sh
```

+ 将脚本文件设置为定时任务。

```
$ (sudo) crontab -e

# 在文件末尾添加以下代码，${Your_Server_Path}替换为你的服务器目录
*/1 * * * * '${Your_Server_Path}/Restart.sh'
```

### 三、延迟启动服务器

> Start.sh
> 当服务器结束后立刻重启可能会导致服务器崩溃，增加延迟启动选项。

+ 将 Start.sh 放到服务器目录内。

```
# WARNING: 目录因人而异
$ cp ./Start.sh ~/Steam/steamapps/common/PalServer
```

+ 将 Start.sh 设置为可执行文件。

```
$ chmod +x ./Start.sh
```

+ 启动服务器

```
./Start.sh
```
