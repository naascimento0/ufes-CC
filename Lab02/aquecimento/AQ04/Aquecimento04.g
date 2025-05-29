grammar Aquecimento04;

begin:
  expr+ { System.out.println($expr.result); }
;
expr returns [int result]:
  a1=expr SUM a2=expr { $result = $a1.result + $a2.result; }
| INT_VAL { $result = Integer.valueOf($INT_VAL.text); }
;

INT_VAL : [0-9]+ ;
SUM     : '+' ;
WS      : [ \t\n]+ -> skip ;