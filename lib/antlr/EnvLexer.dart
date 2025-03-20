// Generated from ./antlr/Env.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class EnvLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.2', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_KEY = 2, TOKEN_NEWLINE = 3, TOKEN_COMMENT = 4, 
    TOKEN_INT = 5, TOKEN_DOUBLE = 6, TOKEN_BOOLEAN = 7, TOKEN_SINGLE_QUOTE_STRING = 8, 
    TOKEN_DOUBLE_QUOTE_STRING = 9, TOKEN_NO_QUOTE_STRING = 10, TOKEN_WS = 11;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'KEY', 'NEWLINE', 'COMMENT', 'INT', 'DOUBLE', 'BOOLEAN', 'ESC', 
    'SINGLE_QUOTE_STRING', 'DOUBLE_QUOTE_STRING', 'NO_QUOTE_STRING', 'WS'
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


  EnvLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'Env.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,11,109,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
      6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,1,0,1,0,1,1,1,1,
      5,1,30,8,1,10,1,12,1,33,9,1,1,2,4,2,36,8,2,11,2,12,2,37,1,3,1,3,5,
      3,42,8,3,10,3,12,3,45,9,3,1,4,3,4,48,8,4,1,4,4,4,51,8,4,11,4,12,4,
      52,1,5,3,5,56,8,5,1,5,3,5,59,8,5,1,5,1,5,4,5,63,8,5,11,5,12,5,64,1,
      6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,3,6,76,8,6,1,7,1,7,1,7,1,8,1,8,1,
      8,5,8,84,8,8,10,8,12,8,87,9,8,1,8,1,8,1,9,1,9,1,9,5,9,94,8,9,10,9,
      12,9,97,9,9,1,9,1,9,1,10,4,10,102,8,10,11,10,12,10,103,1,11,1,11,1,
      11,1,11,0,0,12,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,0,17,8,19,9,21,10,
      23,11,1,0,9,2,0,65,90,95,95,3,0,48,57,65,90,95,95,2,0,10,10,13,13,
      1,0,48,57,8,0,34,34,47,47,92,92,98,98,102,102,110,110,114,114,116,
      116,2,0,39,39,92,92,2,0,34,34,92,92,5,0,9,10,13,13,32,32,35,35,61,
      61,2,0,9,9,32,32,121,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,0,
      0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,17,1,0,0,0,0,19,1,0,0,0,
      0,21,1,0,0,0,0,23,1,0,0,0,1,25,1,0,0,0,3,27,1,0,0,0,5,35,1,0,0,0,7,
      39,1,0,0,0,9,47,1,0,0,0,11,55,1,0,0,0,13,75,1,0,0,0,15,77,1,0,0,0,
      17,80,1,0,0,0,19,90,1,0,0,0,21,101,1,0,0,0,23,105,1,0,0,0,25,26,5,
      61,0,0,26,2,1,0,0,0,27,31,7,0,0,0,28,30,7,1,0,0,29,28,1,0,0,0,30,33,
      1,0,0,0,31,29,1,0,0,0,31,32,1,0,0,0,32,4,1,0,0,0,33,31,1,0,0,0,34,
      36,7,2,0,0,35,34,1,0,0,0,36,37,1,0,0,0,37,35,1,0,0,0,37,38,1,0,0,0,
      38,6,1,0,0,0,39,43,5,35,0,0,40,42,8,2,0,0,41,40,1,0,0,0,42,45,1,0,
      0,0,43,41,1,0,0,0,43,44,1,0,0,0,44,8,1,0,0,0,45,43,1,0,0,0,46,48,5,
      45,0,0,47,46,1,0,0,0,47,48,1,0,0,0,48,50,1,0,0,0,49,51,7,3,0,0,50,
      49,1,0,0,0,51,52,1,0,0,0,52,50,1,0,0,0,52,53,1,0,0,0,53,10,1,0,0,0,
      54,56,5,45,0,0,55,54,1,0,0,0,55,56,1,0,0,0,56,58,1,0,0,0,57,59,7,3,
      0,0,58,57,1,0,0,0,58,59,1,0,0,0,59,60,1,0,0,0,60,62,5,46,0,0,61,63,
      7,3,0,0,62,61,1,0,0,0,63,64,1,0,0,0,64,62,1,0,0,0,64,65,1,0,0,0,65,
      12,1,0,0,0,66,67,5,116,0,0,67,68,5,114,0,0,68,69,5,117,0,0,69,76,5,
      101,0,0,70,71,5,102,0,0,71,72,5,97,0,0,72,73,5,108,0,0,73,74,5,115,
      0,0,74,76,5,101,0,0,75,66,1,0,0,0,75,70,1,0,0,0,76,14,1,0,0,0,77,78,
      5,92,0,0,78,79,7,4,0,0,79,16,1,0,0,0,80,85,5,39,0,0,81,84,3,15,7,0,
      82,84,8,5,0,0,83,81,1,0,0,0,83,82,1,0,0,0,84,87,1,0,0,0,85,83,1,0,
      0,0,85,86,1,0,0,0,86,88,1,0,0,0,87,85,1,0,0,0,88,89,5,39,0,0,89,18,
      1,0,0,0,90,95,5,34,0,0,91,94,3,15,7,0,92,94,8,6,0,0,93,91,1,0,0,0,
      93,92,1,0,0,0,94,97,1,0,0,0,95,93,1,0,0,0,95,96,1,0,0,0,96,98,1,0,
      0,0,97,95,1,0,0,0,98,99,5,34,0,0,99,20,1,0,0,0,100,102,8,7,0,0,101,
      100,1,0,0,0,102,103,1,0,0,0,103,101,1,0,0,0,103,104,1,0,0,0,104,22,
      1,0,0,0,105,106,7,8,0,0,106,107,1,0,0,0,107,108,6,11,0,0,108,24,1,
      0,0,0,15,0,31,37,43,47,52,55,58,64,75,83,85,93,95,103,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}