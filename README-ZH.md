# Envgen

[English](README.md) | 简体中文

一种简单的方式将 `.env` 文件生成 `dart` 代码。

## 快速开始

1. 安装命令行工具

```shell
dart pub global activate envgen
```

2. 在项目目录下执行命令

```shell
envgen
```

## 命令行参数

```text
-p, --path      指定工作目录，CLI 将在当前目录中查找 .env 文件。
                (默认为 "./")
-o, --output    指定输出文件路径。
-a, --active    指定要使用的环境变量。例如，如果指定了 `-active prod`，CLI 将查找 .env.prod 文件并将其与 .env 文件合并。
-c, --class     指定生成类的名称。
                (默认为 "Env")
-h, --help      查看帮助选项。
```

