%{
#include <stdio.h>
#include <stdlib.h>
int acount=0;
int bcount=0;
int c=0;

void yyerror (const char *str) {
	fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
	return 1;
}

main() {
	yyparse();
}

%}

%%

%token A B C;

line:   X Y Z '\n' { printf("$1: %d  $2 : %d \n",acount,bcount); c = acount-bcount; if(c!=0)printf("Syntax Accept\n"); else printf("Syntax Reject"); };
Y:	A Y  {acount++; }
	|A   {acount++; };
Z:	B Z  {bcount++; }
	|B   {bcount++; };
X:	C X
	|C;

%%
