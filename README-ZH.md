# Env2dart

![release](https://img.shields.io/github/v/release/fluttercandies/env2dart) ![Apache License 2.0](https://img.shields.io/github/license/fluttercandies/env2dart) ![open issues](https://img.shields.io/github/issues/fluttercandies/env2dart) ![fork](https://img.shields.io/github/forks/fluttercandies/env2dart?style=social) ![code lines](https://img.shields.io/tokei/lines/github/fluttercandies/env2dart)

[English](README.md) | 简体中文

一种简单的方式将 `.env` 文件生成 `dart` 代码。

## 快速开始

1. 安装命令行工具

```shell
dart pub global activate env2dart
```

2. 在项目目录下执行命令

```shell
env2dart
```

## 命令行参数

```text
-p, --path      指定工作目录，CLI 将在当前目录中查找 .env 文件。
                (默认为 "")
-o, --output    指定输出文件路径。
                (默认为 "lib/env.g.dart")
-a, --active    指定要使用的环境变量。例如，如果指定了 `-active prod`，CLI 将查找 .env.prod 文件并将其与 .env 文件合并。
-c, --class     指定生成类的名称。
                (默认为 "Env")
-h, --help      查看帮助选项。
```


## 生成示例

[env.g.dart](example/env.g.dart)

## 统计

![count viewed](https://count.getloli.com/get/@fluttercandies:env2dart?theme=rule34)

[![Sparkline](https://stars.medv.io/fluttercandies/env2dart.svg)](https://stars.medv.io/fluttercandies/env2dart)

## Licenses

``` text
Copyright 2023 iota9star

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

