%{ 
    #include <stdlib.h> 
    void yyerror(char *); 
    #include "y.tab.h" 
%} 
%% 

[-]?[0-9]+(\.[0-9]+)?     {  yylval.p = atof(yytext); 
                return INTEGER; 
            }


[-+*^/(/)/\n] { return *yytext; }
   
[ \t]  
	; 
.               yyerror("invalid character"); 
%%
int yywrap(void) { 
    return 1; 
}

