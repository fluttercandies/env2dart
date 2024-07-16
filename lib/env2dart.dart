import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:antlr4/antlr4.dart';
import 'package:args/args.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dolumns/dolumns.dart';
import 'package:recase/recase.dart';

import 'antlr/EnvLexer.dart';
import 'antlr/EnvParser.dart';
import 'log.dart';
import 'visitor.dart';

EnvParser _newParser(String contents) {
  final input = InputStream.fromString(contents);
  final lexer = EnvLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = EnvParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  return parser;
}

const kIgnoreLints = [
  'avoid_escaping_inner_quotes',
  'camel_case_types',
  'non_constant_identifier_names',
  'prefer_single_quotes',
  'require_trailing_commas',
];

Map<String, KeyValue> _resolvePairs(File file, String fileName) {
  final input = file.readAsStringSync();
  final parser = _newParser(input);
  final visitor = DefaultVisitor(fileName);
  visitor.visit(parser.env());
  return visitor.keyMap;
}

const _numberType = ['int', 'double'];

void _mergeEnv(
  Map<String, KeyValue> env,
  Map<String, KeyValue> other, {
  Set<String>? nullableKeys,
  bool useEnvValue = false,
}) {
  other.forEach((key, value) {
    final newValue = value.copyWith();
    if (env.containsKey(key)) {
      final envValue = env[key]!;
      final comments = envValue.comments;
      if (newValue.comments.isNotEmpty) {
        comments.add('========================================');
        comments.addAll(newValue.comments);
      }
      newValue.comments = comments;
      if (envValue.type != newValue.type) {
        if (_numberType.contains(envValue.type) &&
            _numberType.contains(newValue.type)) {
          newValue.type = 'double';
        } else {
          newValue.type = 'String';
        }
      }
      if (useEnvValue) {
        newValue.value = envValue.value;
      }
    }
    if (nullableKeys != null && nullableKeys.contains(newValue.name)) {
      newValue.nullable = true;
    }
    env[key] = newValue;
  });
}

