// coverage:ignore-file
// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_single_quotes, avoid_escaping_inner_quotes
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

class Env {
  Env(this.env);

  final String env;

  /// [$] from .env
  static final Env $ = Env('');

  /// [dev] from .env.dev
  static final EnvDev dev = EnvDev();

  /// [prod] from .env.prod
  static final EnvProd prod = EnvProd();

  /// [staging] from .env.staging
  static final EnvStaging staging = EnvStaging();

  /// [$active] currently active ".env" file.
  static Env $active = prod;

  String _INT = '90898';

  String _SIGNED_INT = '-8898';

  String _DOUBLE = '3.1415926';

  double _SIGNED_DOUBLE = -0.123;

  bool _BOOL = false;

  String _STRING = "AAA";

  String _NO_QUOTE_STRING =
      "ABC9shj\"\\'\\''';';;;'\\n\\r\\thttps://google.com";

  String _SINGLE_QUOTE_STRING = "'AB\\r\\n\\ta\\'\\\"C'";

  String _DOUBLE_QUOTE_STRING = "ABC";

  String _JSON = "{\"a\":1,\"b\":[1,true,\"hello\"]}";

  String _EMPTY = '';

  String _EMPTY_COMMENT = '';

  double? _QWERTY;

  double? _ASDF;

  double? _POIU;

  double? _LKJH;

  double? _MNB;

  double? _ZXCV;

  /// From .env
  /// >> INT = 90898
  /// type int
  /// ========================================
  /// From .env.dev
  /// >> INT = asd
  String get INT => _INT;

  /// From .env
  /// >> SIGNED_INT = -8898
  /// ========================================
  /// From .env.dev
  /// >> SIGNED_INT = -asd
  String get SIGNED_INT => _SIGNED_INT;

  /// From .env
  /// >> DOUBLE = 3.1415926
  /// type double
  /// ========================================
  /// From .env.dev
  /// >> DOUBLE = 3.asd
  String get DOUBLE => _DOUBLE;

  /// From .env
  /// >> SIGNED_DOUBLE = -.123
  double get SIGNED_DOUBLE => _SIGNED_DOUBLE;

  /// From .env
  /// >> BOOL = false
  /// type bool
  /// ========================================
  /// From .env.dev
  /// >> BOOL = true
  /// covered
  /// ========================================
  /// From .env.prod
  /// >> BOOL = true
  /// covered
  /// ========================================
  /// From .env.staging
  /// >> BOOL = true
  /// covered
  bool get BOOL => _BOOL;

  /// From .env
  /// >> STRING = AAA
  /// type string
  String get STRING => _STRING;

  /// From .env
  /// >> NO_QUOTE_STRING = ABC9shj"\'\''';';;;'\n\r\thttps://google.com
  String get NO_QUOTE_STRING => _NO_QUOTE_STRING;

  /// From .env
  /// >> SINGLE_QUOTE_STRING = 'AB\r\n\ta\'\"C'
  String get SINGLE_QUOTE_STRING => _SINGLE_QUOTE_STRING;

  /// From .env
  /// >> DOUBLE_QUOTE_STRING = "ABC"
  String get DOUBLE_QUOTE_STRING => _DOUBLE_QUOTE_STRING;

  /// From .env
  /// >> JSON = {"a":1,"b":[1,true,"hello"]}
  String get JSON => _JSON;

  /// From .env
  /// >> EMPTY =
  String get EMPTY => _EMPTY;

  /// From .env
  /// >> EMPTY_COMMENT =
  /// EMPTY
  String get EMPTY_COMMENT => _EMPTY_COMMENT;

  /// From .env.dev
  /// >> QWERTY = -0.343
  /// specical
  /// ========================================
  /// From .env.prod
  /// >> QWERTY = -0.343
  /// specical
  /// ========================================
  /// From .env.staging
  /// >> QWERTY = -0.343
  /// specical
  double? get QWERTY => _QWERTY;

  /// From .env.dev
  /// >> ASDF = -0.343
  /// ========================================
  /// From .env.prod
  /// >> ASDF = -0.343
  /// ========================================
  /// From .env.staging
  /// >> ASDF = -0.343
  double? get ASDF => _ASDF;

  /// From .env.prod
  /// >> POIU = -0.343
  double? get POIU => _POIU;

  /// From .env.prod
  /// >> LKJH = -0.343
  double? get LKJH => _LKJH;

  /// From .env.prod
  /// >> MNB = -0.343
  double? get MNB => _MNB;

  /// From .env.staging
  /// >> ZXCV = -0.343
  double? get ZXCV => _ZXCV;

