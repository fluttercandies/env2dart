import 'dart:convert';

import 'antlr/EnvBaseVisitor.dart';
import 'antlr/EnvParser.dart';

class DefaultVisitor extends EnvBaseVisitor {
  DefaultVisitor(this.target);

  final keyMap = <String, KeyValue>{};

  final String target;

  @override
  void visitLine(LineContext ctx) {
    final key = ctx.key();
    if (key != null && key.text.isNotEmpty) {
      final name = key.text;
      final value = ctx.value().value;
      final type = ctx.value().type;
      final comments = ctx
          .comments()
          .map((e) => [e.text.substring(1).trim(), ''])
          .expand((e) => e)
          .where((e) => e.isNotEmpty);
      keyMap[name] = KeyValue(
        name: name,
        type: type,
        value: value,
        comments: [
          'From $target',
          ">> $name = ${ctx.value()?.text ?? ''}",
          ...comments,
        ],
      );
    }
    super.visitLine(ctx);
  }
}

extension ValueContextExtension on ValueContext? {
  String get type {
    final ctx = this;
    if (ctx == null) {
      return 'String';
    } else if (ctx.INT() != null) {
      return 'int';
    } else if (ctx.DOUBLE() != null) {
      return 'double';
    } else if (ctx.BOOLEAN() != null) {
      return 'bool';
    }
    return 'String';
  }

  dynamic get value {
    final ctx = this;
    if (ctx == null) {
      return "''";
    } else if (ctx.INT() != null) {
      return int.parse(ctx.text);
    } else if (ctx.DOUBLE() != null) {
      return double.parse(ctx.text);
    } else if (ctx.BOOLEAN() != null) {
      return ctx.text == 'true';
    } else if (ctx.string() != null) {
      final str = ctx.string()!;
      if (str.NO_QUOTE_STRING() != null || str.KEY() != null) {
        return jsonEncode(ctx.text);
      }
      return ctx.text;
    }
    return ctx.text;
  }
}

class KeyValue {
  KeyValue({
    required this.name,
    required this.type,
    required this.value,
    required this.comments,
    this.nullable = false,
  });

  final String name;
  List<String> comments;
  String type;
  dynamic value;
  bool nullable;

  KeyValue copyWith({
    String? name,
    List<String>? comments,
    String? type,
    Object? value,
    bool? nullable,
  }) {
    return KeyValue(
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      comments: comments ?? List.from(this.comments),
      nullable: nullable ?? this.nullable,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'value': value,
      'nullable': nullable,
      'comments': comments,
    };
  }
}
