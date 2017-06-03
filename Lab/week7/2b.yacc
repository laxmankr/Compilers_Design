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

%token A R;

line:  RJ '\n'| AC '\n' ;
RJ : R {printf("Syntax Reject\n");};
AC : A {printf("Syntax Accept\n");};


%%
