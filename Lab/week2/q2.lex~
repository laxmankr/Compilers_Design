%{
#include<stdio.h>

%}
%option noyywrap

%%
"/*"[^"/"]*"/"|"//". 				printf("Comments    : %s\n",yytext );
\(|\{|\}|\)					printf("Braces      : %s\n",yytext );
INT|int|FLOAT|float 				printf("Data type   : %s\n",yytext );
if     						printf("Conditional : %s\n",yytext );
for|while 					printf("Loop 	    : %s\n",yytext );
[<>]|"=="|"<="|">="   				printf("Relation    : %s\n",yytext );
\=    						printf("Assignment  : %s\n",yytext );
[\+|\-|\*|"/"|\+\=|\-\=|\*\=] 			printf("Arithmetic  : %s\n",yytext );
^[A-Za-z][A-Za-z_ 0-9]*"("[^\;0-9=]*")" 	printf("Function    : %s\n",yytext );
. ;
\n ;
%%

main(void)
{
printf("\n______________________________________________________________________________\n");
yyin=fopen("q2.c","r");
yylex();
fclose(yyin);
printf("______________________________________________________________________________\n\n");
}
