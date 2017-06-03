%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[abc]*aa+[abc]*				return R;
[abc]*bb+[abc]*				return R;
[abc]*cc+[abc]*				return R;
\n				        return *yytext;
[ \t]+				/* ignore whitespace */;
.*                   	        return A;
%%
