lexer grammar Aquecimento04;

fragment DIGITS : [0-9][0-9][0-9][0-9] ;

fragment LETTERS : [A-Z][A-Z][A-Z] ;

WS    : [ \t\n]+ -> skip ;
PLACA : LETTERS '-' DIGITS ;