void envgen({
  String? output,
  required String path,
  required String? output,
  required String clazz,
  required String? active,
  required String? encoder,
}) {
  'Generating, please wait.'.$info(tag: 'env2dart');
  final sw = Stopwatch()..start();
  final dir = Directory(path);
  final entries = dir
      .listSync()
      .whereType<File>()
      .where((e) {
        final fileName = e.uri.pathSegments.last;
        return fileName == '.env' || fileName.startsWith('.env.');
      })
      .sortedBy((e) => e.path)
      .map((e) {
        final fileName = e.uri.pathSegments.last;
        final pairs = _resolvePairs(e, fileName);
        final columns = [
          ['KEY', 'VALUE'],
        ];
        for (final pair in pairs.values) {
          columns.add([pair.name, pair.value.toString()]);
        }
        final str = dolumnify(
          columns,
          headerSeparator: '=',
          columnSplitter: ' | ',
          headerIncluded: true,
        );
        'load $fileName\n\n$str\n\n'.$info(tag: 'env2dart');
        return MapEntry(fileName, pairs);
      });
  final envs = Map.fromEntries(entries);
  if (envs.isEmpty) {
    throw StateError('${dir.absolute.path} does not contains envs.');
  }
  final List<Spec> body;
  if (envs.containsKey('.env')) {
    final d = envs.remove('.env')!;
    final entries = envs.entries.toList(growable: false);
    final length = entries.length;
    if (length > 0) {
      final exist = d.keys.toSet();
      final otherKeys = <String>{};
      for (final entry in entries) {
        otherKeys.addAll(entry.value.keys);
      }
      otherKeys.removeAll(exist);
      final Set<String> nullableKeys = {...otherKeys};
      if (otherKeys.isNotEmpty && length > 1) {
        final sames = entries[0].value.keys.toSet()..removeAll(exist);
        if (sames.isNotEmpty) {
          for (var index = 1; index < length; index++) {
            final e = entries[index].value.keys.toSet()..removeAll(exist);
            if (e.isEmpty) {
              sames.clear();
              break;
            }
            sames.retainAll(e);
            if (sames.isEmpty) {
              break;
            }
          }
          nullableKeys.removeAll(sames);
        }
      }
      final abs = {...d};
      final impls = <Spec>[];
      final extFields = <Field>[];
      Field? activeField;
      for (final entry in entries) {
        _mergeEnv(
          abs,
          entry.value,
          nullableKeys: nullableKeys,
          useEnvValue: true,
        );
        impls.add(_toSubenv(clazz, entry));
        final key = entry.key.substring('.env.'.length);
        final className = '$clazz $key'.pascalCase;
        extFields.add(
          Field(
            (b) => b
              ..name = key
              ..type = Reference(className)
              ..static = true
              ..modifier = FieldModifier.final$
              ..docs = ListBuilder(['/// [$key] from ${entry.key}'])
              ..assignment = Code('$className()'),
          ),
        );
        if (key == active) {
          activeField = Field(
            (b) => b
              ..name = r'$active'
              ..type = Reference(clazz)
              ..static = true
              ..docs =
                  ListBuilder([r'/// [$active] currently active ".env" file.'])
              ..assignment = Code(key),
          );
        }
      }
      activeField ??= Field(
        (b) => b
          ..name = r'$active'
          ..type = Reference(clazz)
          ..static = true
          ..assignment = const Code(r'$'),
      );
      extFields.add(activeField);
      final absClass = _toAbs(
        abs,
        othersKey: otherKeys,
        extFields: extFields,
        name: clazz,
        encoder: encoder,
      );
      body = [absClass, ...impls];
    } else {
      body = [_toAbs(d, othersKey: {}, name: clazz, encoder: encoder)];
    }
  } else {
    body = _toEnvs(envs, name: clazz, encoder: encoder);
  }
  final library = Library(
    (b) => b
      ..body.addAll(body)
      ..comments = ListBuilder([
        'coverage:ignore-file',
        "ignore_for_file: ${kIgnoreLints.join(", ")}",
        '======================================',
        'GENERATED CODE - DO NOT MODIFY BY HAND',
        '======================================',
        'Generate command: env2dart ${rawArguments.join(' ')}',
      ])
      ..directives = ListBuilder([
        if (encoder != null) Directive.import('dart:convert'),
      ]),
  );
  final dartEmitter = DartEmitter(orderDirectives: true);
  var code = library.accept(dartEmitter).toString();
  code = DartFormatter(fixes: StyleFix.all).format(code);
  output ??= './lib/${clazz.snakeCase}.dart';
  if (!output.endsWith('.dart')) {
    output = '$output.dart';
  }
  final outputFile = File(output);
  if (!outputFile.existsSync()) {
    outputFile.createSync(recursive: true);
  }
  'output: ${outputFile.path}'.$info(tag: 'env2dart');
  outputFile.writeAsStringSync(code);
  'Generation successful, took ${sw.elapsed.inMilliseconds} milliseconds.'
      .$info(tag: 'env2dart');
}

Method _entriesGetter(Map<String, KeyValue> env) {
  final sb = StringBuffer();
  for (final entry in env.entries) {
    sb.writeln("MapEntry('${entry.key}', ${entry.key}),");
  }
  return Method(
    (b) => b
      ..name = 'entries'
      ..type = MethodType.getter
      ..returns = const Reference('List<MapEntry<String, dynamic>>')
      ..lambda = true
      ..body = Code('[$sb]'),
  );
}

