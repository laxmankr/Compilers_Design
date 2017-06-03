%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
a				return A;
b				return B;
c				return C;
\n				return *yytext;
[ \t]+				/* ignore whitespace */;
%%
