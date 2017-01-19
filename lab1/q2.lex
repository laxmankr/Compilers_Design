%{
#include<stdio.h>
int poi=0, nei=0, pof=0, nef=0;
%}
%option noyywrap

%%
"+"?[0-9]+ poi++;
"-"[0-9]+ nei++;
"+"?[0-9]+"."[0-9]+ pof++;
"-"[0-9]+"."[0-9]+ nef++;
. ;
%%

main(void)
{
yyin=fopen("q2.txt","r");
yylex();
fclose(yyin);
printf("No. of poi : %d\n",poi);
printf("No. of nei : %d\n",nei);
printf("No. of pof : %d\n",pof);
printf("No. of nef : %d\n",nef);
}