Class _toAbs(
  Map<String, KeyValue> kvs, {
  Set<String> othersKey = const {},
  List<Field> extFields = const [],
  required String name,
  String? encoder,
}) {
  final getters = <Method>[];
  final fields = <Field>[];
  final ovps = <Parameter>[];
  final ovcodes = StringBuffer();
  final toJson = StringBuffer();
  final toString = StringBuffer();
  final ovjvs = StringBuffer();
  final ovjps = StringBuffer();
  int padRight = 0;
  for (final field in kvs.values) {
    final fieldName = field.name;
    padRight = math.max(fieldName.length, padRight);
    final fieldType = field.type;
    getters.add(
      Method(
        (b) {
          b
            ..name = fieldName
            ..type = MethodType.getter
            ..lambda = true
            ..body = Code('_$fieldName')
            ..returns = Reference(field.nullable ? '$fieldType?' : fieldType)
            ..docs = ListBuilder(field.comments.map((e) => '/// $e'));
          if (othersKey.contains(fieldName)) {
            b.returns = Reference('$fieldType?');
          } else {
            b.returns = Reference(fieldType);
          }
        },
      ),
    );
    fields.add(
      Field(
        (b) {
          b
            ..type = Reference(field.nullable ? '$fieldType?' : fieldType)
            ..name = '_$fieldName';
          if (othersKey.contains(fieldName)) {
            b.type = Reference('$fieldType?');
          } else {
            b.type = Reference(fieldType);
            String v = field.value.toString();
            if (encoder == 'utf8') {
              v = 'utf8.decode(${utf8.encode(v)})';
            } else if (fieldType == 'String' &&
                !RegExp('^[\'"].*[\'"]\$').hasMatch(v)) {
              v = "'$v'";
            }
            b.assignment = Code(v);
          }
        },
      ),
    );
    ovps.add(
      Parameter(
        (b) => b
          ..name = fieldName
          ..named = true
          ..type = Reference('$fieldType?'),
      ),
    );
    ovcodes.writeln('_$fieldName = $fieldName ?? _$fieldName;');
    toJson.write("'$fieldName': $fieldName,");
    toString.write(
      "sb.write('$fieldName'.padRight(padRight));sb.write(separator);sb.writeln($fieldName);",
    );
    if (fieldType == 'int') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln(
        '$fieldName: $fieldName == null ? null : int.parse($fieldName.toString()),',
      );
    } else if (fieldType == 'double') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln(
        '$fieldName: $fieldName == null ? null : double.parse($fieldName.toString()),',
      );
    } else if (fieldType == 'bool') {
      ovjvs.writeln("final $fieldName = json['$fieldName'].toString();");
      ovjps.writeln(
        "$fieldName: $fieldName == 'true' || $fieldName == 'false' ? $fieldName == 'true' : null,",
      );
    } else if (fieldType == 'String') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln('$fieldName: $fieldName,');
    }
  }
  return Class(
    (b) => b
      ..name = name
      ..fields = ListBuilder([
        Field(
          (b) => b
            ..name = 'env'
            ..modifier = FieldModifier.final$
            ..type = const Reference('String'),
        ),
        Field(
          (b) => b
            ..name = r'$'
            ..static = true
            ..modifier = FieldModifier.final$
            ..assignment = Code("$name('')")
            ..docs = ListBuilder([r'/// [$] from .env'])
            ..type = Reference(name),
        ),
        ...extFields,
        ...fields,
      ])
      ..methods = ListBuilder([
        ...getters,
        _entriesGetter(kvs),
        Method(
          (b) => b
            ..name = 'overrideValue'
            ..returns = const Reference('void')
            ..body = Code(ovcodes.toString())
            ..optionalParameters = ListBuilder(ovps),
        ),
        Method(
          (b) => b
            ..name = 'overrideValueFromJson'
            ..returns = const Reference('void')
            ..body = Code('${ovjvs}overrideValue($ovjps);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..name = 'json'
                  ..type = const Reference('Map'),
              ),
            ]),
        ),
        Method(
          (b) => b
            ..name = 'toJson'
            ..returns = const Reference('Map<String, dynamic>')
            ..body = Code('return {$toJson};'),
        ),
        Method(
          (b) => b
            ..name = 'toString'
            ..annotations =
                ListBuilder([const CodeExpression(Code('override'))])
            ..returns = const Reference('String')
            ..optionalParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..name = 'padRight'
                  ..type = const Reference('int')
                  ..defaultTo = Code(padRight.toString())
                  ..named = true,
              ),
              Parameter(
                (b) => b
                  ..name = 'separator'
                  ..type = const Reference('String')
                  ..defaultTo = const Code("' : '")
                  ..named = true,
              ),
            ])
            ..body = Code(
              'final sb = StringBuffer();\n$toString\nreturn sb.toString();',
            ),
        ),
      ])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..name = 'env'
                  ..toThis = true,
              ),
            ]),
        ),
      ]),
  );
}

