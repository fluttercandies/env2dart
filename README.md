# Envgen

English | [简体中文](README-ZH.md)

A simple way to generate `dart` code from a `.env` file.

## Quick Start

1. Install the command-line tool:

```shell
dart pub global activate envgen
```

2. Execute the following command in your project directory:

```shell
envgen
```

## Command-line Arguments

```text
-p, --path      Specify working directory, the CLI will look for the .env file in the current directory.
                (defaults to "./")
-o, --output    Specify the output file path.
-a, --active    Specify the environment variables to use. For example, if -active prod is specified, the CLI will look for the .env.prod file and merge it with the .env file.
-c, --class     Specify the name for the generated class
                (defaults to "Env")
-h, --help      View help options.
```
