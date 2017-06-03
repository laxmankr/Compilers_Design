%{
#include<stdio.h>
#include<string.h>
int size=0,i=0;
char* str=NULL;
%}
%option noyywrap


%%
[a-zA-Z]+ { 
printf("Length of ->>   %s    ->>  %d\n",yytext,yyleng);
if(yyleng>size) { size= yyleng; 
str=(char*)malloc(sizeof(char)*(yyleng) );
strcpy(str,yytext);} }
. ;
%%

main(void)
{
yyin=fopen("q3.txt","r");
yylex();
fclose(yyin);
printf("Size of longest word : %d\n",size);
printf("Longest word : %s\n",str);
}

