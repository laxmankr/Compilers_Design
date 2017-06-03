%{
#include <stdio.h>

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

line:   X Y '\n' {printf("Syntax Correct\n");};
X:	A X B B 
	|A B B   {printf("x\n");};
Y:	C Y
	|C	 {printf("y\n");};

%%
