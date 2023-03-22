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
-h, --help      View help options.
```

## Example

<details>
  <summary>Code Example</summary>

<details>
  <summary>.env</summary>

#### [.env](.env)

```dotenv
# type int
INT=90898
SIGNED_INT=-8898
# type double
DOUBLE=3.1415926
SIGNED_DOUBLE=-.123
# type bool
BOOL=false
# type string
STRING=AAA
NO_QUOTE_STRING=ABC9shj"\'\''';';;;'\n\r\thttps://google.com
SINGLE_QUOTE_STRING='AB\r\n\ta\'\"C'
DOUBLE_QUOTE_STRING="ABC"
JSON={"a":1,"b":[1,true,"hello"]}
EMPTY=
EMPTY_COMMENT=#EMPTY
```

</details>

<details>
  <summary>.env.prod</summary>

#### [.env.prod](.env.prod)

```dotenv
# covered
BOOL=true

# specical
QWERTY=-0.343
```

</details>

<details>
  <summary>env.g.dart</summary>


#### [env.g.dart](example/env.g.dart)

```dart
// coverage:ignore-file
// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_single_quotes
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

abstract class Env {
  const factory Env() = _Prod._;

  static final String active = 'prod';

  /// From .env
  ///
  /// >> INT = 90898
  ///
  /// type int
  ///
  int get INT;

  /// From .env
  ///
  /// >> SIGNED_INT = -8898
  ///
  int get SIGNED_INT;

  /// From .env
  ///
  /// >> DOUBLE = 3.1415926
  ///
  /// type double
  ///
  double get DOUBLE;

  /// From .env
  ///
  /// >> SIGNED_DOUBLE = -.123
  ///
  double get SIGNED_DOUBLE;

  /// Covered the default value
  ///
  /// false => true
  /// ========================================
  /// From .env
  ///
  /// >> BOOL = false
  ///
  /// type bool
  ///
  /// ========================================
  /// From .env.prod
  ///
  /// >> BOOL = true
  ///
  /// covered
  ///
  bool get BOOL;

  /// From .env
  ///
  /// >> STRING = AAA
  ///
  /// type string
  ///
  String get STRING;

  /// From .env
  ///
  /// >> NO_QUOTE_STRING = ABC9shj"\'\''';';;;'\n\r\thttps://google.com
  ///
  String get NO_QUOTE_STRING;

  /// From .env
  ///
  /// >> SINGLE_QUOTE_STRING = 'AB\r\n\ta\'\"C'
  ///
  String get SINGLE_QUOTE_STRING;

  /// From .env
  ///
  /// >> DOUBLE_QUOTE_STRING = "ABC"
  ///
  String get DOUBLE_QUOTE_STRING;

  /// From .env
  ///
  /// >> JSON = {"a":1,"b":[1,true,"hello"]}
  ///
  String get JSON;

  /// From .env
  ///
  /// >> EMPTY =
  ///
  String get EMPTY;

  /// From .env
  ///
  /// >> EMPTY_COMMENT =
  ///
  /// EMPTY
  ///
  String get EMPTY_COMMENT;

  /// From .env.prod
  ///
  /// >> QWERTY = -0.343
  ///
  /// specical
  ///
  double get QWERTY;

  Map<String, dynamic> toJson();
}

class _Prod implements Env {
  const _Prod._();

  @override
  int get INT => 90898;

  @override
  int get SIGNED_INT => -8898;

  @override
  double get DOUBLE => 3.1415926;

  @override
  double get SIGNED_DOUBLE => -0.123;

  @override
  bool get BOOL => true;

  @override
  String get STRING => "AAA";

  @override
  String get NO_QUOTE_STRING =>
      "ABC9shj\"\\'\\''';';;;'\\n\\r\\thttps://google.com";

  @override
  String get SINGLE_QUOTE_STRING => "'AB\\r\\n\\ta\\'\\\"C'";

  @override
  String get DOUBLE_QUOTE_STRING => "ABC";

  @override
  String get JSON => "{\"a\":1,\"b\":[1,true,\"hello\"]}";

  @override
  String get EMPTY => '';

  @override
  String get EMPTY_COMMENT => '';

  @override
  double get QWERTY => -0.343;

  @override
  Map<String, dynamic> toJson() {
    return {
      'INT': 90898,
      'SIGNED_INT': -8898,
      'DOUBLE': 3.1415926,
      'SIGNED_DOUBLE': -0.123,
      'BOOL': true,
      'STRING': "AAA",
      'NO_QUOTE_STRING': "ABC9shj\"\\'\\''';';;;'\\n\\r\\thttps://google.com",
      'SINGLE_QUOTE_STRING': "'AB\\r\\n\\ta\\'\\\"C'",
      'DOUBLE_QUOTE_STRING': "ABC",
      'JSON': "{\"a\":1,\"b\":[1,true,\"hello\"]}",
      'EMPTY': '',
      'EMPTY_COMMENT': '',
      'QWERTY': -0.343,
    };
  }
}
```

</details>

</details>

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
