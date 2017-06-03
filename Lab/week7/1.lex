%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
a					return A;
b					return B;
c					return C;

[,]					return *yytext;
[()] return *yytext;
"'"?[a-zA-Z]?[a-zA-Z0-9]+"'"?	return IDENTIFIER;
\n						return *yytext;
[ \t]+					/* ignore whitespace */;
%%
