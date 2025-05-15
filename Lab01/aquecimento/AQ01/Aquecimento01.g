lexer grammar Aquecimento01;

COMMENT : '#'~[\n]* -> skip;
TEXT    : . { System.out.print(getText()); };