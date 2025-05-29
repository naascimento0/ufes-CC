grammar Aquecimento01;

begin:
  expr+
;
expr:
  OPENP expr CLOSEP
| TOKEN
;

OPENP  : '(' ;
CLOSEP : ')' ;
TOKEN  : 'a' ;
WS     : [ \t\n]+ -> skip ;