  List<MapEntry<String, dynamic>> get entries {
    return [
      MapEntry('INT', INT),
      MapEntry('SIGNED_INT', SIGNED_INT),
      MapEntry('DOUBLE', DOUBLE),
      MapEntry('SIGNED_DOUBLE', SIGNED_DOUBLE),
      MapEntry('BOOL', BOOL),
      MapEntry('STRING', STRING),
      MapEntry('NO_QUOTE_STRING', NO_QUOTE_STRING),
      MapEntry('SINGLE_QUOTE_STRING', SINGLE_QUOTE_STRING),
      MapEntry('DOUBLE_QUOTE_STRING', DOUBLE_QUOTE_STRING),
      MapEntry('JSON', JSON),
      MapEntry('EMPTY', EMPTY),
      MapEntry('EMPTY_COMMENT', EMPTY_COMMENT),
      MapEntry('QWERTY', QWERTY),
      MapEntry('ASDF', ASDF),
      MapEntry('POIU', POIU),
      MapEntry('LKJH', LKJH),
      MapEntry('MNB', MNB),
      MapEntry('ZXCV', ZXCV),
    ];
  }

  void overrideValue({
    String? INT,
    String? SIGNED_INT,
    String? DOUBLE,
    double? SIGNED_DOUBLE,
    bool? BOOL,
    String? STRING,
    String? NO_QUOTE_STRING,
    String? SINGLE_QUOTE_STRING,
    String? DOUBLE_QUOTE_STRING,
    String? JSON,
    String? EMPTY,
    String? EMPTY_COMMENT,
    double? QWERTY,
    double? ASDF,
    double? POIU,
    double? LKJH,
    double? MNB,
    double? ZXCV,
  }) {
    _INT = INT ?? _INT;
    _SIGNED_INT = SIGNED_INT ?? _SIGNED_INT;
    _DOUBLE = DOUBLE ?? _DOUBLE;
    _SIGNED_DOUBLE = SIGNED_DOUBLE ?? _SIGNED_DOUBLE;
    _BOOL = BOOL ?? _BOOL;
    _STRING = STRING ?? _STRING;
    _NO_QUOTE_STRING = NO_QUOTE_STRING ?? _NO_QUOTE_STRING;
    _SINGLE_QUOTE_STRING = SINGLE_QUOTE_STRING ?? _SINGLE_QUOTE_STRING;
    _DOUBLE_QUOTE_STRING = DOUBLE_QUOTE_STRING ?? _DOUBLE_QUOTE_STRING;
    _JSON = JSON ?? _JSON;
    _EMPTY = EMPTY ?? _EMPTY;
    _EMPTY_COMMENT = EMPTY_COMMENT ?? _EMPTY_COMMENT;
    _QWERTY = QWERTY ?? _QWERTY;
    _ASDF = ASDF ?? _ASDF;
    _POIU = POIU ?? _POIU;
    _LKJH = LKJH ?? _LKJH;
    _MNB = MNB ?? _MNB;
    _ZXCV = ZXCV ?? _ZXCV;
  }

