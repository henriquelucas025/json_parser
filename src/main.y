

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '[' ']' ',' ':' '{' '}' '"' NUM STR '\n'

%%
S: 
 A '\n' { printf("VALIDO\n"); }
 ;



A:
 NUM {}
 | '"' STR '"' {}
 | A ',' A     {}
 | A ':' A     {}
 | A '\n'      {}
 | '{' A '}'   {}
 | '[' A ']'   {}
 |
 ;
%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
