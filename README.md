# Linux

- [Linux](#linux)
  - [WSL](#wsl)
    - [查看可用发行版列表](#查看可用发行版列表)
    - [安装指定发行版](#安装指定发行版)
    - [卸载指定发行版](#卸载指定发行版)
    - [从本地文件安装分发版](#从本地文件安装分发版)
  - [Debian](#debian)
    - [Reinstall](#reinstall)
    - [USTC Mirror](#ustc-mirror)

## WSL

[Windows Subsystem for Linux 文档](https://learn.microsoft.com/zh-cn/windows/wsl/)

[WSL 发行版](https://raw.githubusercontent.com/microsoft/WSL/master/distributions/DistributionInfo.json)

### 查看可用发行版列表

```shell
wsl --list --online
```

### 安装指定发行版

```shell
wsl --install -d Debian
```

### 卸载指定发行版

```shell
wsl --unregister Debian
```

### 从本地文件安装分发版

```shell
wsl --install --name Ubuntu --from-file .\ubuntu-24.04.3-wsl-amd64.wsl
```

## Debian

### Reinstall

[One-click reinstall OS on VPS](https://github.com/bin456789/reinstall)

### USTC Mirror

[Debian 软件源](https://mirrors.ustc.edu.cn/help/debian.html)
