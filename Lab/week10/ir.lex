%{
#include "y.tab.h"
extern char yyval;
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
%}

NUMBER \-?[0-9]+(.[0-9]+)?
LETTER [a-zA-Z]+

%%
(else) {return ELSE;}
(if) {return IF;}
(>=) {return GEQ;}
(<=) {return LEQ;}
(==) {return EQ;}
(<) {return LT;}
(>) {return GT;}
(!=) {return NEQ;}
(!) {return NOT;}
(\|\|) {return OR;}
(&&) {return AND;}
(while) {return WHILE;}
(int) {return INT;}
(float) {return FLOAT;}
{NUMBER} {yylval.sym=yytext; return NUMBER;}
{LETTER} {yylval.sym=(char*)malloc((sizeof(yytext)+1)*sizeof(char));memcpy(yylval.sym,yytext,(sizeof(yytext)+1)*sizeof(char)); return LETTER;}
[ \t\v\n\f]		{}
. {return yytext[0];}

%%