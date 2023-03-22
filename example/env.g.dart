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
