%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char type[10][100],word[1000][100];
int map[1000], file=0, check=1, t=-1, w=0, i=0,ch=0, grammar=0;;

%}

%%
[" "] 	{ check=0; }
[\n] 	{ check=1; }
[a-zA-Z]+	{if(check==1 && file==0){ t++; strcpy(type[t],yytext);}
		else if(check==0 && file==0){strcpy(word[w],yytext); map[w]=t; w++;}
		else if(file==1){
			printf("\n");
			for(i=0;i<w;i++){
				if(!strcmp(word[i],yytext)){ printf("%s	   :    %s \n",yytext, type[map[i]]); break;}
								
		}
	}	
}
. ;
%%

/*int main()
{
	
	printf("\n\n");
  yyin=fopen("table.txt","r");
   yylex();
	printf("\n\n");
fclose(yyin);
}*/
int main(void)
                {
                 yyin=fopen("table.txt","r");

                while( yylex() ) ;
                 return 0 ;
        }


int yywrap() {
        fclose(yyin);
        grammar = 1 ;
        if( ch == 0 ) { yyin = fopen("test.txt","r") ; ch = 1 ; file=1; return 0 ; }
        else        return 1;
}
	