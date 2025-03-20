# Env2dart

![release](https://img.shields.io/github/v/release/fluttercandies/env2dart) ![Apache License 2.0](https://img.shields.io/github/license/fluttercandies/env2dart) ![open issues](https://img.shields.io/github/issues/fluttercandies/env2dart) ![fork](https://img.shields.io/github/forks/fluttercandies/env2dart?style=social) ![code lines](https://img.shields.io/tokei/lines/github/fluttercandies/env2dart)

English | [简体中文](README-ZH.md)

A simple way to generate `dart` code from a `.env` file.

## Quick Start

1. Install the command-line tool:

```shell
dart pub global activate env2dart
```

2. Execute the following command in your project directory:

```shell
env2dart
```

## CLI

```text
-p, --path      Specify working directory, the CLI will look for the .env file in the current directory.
                (defaults to "")
-o, --output    Specify the output file path.
                (defaults to "lib/env.g.dart")
-a, --active    Specify the environment variables to use. For example, if -active prod is specified, the CLI will look for the .env.prod file and merge it with the .env file.
-c, --class     Specify the name for the generated class
                (defaults to "Env")
-e, --encoder   Encode value using the encoder to avoid raw strings. Allows 'base64', 'cbor' and 'utf8'.
-h, --help      View help options.
```

## Example

[env.g.dart](example/env.g.dart)

## Statistics

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
