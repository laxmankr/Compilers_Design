%{
#include<stdio.h>
int words=0, space=0, vowels=0, line=0;
%}
%option noyywrap

%%
[\n]+ { words++; line++; }
[\t ' '] { space++; }
(A|E|I|O|U|a|e|i|o|u) vowels++;
. ;
%%

main(void)
{
yyin=fopen("q1.txt","r");
yylex();
fclose(yyin);
printf("No. of words : %d\n",words+space);
printf("No. of space : %d\n",space);
printf("No. of vowels: %d\n",vowels);
printf("No. of lines : %d\n",line);
}
