%{
#include"y.tab.h"
#include<stdio.h>
int lineNo=1;
%}

identifier[a-zA-Z][_a-zA-Z0-9]*

number [0-9]+|([0-9]*\.[0-9]+)

%%

main\(\) return MAIN;
if return IF;
else return ELSE;

while return WHILE;

int |
char |
flaot return TYPE;

{identifier} return VAR;
{number} return NUM;
\> |
\< |
\<= |
\>= |
== return RELOP;
[\t] ;
[\n] lineNo++;
. return yytext[0];
%%

