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

%token INSERT INTO VALUES IDENTIFIER;

line: insert into name '('attr')' values '('vls')' '\n' { $$=$5-$9; if($$==0)printf("Syntax Correct\n"); };

insert: INSERT;

into: INTO;

name: IDENTIFIER;

attr: attr',' IDENTIFIER {$$=1+$1;}
	|IDENTIFIER	{$$=1;};

values: VALUES;

vls: vls',' IDENTIFIER {$$=1+$1;}
	|IDENTIFIER {$$=1;};



%%