List<Class> _toEnvs(
  Map<String, Map<String, KeyValue>> envs, {
  required String name,
  String? encoder,
}) {
  return envs.entries
      .map((e) => _toEnvClass(name, e, encoder: encoder))
      .toList(growable: false);
}

Class _toSubenv(
  String name,
  MapEntry<String, Map<String, KeyValue>> env,
) {
  final ovcodes = StringBuffer();
  for (final field in env.value.values) {
    ovcodes.writeln(
      field.comments
          .where((e) => e.isNotEmpty)
          .map((e) => '    // $e')
          .join('\n'),
    );
    String v = field.value.toString();
    if (field.type == 'String' && !RegExp('^[\'"].*[\'"]\$').hasMatch(v)) {
      v = "'$v'";
    }
    ovcodes.writeln('_${field.name} = $v;');
  }
  final ek = env.key.substring('.env.'.length);
  final className = '$name $ek'.pascalCase;
  return Class(
    (b) => b
      ..name = className
      ..extend = Reference(name)
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..body = Code(ovcodes.toString())
            ..initializers = ListBuilder(
              [Code("super('$ek')")],
            ),
        ),
      ]),
  );
}

Class _toEnvClass(
  String name,
  MapEntry<String, Map<String, KeyValue>> env, {
  String? encoder,
}) {
  final getters = <Method>[];
  final fields = <Field>[];
  final ovps = <Parameter>[];
  final ovcodes = StringBuffer();
  final toJson = StringBuffer();
  final toString = StringBuffer();
  final ovjvs = StringBuffer();
  final ovjps = StringBuffer();
  int padRight = 0;
  for (final field in env.value.values) {
    final fieldName = field.name;
    padRight = math.max(fieldName.length, padRight);
    final fieldType = field.type;
    getters.add(
      Method(
        (b) => b
          ..name = fieldName
          ..type = MethodType.getter
          ..lambda = true
          ..body = Code('_$fieldName')
          ..docs = ListBuilder(field.comments.map((e) => '/// $e'))
          ..returns = Reference(fieldType),
      ),
    );
    fields.add(
      Field(
        (b) {
          String v = field.value.toString();
          if (encoder == 'utf8') {
            v = utf8.encode(v).toString();
          }
          b
            ..type = Reference(fieldType)
            ..name = '_$fieldName'
            ..assignment = Code(v);
        },
      ),
    );
    ovps.add(
      Parameter(
        (b) => b
          ..name = fieldName
          ..named = true
          ..type = Reference('$fieldType?'),
      ),
    );
    ovcodes.writeln('_$fieldName = $fieldName ?? _$fieldName;');
    toJson.write("'$fieldName': $fieldName,");
    toString.write(
      "sb.write('$fieldName'.padRight(padRight));sb.write(separator);sb.writeln($fieldName);",
    );
    if (fieldType == 'int') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln(
        '$fieldName: $fieldName == null ? null : int.parse($fieldName.toString()),',
      );
    } else if (fieldType == 'double') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln(
        '$fieldName: $fieldName == null ? null : double.parse($fieldName.toString()),',
      );
    } else if (fieldType == 'bool') {
      ovjvs.writeln("final $fieldName = json['$fieldName'].toString();");
      ovjps.writeln(
        "$fieldName: $fieldName == 'true' || $fieldName == 'false' ? $fieldName == 'true' : null,",
      );
    } else if (fieldType == 'String') {
      ovjvs.writeln("final $fieldName = json['$fieldName'];");
      ovjps.writeln('$fieldName: $fieldName,');
    }
  }
  final isDefault = env.key == '.env';
  final envKey = env.key.substring('.env.'.length);
  final className = isDefault ? name : '$name $envKey'.pascalCase;
  return Class(
    (b) => b
      ..name = className
      ..fields = ListBuilder([
        Field(
          (b) => b
            ..name = 'env'
            ..modifier = FieldModifier.final$
            ..type = const Reference('String'),
        ),
        ...fields,
      ])
      ..methods = ListBuilder([
        ...getters,
        _entriesGetter(env.value),
        Method(
          (b) => b
            ..name = 'overrideValue'
            ..returns = const Reference('void')
            ..body = Code(ovcodes.toString())
            ..optionalParameters = ListBuilder(ovps),
        ),
        Method(
          (b) => b
            ..name = 'overrideValueFromJson'
            ..returns = const Reference('void')
            ..body = Code('${ovjvs}overrideValue($ovjps);')
            ..requiredParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..name = 'json'
                  ..type = const Reference('Map'),
              ),
            ]),
        ),
        Method(
          (b) => b
            ..name = 'toJson'
            ..returns = const Reference('Map<String, dynamic>')
            ..body = Code('return {$toJson};'),
        ),
        Method(
          (b) => b
            ..name = 'toString'
            ..annotations =
                ListBuilder([const CodeExpression(Code('override'))])
            ..returns = const Reference('String')
            ..optionalParameters = ListBuilder([
              Parameter(
                (b) => b
                  ..name = 'padRight'
                  ..type = const Reference('int')
                  ..defaultTo = Code(padRight.toString())
                  ..named = true,
              ),
              Parameter(
                (b) => b
                  ..name = 'separator'
                  ..type = const Reference('String')
                  ..defaultTo = const Code("' : '")
                  ..named = true,
              ),
            ])
            ..body = Code(
              'final sb = StringBuffer();\n$toString\nreturn sb.toString();',
            ),
        ),
      ])
      ..constructors = ListBuilder([
        Constructor(
          (b) => b
            ..initializers = ListBuilder(
              [Code("env = '${isDefault ? '' : envKey}'")],
            ),
        ),
      ]),
  );
}

