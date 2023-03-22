import 'dart:convert';
import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:args/args.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dolumns/dolumns.dart';
import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

import 'antlr/EnvLexer.dart';
import 'antlr/EnvParser.dart';
import 'visitor.dart';

EnvParser _newParser(String contents) {
  var input = InputStream.fromString(contents);
  var lexer = EnvLexer(input);
  var tokens = CommonTokenStream(lexer);
  var parser = EnvParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  return parser;
}

const kIgnoreLints = [
  'camel_case_types',
  'non_constant_identifier_names',
  'prefer_single_quotes',
];

void _codegen(
  Map<String, Pair> pairs, {
  required String name,
  String? active,
  String? output,
}) {
  var activeClass = (active ?? name).pascalCase;
  var fields = <Method>[];
  var getters = <Method>[];
  var toJson = StringBuffer();
  for (var field in pairs.values) {
    getters.add(Method((b) => b
      ..name = field.name
      ..type = MethodType.getter
      ..docs = ListBuilder(field.comments.map((e) => "/// $e"))
      ..returns = Reference(field.type)));
    fields.add(Method((b) => b
      ..name = field.name
      ..type = MethodType.getter
      ..annotations = ListBuilder([CodeExpression(Code("override"))])
      ..body = Code(field.value.toString())
      ..lambda = true
      ..returns = Reference(field.type)));
    toJson.write("'${field.name}':${field.name},");
  }

  var abs = Class(
    (b) => b
      ..name = name
      ..abstract = true
      ..fields = ListBuilder([
        Field((b) => b
          ..name = 'active'
          ..type = Reference(active == null ? "String?" : "String")
          ..static = true
          ..modifier = FieldModifier.constant
          ..assignment = active == null ? null : Code("'$active'"))
      ])
      ..methods = ListBuilder([
        ...getters,
        Method((b) => b
          ..name = "toJson"
          ..returns = Reference("Map<String, dynamic>"))
      ])
      ..docs = ListBuilder([
        "///",
        "/// [$name] depends on file: ${[
          '.env',
          if (active != null) '.env.$active'
        ].join(", ")}",
        "///",
        ...pairs.values
            .map((e) => ["/// [${e.name}] : ${e.value}", "///"])
            .expand((e) => e),
      ])
      ..constructors = ListBuilder([
        Constructor((b) => b
          ..factory = true
          ..redirect = Reference("_$activeClass._")
          ..constant = true),
      ]),
  );
  var columns =
      pairs.values.map((e) => <Object>[e.type, e.name, e.value]).toList();
  columns.insert(0, ["TYPE", "KEY", "VALUE"]);
  var pretty = dolumnify(
    columns,
    columnSplitter: ' | ',
    headerIncluded: true,
    headerSeparator: '=',
  );
  var impl = Class(
    (b) => b
      ..name = '_$activeClass'
      ..implements = ListBuilder([Reference(name)])
      ..methods = ListBuilder([
        ...fields,
        Method((b) => b
          ..name = "toJson"
          ..annotations = ListBuilder([CodeExpression(Code("override"))])
          ..returns = Reference("Map<String, dynamic>")
          ..body = Code("return {$toJson};")),
        Method((b) => b
          ..name = "toString"
          ..annotations = ListBuilder([CodeExpression(Code("override"))])
          ..returns = Reference("String")
          ..body = Code(
              "return ${pretty.split("\n").map((e) => jsonEncode("$e\n")).join("\n")};"))
      ])
      ..constructors = ListBuilder([
        Constructor((b) => b
          ..constant = true
          ..name = "_"),
      ]),
  );
  var library = Library((b) => b
    ..body.addAll([abs, impl])
    ..comments = ListBuilder([
      "coverage:ignore-file",
      "ignore_for_file: ${kIgnoreLints.join(", ")}",
      "======================================",
      "GENERATED CODE - DO NOT MODIFY BY HAND",
      "======================================",
    ]));
  var dartEmitter = DartEmitter();
  var code = library.accept(dartEmitter).toString();
  code = DartFormatter().format(code);
  output ??= "./lib/${name.snakeCase}.dart";
  if (!output.endsWith(".dart")) {
    output = "$output.dart";
  }
  File(output).writeAsStringSync(code);
  print(pretty);
}

Map<String, Pair> _toPairs(Directory dir, String file) {
  var input = File(path.join(dir.absolute.path, file)).readAsStringSync();
  var parser = _newParser(input);
  var visitor = DefaultVisitor(file);
  visitor.visit(parser.env());
  return visitor.pairs;
}

void _mergeActive(
  Directory dir,
  Map<String, Pair> def,
  String? active,
) {
  if (active != null) {
    var af = ".env.$active";
    var pairs = _toPairs(dir, af);
    pairs.forEach((key, value) {
      if (def.containsKey(key)) {
        var old = def[key]!;
        var comments = old.comments;
        if (value.comments.isNotEmpty) {
          comments.add("========================================");
          comments.addAll(value.comments);
        }
        if (old.value != value.value) {
          var table = [
            "Covered the default value",
            "",
            "${old.value} => ${value.value}",
            "========================================",
          ];
          value.comments = table..addAll(comments);
        } else {
          value.comments = comments;
        }
      }
      def[key] = value;
    });
  }
}

void envgen({
  String? output,
  required String path,
  String? active,
  required String clazz,
}) {
  print('Generating, please wait.');
  var sw = Stopwatch()..start();
  var dir = Directory(path);
  var def = _toPairs(dir, ".env");
  _mergeActive(dir, def, active);
  _codegen(def, name: clazz, active: active, output: output);
  print(
      "Generation successful, took ${sw.elapsed.inMilliseconds} milliseconds.");
}

void parseAndGen(List<String> arguments) {
  var args = ArgParser();
  args.addOption(
    "path",
    abbr: "p",
    defaultsTo: "",
    help:
        "Specify working directory, the CLI will look for the .env file in the current directory.",
  );
  args.addOption(
    "output",
    abbr: "o",
    help: "Specify the output file path.",
    defaultsTo: "lib/env.g.dart",
  );
  args.addOption(
    "active",
    abbr: "a",
    help:
        "Specify the environment variables to use. For example, if -active prod is specified, the CLI will look for the .env.prod file and merge it with the .env file.",
  );
  args.addOption(
    "class",
    abbr: "c",
    defaultsTo: "Env",
    help: "Specify the name for the generated class",
  );
  args.addFlag(
    "help",
    abbr: "h",
    negatable: false,
    help: "View help options.",
  );
  var parse = args.parse(arguments);
  if (parse["help"] == true) {
    print(args.usage);
    return;
  }
  envgen(
    path: parse["path"],
    output: parse["output"],
    active: parse["active"],
    clazz: parse["class"],
  );
}
