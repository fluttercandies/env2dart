grammar Env;

env: line*;
line: (comment NEWLINE)* key '=' value? comment? | NEWLINE;
key: KEY;
value: INT | DOUBLE | BOOLEAN | string;
comment: COMMENT;
string: SINGLE_QUOTE_STRING | DOUBLE_QUOTE_STRING | NO_QUOTE_STRING | KEY;
KEY: [A-Z_][A-Z0-9_]*;
NEWLINE: [\r\n]+;
COMMENT: '#' ~[\r\n]*;
INT: '-'? [0-9]+;
DOUBLE: '-'? [0-9]? '.' [0-9]+;
BOOLEAN: 'true' | 'false';
fragment ESC : '\\' ["\\/bfnrt];
SINGLE_QUOTE_STRING : '\'' (ESC | ~['\\])* '\'';
DOUBLE_QUOTE_STRING : '"' (ESC | ~["\\])* '"';
NO_QUOTE_STRING : ~[ \t\r\n#=]+;
WS: [ \t] -> skip;
