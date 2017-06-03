%token <p> INTEGER 
%left '+' '-' 
%left '*' '/'
%left '^'
%type <p> program
%type <p> statement 
%type <p> expr
%{ 
#include<stdio.h>
#include<stdlib.h>
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
       expr                      { printf("Output is : %lf\n", $1); } 
        ;
expr: 
        INTEGER
        | expr expr  '+'         { $$ = $1 + $2; } 
        | expr expr  '-'         { $$ = $1 - $2; } 
        | expr expr  '*'         { $$ = $1 * $2; } 
        | expr expr  '/'         { $$ = $1 / $2; }
	| expr expr  '^'         { $$ = pow($1,$2); }
        | '(' expr ')'           { $$ = $2; } 
        ;
%% 
void yyerror(char *s) { 
    fprintf(stderr, "%s\n", s); 
} 
int main(void) { 
    yyparse(); 
    return 0; 
} 

