%{
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#define YYSTYPE double
%}

%token VALID INVALID

%%
var: A
   ;

A : VALID {printf("Valid!\n");}
  ;
A : INVALID {printf("Invalid!!\n");}
  ;
%%


main()
{
  printf("Input the string to check:\n");
  yyparse();
  exit(0);
}

int yyerror(char *msg)
{
  exit(0);
}




