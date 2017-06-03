%{
#include<stdio.h>
#include<string.h>
int noprt=0, nopnd=0,valid=1,top=-1,l=0,j=0;
char opnd[10][10],oprt[10][10],a[100];
int last_oprt=1, last_opnd=0;
%}
%option noyywrap
%%

"(" {top++;a[top]='(';}
"{" {top++;a[top]='{';}
"[" {top++;a[top]='[';}
")" {if (a[top]!='(') { valid=0; return;}
         else
            top--;
    }
"}" {if (a[top]!='{')
      { valid=0; return;}
         else
            top--;
    }
"]" {if (a[top]!='[')
      { valid=0; return;}
         else
            top--;
    }
"+"|"-"|"*"|"/" { if(last_oprt==1){valid=0; return;}
			else{ noprt++; strcpy(oprt[l],yytext); l++; last_oprt=1; last_opnd=0;}}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* { if(last_opnd==1){valid=0; return;}
				else{nopnd++; strcpy(opnd[j],yytext); j++; last_opnd=1;last_oprt=0;}}
%%

main()
{
int k;
printf("Enter the arithmetic expression & then Press [Ctrl+d] : ");//After giving the the input Press [Enter]+[ctrl+d] 
yylex();
if(valid==1 && top==-1 && (nopnd-noprt)==1)
{
printf("\nThe expression is valid\n");
printf("\nThe operators are : ");
for(k=0;k<l;k++)
  printf("%s   ",oprt[k]);
printf("\n");
  printf("\nThe operands are : ");
for(k=0;k<j;k++)
  printf("%s   ",opnd[k]);
printf("\n\n");
}
else printf("The expression is invalid\n\n");
}