void parseAndGen(List<String> arguments) {
  final args = ArgParser();
  args.addFlag(
    'help',
    abbr: 'h',
    negatable: false,
    help: 'View help options.',
  );
  args.addOption(
    'path',
    abbr: 'p',
    defaultsTo: '',
    help: 'Specify working directory, '
        'the CLI will look for the .env file in the current directory.',
  );
  args.addOption(
    'output',
    abbr: 'o',
    help: 'Specify the output file path.',
    defaultsTo: 'lib/env.g.dart',
  );
  args.addOption(
    'class',
    abbr: 'c',
    defaultsTo: 'Env',
    help: 'Specify the name for the generated class',
  );
  args.addOption(
    'active',
    abbr: 'a',
    help: 'Specify the environment variables to use. '
        'For example, if -active prod is specified, '
        'the CLI will look for the .env.prod file '
        'and merge it with the .env file.',
  );
  args.addOption(
    'encoder',
    abbr: 'e',
    allowed: ['utf8'],
    help: 'Encode value using the encoder to avoid raw strings.',
  );
  final parse = args.parse(arguments);
  if (parse['help'] == true) {
    print(args.usage);
    return;
  }
  envgen(
    path: parse['path'],
    output: parse['output'],
    clazz: parse['class'],
    active: parse['active'],
    encoder: parse['encoder'],
  );
}
