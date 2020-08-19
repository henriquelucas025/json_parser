
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

digit [0-9]
INTEIRO {digit}+
FLOAT ({digit}*[.]{digit}+)

%%

\} { return '}'; }
\{ { return '{'; }

\] { return ']'; }
\[ { return '['; }

[:] { return ':'; }
[,] { return ','; }


{INTEIRO} { return INT; }
{FLOAT} { return FLO; }
[A-Za-z]+ {return STR; }


\" { return '"'; }
[\n]   { return '\n'; }


[[:space:]]+ ;
. ;


%%

int yywrap() {
  return 1;
}
