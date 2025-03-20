// Generated from ./antlr/Env.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'EnvVisitor.dart';
import 'EnvBaseVisitor.dart';
const int RULE_env = 0, RULE_line = 1, RULE_key = 2, RULE_value = 3, RULE_comment = 4, 
          RULE_string = 5;
class EnvParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.2', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_KEY = 2, TOKEN_NEWLINE = 3, TOKEN_COMMENT = 4, 
                   TOKEN_INT = 5, TOKEN_DOUBLE = 6, TOKEN_BOOLEAN = 7, TOKEN_SINGLE_QUOTE_STRING = 8, 
                   TOKEN_DOUBLE_QUOTE_STRING = 9, TOKEN_NO_QUOTE_STRING = 10, 
                   TOKEN_WS = 11;

  @override
  final List<String> ruleNames = [
    'env', 'line', 'key', 'value', 'comment', 'string'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'='"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, "KEY", "NEWLINE", "COMMENT", "INT", "DOUBLE", "BOOLEAN", 
      "SINGLE_QUOTE_STRING", "DOUBLE_QUOTE_STRING", "NO_QUOTE_STRING", "WS"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Env.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  EnvParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  EnvContext env() {
    dynamic _localctx = EnvContext(context, state);
    enterRule(_localctx, 0, RULE_env);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 15;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 28) != 0)) {
        state = 12;
        line();
        state = 17;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LineContext line() {
    dynamic _localctx = LineContext(context, state);
    enterRule(_localctx, 2, RULE_line);
    int _la;
    try {
      state = 35;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_KEY:
      case TOKEN_COMMENT:
        enterOuterAlt(_localctx, 1);
        state = 23;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_COMMENT) {
          state = 18;
          comment();
          state = 19;
          match(TOKEN_NEWLINE);
          state = 25;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 26;
        key();
        state = 27;
        match(TOKEN_T__0);
        state = 29;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 2, context)) {
        case 1:
          state = 28;
          value();
          break;
        }
        state = 32;
        errorHandler.sync(this);
        switch (interpreter!.adaptivePredict(tokenStream, 3, context)) {
        case 1:
          state = 31;
          comment();
          break;
        }
        break;
      case TOKEN_NEWLINE:
        enterOuterAlt(_localctx, 2);
        state = 34;
        match(TOKEN_NEWLINE);
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  KeyContext key() {
    dynamic _localctx = KeyContext(context, state);
    enterRule(_localctx, 4, RULE_key);
    try {
      enterOuterAlt(_localctx, 1);
      state = 37;
      match(TOKEN_KEY);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ValueContext value() {
    dynamic _localctx = ValueContext(context, state);
    enterRule(_localctx, 6, RULE_value);
    try {
      state = 43;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 39;
        match(TOKEN_INT);
        break;
      case TOKEN_DOUBLE:
        enterOuterAlt(_localctx, 2);
        state = 40;
        match(TOKEN_DOUBLE);
        break;
      case TOKEN_BOOLEAN:
        enterOuterAlt(_localctx, 3);
        state = 41;
        match(TOKEN_BOOLEAN);
        break;
      case TOKEN_KEY:
      case TOKEN_SINGLE_QUOTE_STRING:
      case TOKEN_DOUBLE_QUOTE_STRING:
      case TOKEN_NO_QUOTE_STRING:
        enterOuterAlt(_localctx, 4);
        state = 42;
        string();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  CommentContext comment() {
    dynamic _localctx = CommentContext(context, state);
    enterRule(_localctx, 8, RULE_comment);
    try {
      enterOuterAlt(_localctx, 1);
      state = 45;
      match(TOKEN_COMMENT);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StringContext string() {
    dynamic _localctx = StringContext(context, state);
    enterRule(_localctx, 10, RULE_string);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 47;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 1796) != 0))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,11,50,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,1,0,5,0,
      14,8,0,10,0,12,0,17,9,0,1,1,1,1,1,1,5,1,22,8,1,10,1,12,1,25,9,1,1,
      1,1,1,1,1,3,1,30,8,1,1,1,3,1,33,8,1,1,1,3,1,36,8,1,1,2,1,2,1,3,1,3,
      1,3,1,3,3,3,44,8,3,1,4,1,4,1,5,1,5,1,5,0,0,6,0,2,4,6,8,10,0,1,2,0,
      2,2,8,10,51,0,15,1,0,0,0,2,35,1,0,0,0,4,37,1,0,0,0,6,43,1,0,0,0,8,
      45,1,0,0,0,10,47,1,0,0,0,12,14,3,2,1,0,13,12,1,0,0,0,14,17,1,0,0,0,
      15,13,1,0,0,0,15,16,1,0,0,0,16,1,1,0,0,0,17,15,1,0,0,0,18,19,3,8,4,
      0,19,20,5,3,0,0,20,22,1,0,0,0,21,18,1,0,0,0,22,25,1,0,0,0,23,21,1,
      0,0,0,23,24,1,0,0,0,24,26,1,0,0,0,25,23,1,0,0,0,26,27,3,4,2,0,27,29,
      5,1,0,0,28,30,3,6,3,0,29,28,1,0,0,0,29,30,1,0,0,0,30,32,1,0,0,0,31,
      33,3,8,4,0,32,31,1,0,0,0,32,33,1,0,0,0,33,36,1,0,0,0,34,36,5,3,0,0,
      35,23,1,0,0,0,35,34,1,0,0,0,36,3,1,0,0,0,37,38,5,2,0,0,38,5,1,0,0,
      0,39,44,5,5,0,0,40,44,5,6,0,0,41,44,5,7,0,0,42,44,3,10,5,0,43,39,1,
      0,0,0,43,40,1,0,0,0,43,41,1,0,0,0,43,42,1,0,0,0,44,7,1,0,0,0,45,46,
      5,4,0,0,46,9,1,0,0,0,47,48,7,0,0,0,48,11,1,0,0,0,6,15,23,29,32,35,
      43
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class EnvContext extends ParserRuleContext {
  List<LineContext> lines() => getRuleContexts<LineContext>();
  LineContext? line(int i) => getRuleContext<LineContext>(i);
  EnvContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_env;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitEnv(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class LineContext extends ParserRuleContext {
  KeyContext? key() => getRuleContext<KeyContext>(0);
  List<CommentContext> comments() => getRuleContexts<CommentContext>();
  CommentContext? comment(int i) => getRuleContext<CommentContext>(i);
  List<TerminalNode> NEWLINEs() => getTokens(EnvParser.TOKEN_NEWLINE);
  TerminalNode? NEWLINE(int i) => getToken(EnvParser.TOKEN_NEWLINE, i);
  ValueContext? value() => getRuleContext<ValueContext>(0);
  LineContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_line;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitLine(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class KeyContext extends ParserRuleContext {
  TerminalNode? KEY() => getToken(EnvParser.TOKEN_KEY, 0);
  KeyContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_key;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitKey(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ValueContext extends ParserRuleContext {
  TerminalNode? INT() => getToken(EnvParser.TOKEN_INT, 0);
  TerminalNode? DOUBLE() => getToken(EnvParser.TOKEN_DOUBLE, 0);
  TerminalNode? BOOLEAN() => getToken(EnvParser.TOKEN_BOOLEAN, 0);
  StringContext? string() => getRuleContext<StringContext>(0);
  ValueContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_value;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitValue(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class CommentContext extends ParserRuleContext {
  TerminalNode? COMMENT() => getToken(EnvParser.TOKEN_COMMENT, 0);
  CommentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_comment;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitComment(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class StringContext extends ParserRuleContext {
  TerminalNode? SINGLE_QUOTE_STRING() => getToken(EnvParser.TOKEN_SINGLE_QUOTE_STRING, 0);
  TerminalNode? DOUBLE_QUOTE_STRING() => getToken(EnvParser.TOKEN_DOUBLE_QUOTE_STRING, 0);
  TerminalNode? NO_QUOTE_STRING() => getToken(EnvParser.TOKEN_NO_QUOTE_STRING, 0);
  TerminalNode? KEY() => getToken(EnvParser.TOKEN_KEY, 0);
  StringContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_string;
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is EnvVisitor<T>) {
     return visitor.visitString(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

