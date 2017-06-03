%{ 
    #include <stdlib.h> 
    void yyerror(char *); 
    #include "y.tab.h" 
%} 
%% 

[0-9]+      {  yylval.p = atof(yytext); 
                return INTEGER; 
            }
sin { yylval.p = atof(yytext); return SIN;}
cos { yylval.p = atof(yytext);return COS;}
tan { yylval.p = atof(yytext);return TAN;}
log { yylval.p = atof(yytext);return LOG;}


[-+*^/(/)/\n] { return *yytext; }
   
[ \t]  
	; 
.               yyerror("invalid character"); 
%%
int yywrap(void) { 
    return 1; 
}

