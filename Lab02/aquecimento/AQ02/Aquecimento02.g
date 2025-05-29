grammar Aquecimento02;

begin:
  expr+
;

expr:
  expr SUM term
| expr SUB term
| term
;

term:
  term MUL factor
| term DIV factor
| factor
;

factor:
  OPENP expr CLOSEP
| INT_VAL
;

INT_VAL : [0-9]+ ;
SUM     : '+' ;
SUB     : '-' ;
MUL     : '*' ;
DIV     : '/' ;
OPENP   : '(' ;
CLOSEP  : ')' ;
WS      : [ \t\n]+ -> skip ;