grammar Aquecimento03;

begin:
  statement+
;
statement:
  ifstmt
| OTHER
;
ifstmt:
  IF OPENP expr CLOSEP statement
| IF OPENP expr CLOSEP statement ELSE statement
;
expr:
  ZERO
| ONE
;

OPENP   : '(' ;
CLOSEP  : ')' ;
ZERO    : '0' ;
ONE     : '1' ;
IF      : 'if' ;
ELSE    : 'else' ;
OTHER   : 'other' ;
WS      : [ \t\n]+ -> skip ;