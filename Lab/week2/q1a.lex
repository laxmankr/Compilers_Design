%{
#include<stdio.h>
int i=0;
%}
%option noyywrap

%%
"<"[^>]*> { printf("Tag      : "); for(i=1;i<yyleng-1;i++)printf("%c", yytext[i] ); printf("\n"); } 
[a-zA-Z][a-zA-Z0-9|" "\n\{\}\(\)\:\;\%\.]*    printf("Data     : %s\n",yytext);
. ;
\n ;
%%

main(void)
{
yyin=fopen("q1a.txt","r");
yylex();
fclose(yyin);
}
