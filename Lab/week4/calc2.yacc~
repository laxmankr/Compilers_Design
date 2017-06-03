%token SIN COS TAN LOG 
%token <p> INTEGER 
%left '+' '-' 
%left '*' '/'
%left '^'
%type <p> program
%type <p> statement 
%type <p> expr
%{ 
#include<stdio.h>
#include<math.h>
#define PI 3.14
    void yyerror(char *); 
    int yylex(void); 
    int sym[26]; 
%} 
%union{
double p;
}
%% 
program: 
        program statement '\n' 
        | 
        ;
statement: 
       expr                      { printf("%lf\n", $1); } 
        ;
expr: 
        INTEGER
        | expr '+' expr           { $$ = $1 + $3;printf("$$ : %d ->> $1 : %d + $2 : %d\n",$$,$1,$3); } 
        | expr '-' expr           { $$ = $1 - $3;printf("$$ : %d ->> $1 : %d + $2 : %d\n",$$,$1,$3); } 
        | expr '*' expr           { $$ = $1 * $3;printf("$$ : %d ->> $1 : %d + $2 : %d\n",$$,$1,$3); } 
        | expr '/' expr           { $$ = $1 / $3;printf("$$ : %d ->> $1 : %d + $2 : %d\n",$$,$1,$3); }
        | expr '^' expr           { $$ = pow($1,$3);printf("$$ : %d ->> $1 : %d + $2 : %d\n",$$,$1,$3); }
	| SIN expr               { $$ = sin($2*PI/180);}
	| COS expr               { $$ = cos($2*PI/180);}
	| TAN expr               { $$ = tan($2*PI/180);}
	| LOG expr               { $$ = log($2);}
        | '(' expr ')'           { $$ = $2;printf("$$ : %d ->> $2 : %d\n",$$,$2); } 
        ;
%% 
void yyerror(char *s) { 
    fprintf(stderr, "%s\n", s); 
} 
int main(void) { 
    yyparse(); 
    return 0; 
} 

