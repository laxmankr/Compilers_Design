%{
#include<stdio.h>
int valid=0, i=0, yr=0;
%}
%option noyywrap

%%
([0-2][0-9]|30)\/((0?(4|6|9))|11)\/([0-2][0-9]{3}) printf("%s is Valid\n",yytext);
([0-2][0-9]|30|31)\/((0?(1|3|5|7|8))|12)\/([0-2][0-9]{3}) printf("%s is Valid\n",yytext);
[0-2][0-8]\/0?2\/[0-2][0-3]{3} printf("%s is valid\n",yytext);
29\/0?2\/[0-2][0-9]{3} {
while(yytext[i]!='/')i++;i++;
while(yytext[i]!='/')i++;i++;
while(i<yyleng)
yr=(yr*10)+(yytext[i++] - '0');
if((yr%100 == 0 && yr%400 ==0) || (yr%100!=0 && yr%4==0))
printf("%s  is leep year\n",yytext);
else printf("%s is not a leep year\n",yytext);
i=0;yr=0;
}

.* printf("%s is Invalid\n",yytext);

%%
main()
{
yyin=fopen("date.txt","r");
yylex();
fclose(yyin);
}
