

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '[' ']' ',' ':' '{' '}' '"' INT FLO STR '\n'

%%
S: 
 J '\n' { printf("VALIDO\n"); }


J:
 '{' C '}' {}
 | '[' C ']' {}
 ;

C:
 A {}
 |
 ;

A:
 INT {}
 | A '\n' {}
 | '\n' A {}
 | '"' STR '"' {}
 | A ',' A {}
 | A ':' A {}
 | J {}
 | FLO {}
 ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
