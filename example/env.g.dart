// coverage:ignore-file
// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_single_quotes
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

///
/// [Env] depends on file: .env, .env.prod
///
/// TYPE   | KEY                   | VALUE
///
/// =====================================================================================
///
/// int    | [INT]                 | 90898
///
/// int    | [SIGNED_INT]          | -8898
///
/// double | [DOUBLE]              | 3.1415926
///
/// double | [SIGNED_DOUBLE]       | -0.123
///
/// bool   | [BOOL]                | true
///
/// String | [STRING]              | "AAA"
///
/// String | [NO_QUOTE_STRING]     | "ABC9shj\"\\'\\''';';;;'\\n\\r\\thttps://google.com"
///
/// String | [SINGLE_QUOTE_STRING] | "'AB\\r\\n\\ta\\'\\\"C'"
///
/// String | [DOUBLE_QUOTE_STRING] | "ABC"
///
/// String | [JSON]                | "{\"a\":1,\"b\":[1,true,\"hello\"]}"
///
/// String | [EMPTY]               | ''
///
/// String | [EMPTY_COMMENT]       | ''
///
/// double | [QWERTY]              | -0.343
///
abstract class Env {
  const factory Env() = _Prod._;

  static const String active = 'prod';

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
      'INT': INT,
      'SIGNED_INT': SIGNED_INT,
      'DOUBLE': DOUBLE,
      'SIGNED_DOUBLE': SIGNED_DOUBLE,
      'BOOL': BOOL,
      'STRING': STRING,
      'NO_QUOTE_STRING': NO_QUOTE_STRING,
      'SINGLE_QUOTE_STRING': SINGLE_QUOTE_STRING,
      'DOUBLE_QUOTE_STRING': DOUBLE_QUOTE_STRING,
      'JSON': JSON,
      'EMPTY': EMPTY,
      'EMPTY_COMMENT': EMPTY_COMMENT,
      'QWERTY': QWERTY,
    };
  }

  @override
  String toString() {
    return "TYPE   | KEY                 | VALUE                                               \n"
        "===================================================================================\n"
        "int    | INT                 | 90898                                               \n"
        "int    | SIGNED_INT          | -8898                                               \n"
        "double | DOUBLE              | 3.1415926                                           \n"
        "double | SIGNED_DOUBLE       | -0.123                                              \n"
        "bool   | BOOL                | true                                                \n"
        "String | STRING              | \"AAA\"                                               \n"
        "String | NO_QUOTE_STRING     | \"ABC9shj\\\"\\\\'\\\\''';';;;'\\\\n\\\\r\\\\thttps://google.com\"\n"
        "String | SINGLE_QUOTE_STRING | \"'AB\\\\r\\\\n\\\\ta\\\\'\\\\\\\"C'\"                            \n"
        "String | DOUBLE_QUOTE_STRING | \"ABC\"                                               \n"
        "String | JSON                | \"{\\\"a\\\":1,\\\"b\\\":[1,true,\\\"hello\\\"]}\"                \n"
        "String | EMPTY               | ''                                                  \n"
        "String | EMPTY_COMMENT       | ''                                                  \n"
        "double | QWERTY              | -0.343                                              \n";
  }
}
