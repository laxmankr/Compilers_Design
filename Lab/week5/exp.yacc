%{
#include<string.h>
#include<stdio.h>

extern int lineNo;

int errno=0;
%}

%token NUM VAR RELOP
%token MAIN IF ELSE WHILE TYPE

%left '-' '+'

%left '*' '/'
 
%%
PROGRAM: MAIN BLOCK
;
BLOCK: '{'CODE'}'

;

CODE: BLOCK
	|STATEMENT CODE
	|STATEMENT
	;

STATEMENT:DECST';'
	|DECST {printf("\nLine number %d : syntax error",lineNo); errno++;}
	|ASSIGNMENT ';'

	|ASSIGNMENT {printf("\nLine number %d : syntax error",lineNo); errno++;}
	|CONDST
	|WHILEST

	;

DECST: TYPE VARLIST
	;
VARLIST: VAR ','VARLIST

	| VAR
	;
ASSIGNMENT:VAR'='EXPR
	;

EXPR: EXPR '+' EXPR

	| EXPR '-' EXPR
	| EXPR '*' EXPR
	| EXPR '/' EXPR

	| '-' EXPR
	| '(' EXPR ')'
	| VAR

	| NUM
	;

CONDST: IFST
	| IFST ELSEST
	;

IFST: IF '(' CONDITION ')'
	 BLOCK
	;

ELSEST: ELSE
	 BLOCK
	;

CONDITION: VAR RELOP VAR
	| VAR

	| NUM
	;

WHILEST: WHILELOOP
	;

WHILELOOP: WHILE '(' CONDITION ')'

	 BLOCK
	;
%%
extern FILE *yyin;

int main(int argc, char *argv[])
{

 FILE *fp;
 int i;
 if(argc>1)
 {

 fp = fopen(argv[1],"r");
 if(!fp)
 {

  printf("\n ***********File not found**********\n\n");
 }
 yyin = fp;
 }

 yyparse();
 if(errno==0)
  printf("\n************No errors found!*************\n\n");

 else
  printf("\n%d : **********Eerro found!************\n\n",errno);
 return(0);
}
 yyerror()
 {
  printf("\nSyntax Error on line :  %d\n",lineNo);
  errno++;
 }
