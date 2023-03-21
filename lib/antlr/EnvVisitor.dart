// Generated from ./antlr/Env.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'EnvParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [EnvParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class EnvVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [EnvParser.env].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitEnv(EnvContext ctx);

  /// Visit a parse tree produced by [EnvParser.line].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLine(LineContext ctx);

  /// Visit a parse tree produced by [EnvParser.key].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitKey(KeyContext ctx);

  /// Visit a parse tree produced by [EnvParser.value].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitValue(ValueContext ctx);

  /// Visit a parse tree produced by [EnvParser.comment].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitComment(CommentContext ctx);

  /// Visit a parse tree produced by [EnvParser.string].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitString(StringContext ctx);
}