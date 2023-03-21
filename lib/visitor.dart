import 'dart:convert';

import 'package:envgen/antlr/EnvBaseVisitor.dart';
import 'package:envgen/antlr/EnvParser.dart';

class DefaultVisitor extends EnvBaseVisitor {
  final pairs = <String, Pair>{};

  final String target;

  DefaultVisitor(this.target);

  @override
  visitLine(LineContext ctx) {
    var key = ctx.key();
    if (key != null && key.text.isNotEmpty) {
      var name = key.text;
      var value = ctx.value().value;
      var type = ctx.value().type;
      var comments = ctx
          .comments()
          .map((e) => [e.text.substring(1).trim(), ""])
          .expand((e) => e);
      pairs[name] = Pair(name, type, value, [
        "From $target",
        "",
        ">> $name = ${ctx.value()?.text ?? ''}",
        "",
        ...comments,
      ]);
    }
    return super.visitLine(ctx);
  }
}

extension ValueContextExtension on ValueContext? {
  String get type {
    var ctx = this;
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
    var ctx = this;
    if (ctx == null) {
      return null;
    } else if (ctx.INT() != null) {
      return int.parse(ctx.text);
    } else if (ctx.DOUBLE() != null) {
      return double.parse(ctx.text);
    } else if (ctx.BOOLEAN() != null) {
      return ctx.text == 'true';
    } else if (ctx.string() != null) {
      var str = ctx.string()!;
      if (str.NO_QUOTE_STRING() != null) {
        return "'${ctx.text}'";
      }
      return ctx.text;
    }
    return ctx.text;
  }
}

class Pair {
  List<String> comments;
  final String name;
  final String type;
  final dynamic value;

  Pair(
    this.name,
    this.type,
    this.value,
    this.comments,
  );

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type,
      "value": value,
      "comments": comments,
    };
  }
}
