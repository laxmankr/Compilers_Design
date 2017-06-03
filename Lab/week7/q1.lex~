%{
#include "y.tab.h"
%}


%%

[a-zA-Z0-9]+ {yylval.string = yytext; return NUMBER;}
[ \t\n]               ;
"+"      return(PLUS);
"-"      return(MINUS);
"("      return(LEFT_PARENTHESIS);
")"      return(RIGHT_PARENTHESIS);
";"      return(END);


%%

int yyerror (char *s) {
	fprintf (stderr, "%s\n", s);
}

int main (void) {
	yyparse ( );
	return 0;
}