  void overrideValueFromJson(Map json) {
    final INT = json['INT'];
    final SIGNED_INT = json['SIGNED_INT'];
    final DOUBLE = json['DOUBLE'];
    final SIGNED_DOUBLE = json['SIGNED_DOUBLE'];
    final BOOL = json['BOOL'].toString();
    final STRING = json['STRING'];
    final NO_QUOTE_STRING = json['NO_QUOTE_STRING'];
    final SINGLE_QUOTE_STRING = json['SINGLE_QUOTE_STRING'];
    final DOUBLE_QUOTE_STRING = json['DOUBLE_QUOTE_STRING'];
    final JSON = json['JSON'];
    final EMPTY = json['EMPTY'];
    final EMPTY_COMMENT = json['EMPTY_COMMENT'];
    final QWERTY = json['QWERTY'];
    final ASDF = json['ASDF'];
    final POIU = json['POIU'];
    final LKJH = json['LKJH'];
    final MNB = json['MNB'];
    final ZXCV = json['ZXCV'];
    overrideValue(
      INT: INT,
      SIGNED_INT: SIGNED_INT,
      DOUBLE: DOUBLE,
      SIGNED_DOUBLE:
          SIGNED_DOUBLE == null ? null : double.parse(SIGNED_DOUBLE.toString()),
      BOOL: BOOL == 'true' || BOOL == 'false' ? BOOL == 'true' : null,
      STRING: STRING,
      NO_QUOTE_STRING: NO_QUOTE_STRING,
      SINGLE_QUOTE_STRING: SINGLE_QUOTE_STRING,
      DOUBLE_QUOTE_STRING: DOUBLE_QUOTE_STRING,
      JSON: JSON,
      EMPTY: EMPTY,
      EMPTY_COMMENT: EMPTY_COMMENT,
      QWERTY: QWERTY == null ? null : double.parse(QWERTY.toString()),
      ASDF: ASDF == null ? null : double.parse(ASDF.toString()),
      POIU: POIU == null ? null : double.parse(POIU.toString()),
      LKJH: LKJH == null ? null : double.parse(LKJH.toString()),
      MNB: MNB == null ? null : double.parse(MNB.toString()),
      ZXCV: ZXCV == null ? null : double.parse(ZXCV.toString()),
    );
  }

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
      'ASDF': ASDF,
      'POIU': POIU,
      'LKJH': LKJH,
      'MNB': MNB,
      'ZXCV': ZXCV,
    };
  }

  @override
  String toString({
    int padRight = 19,
    String separator = ' : ',
  }) {
    final sb = StringBuffer();
    sb.write('INT'.padRight(padRight));
    sb.write(separator);
    sb.writeln(INT);
    sb.write('SIGNED_INT'.padRight(padRight));
    sb.write(separator);
    sb.writeln(SIGNED_INT);
    sb.write('DOUBLE'.padRight(padRight));
    sb.write(separator);
    sb.writeln(DOUBLE);
    sb.write('SIGNED_DOUBLE'.padRight(padRight));
    sb.write(separator);
    sb.writeln(SIGNED_DOUBLE);
    sb.write('BOOL'.padRight(padRight));
    sb.write(separator);
    sb.writeln(BOOL);
    sb.write('STRING'.padRight(padRight));
    sb.write(separator);
    sb.writeln(STRING);
    sb.write('NO_QUOTE_STRING'.padRight(padRight));
    sb.write(separator);
    sb.writeln(NO_QUOTE_STRING);
    sb.write('SINGLE_QUOTE_STRING'.padRight(padRight));
    sb.write(separator);
    sb.writeln(SINGLE_QUOTE_STRING);
    sb.write('DOUBLE_QUOTE_STRING'.padRight(padRight));
    sb.write(separator);
    sb.writeln(DOUBLE_QUOTE_STRING);
    sb.write('JSON'.padRight(padRight));
    sb.write(separator);
    sb.writeln(JSON);
    sb.write('EMPTY'.padRight(padRight));
    sb.write(separator);
    sb.writeln(EMPTY);
    sb.write('EMPTY_COMMENT'.padRight(padRight));
    sb.write(separator);
    sb.writeln(EMPTY_COMMENT);
    sb.write('QWERTY'.padRight(padRight));
    sb.write(separator);
    sb.writeln(QWERTY);
    sb.write('ASDF'.padRight(padRight));
    sb.write(separator);
    sb.writeln(ASDF);
    sb.write('POIU'.padRight(padRight));
    sb.write(separator);
    sb.writeln(POIU);
    sb.write('LKJH'.padRight(padRight));
    sb.write(separator);
    sb.writeln(LKJH);
    sb.write('MNB'.padRight(padRight));
    sb.write(separator);
    sb.writeln(MNB);
    sb.write('ZXCV'.padRight(padRight));
    sb.write(separator);
    sb.writeln(ZXCV);
    return sb.toString();
  }
}

class EnvDev extends Env {
  EnvDev() : super('dev') {
    // From .env.dev
    // >> BOOL = true
    // covered
    _BOOL = true;
    // From .env.dev
    // >> INT = asd
    _INT = "asd";
    // From .env.dev
    // >> SIGNED_INT = -asd
    _SIGNED_INT = "-asd";
    // From .env.dev
    // >> DOUBLE = 3.asd
    _DOUBLE = "3.asd";
    // From .env.dev
    // >> QWERTY = -0.343
    // specical
    _QWERTY = -0.343;
    // From .env.dev
    // >> ASDF = -0.343
    _ASDF = -0.343;
  }
}

class EnvProd extends Env {
  EnvProd() : super('prod') {
    // From .env.prod
    // >> BOOL = true
    // covered
    _BOOL = true;
    // From .env.prod
    // >> QWERTY = -0.343
    // specical
    _QWERTY = -0.343;
    // From .env.prod
    // >> ASDF = -0.343
    _ASDF = -0.343;
    // From .env.prod
    // >> POIU = -0.343
    _POIU = -0.343;
    // From .env.prod
    // >> LKJH = -0.343
    _LKJH = -0.343;
    // From .env.prod
    // >> MNB = -0.343
    _MNB = -0.343;
  }
}

class EnvStaging extends Env {
  EnvStaging() : super('staging') {
    // From .env.staging
    // >> BOOL = true
    // covered
    _BOOL = true;
    // From .env.staging
    // >> QWERTY = -0.343
    // specical
    _QWERTY = -0.343;
    // From .env.staging
    // >> ASDF = -0.343
    _ASDF = -0.343;
    // From .env.staging
    // >> ZXCV = -0.343
    _ZXCV = -0.343;
  }
}
