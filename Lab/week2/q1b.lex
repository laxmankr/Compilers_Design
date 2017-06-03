%{
#include<stdio.h>
int i=0, count=0;
%}
%option noyywrap

%%
"<"[^" ">]*\> { printf("Tag is  : "); for(i=1;i<yyleng-1;i++)printf("%c", yytext[i] ); printf("\n");}
"<"[^>]*[^>\n|" "]*\> {  printf("Tag is  : "); count=0; for(i=1;yytext[i]!='>';i++){ if(yytext[i]==' ')count++; if(count == 1){printf("\t Attribute is : "); count=2;} printf("%c", yytext[i]); }  printf("\n"); }
[a-zA-Z][a-zA-Z0-9|" "\n\{\}\(\)\:\;\%\.]*    printf("Data is : %s\n",yytext);
. ;
\n ;
%%

main(void)
{
yyin=fopen("q1b.html","r");
yylex();
fclose(yyin);
}
