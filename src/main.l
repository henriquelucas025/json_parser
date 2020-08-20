
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

ESP    [[:space:]]*
digit  [0-9]
NUMERO ({digit}*[.]*{digit}+)
ST     [A-Za-z]+[0-9]*
STRING ({ST}+{ESP}{ST}*)

%%

\} { return '}'; }
\{ { return '{'; }

\] { return ']'; }
\[ { return '['; }

[:] { return ':'; }
[,] { return ','; }


{NUMERO} { return NUM; }
{STRING} {return STR; }


\"     { return '"'; }
[\n]   { return '\n'; }



[[:space:]]+ ;
. ;


%%

int yywrap() {
  return 1;
}
