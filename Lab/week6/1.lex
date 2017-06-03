%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
insert					return INSERT;
into					return INTO;
values					return VALUES;

[,]						return *yytext;
[()] return *yytext;
"'"?[a-zA-Z]?[a-zA-Z0-9]+"'"?	return IDENTIFIER;
\n						return *yytext;
[ \t]+					/* ignore whitespace */;
%%
