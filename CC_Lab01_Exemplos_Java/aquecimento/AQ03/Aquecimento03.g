lexer grammar Aquecimento03;

fragment START   : '0x' | '0X' ;

fragment DIGITS  : [0-9] ;

fragment LETTERS : [a-fA-F] ;

fragment HEXES   : DIGITS | LETTERS ;

WS    : [ \t\n]+ -> skip ;
HEX   : START HEXES HEXES HEXES HEXES HEXES HEXES HEXES HEXES ;