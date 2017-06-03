%{
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#define YYSTYPE double
%}

%token NUM SIN COS TAN LOG EXP
%left '+''-'
%left '*''/'
%left UMINUS

%%

s:	e'\n' {printf("%lf",$1);}
	;

e:e'+'e 										{$$=$1+$3;}
 |e'*'e 										{$$=$1*$3;}
 |e'-'e 										{$$=$1-$3;}
 |SIN'('NUM')'										{$$=sin($3/180*22/7);}
 |COS'('NUM')'										{$$=cos($3/180*22/7);}
 |TAN'('NUM')'										{$$=tan($3/180*22/7);}
 |LOG'('NUM')'										{$$=log($3);}
 |EXP'('NUM')'										{$$=exp($3);}
 |e '^' e 										{int i,j=$1;
 											for(i=1;i<$3;i++)
  												{
  												j=j*$1;
  												$$=j;
  														}
  												}
 |e'/'e 											{$$=$1/$3;}
 |'('e')' 											{$$=$2;}
 | '-'e %prec UMINUS 								{$$ = -$2;}
 |NUM
 ;
%%

int yylex()
{
	int c;
	while((c = getchar()) == ' ');
	if((c == '.') || (isdigit(c)))
	{
		ungetc(c,stdin);
		scanf("%lf",&yylval);
		return NUM;
	}
	if(c == 's')
		if((c = getchar()) == 'i')
			if((c = getchar()) == 'n')
				return SIN;	
	if(c == 'c')
		if((c = getchar()) == 'o')
			if((c = getchar()) == 's')
				return COS;
	if(c == 't')
		if((c = getchar()) == 'a')
			if((c = getchar()) == 'n')
				return TAN;
	if(c == 'l')
		if((c = getchar()) == 'o')
			if((c = getchar()) == 'g')
				return LOG;
	if(c == 'e')
		if((c = getchar()) == 'x')
			if((c = getchar()) == 'p')
				return EXP;
	return c;
}

int main()
{
	printf("Write The Expression You Want To Compute\n");
	yyparse();
	return 1;
}

int yyerror()
{
	return 1;
}

int yywrap()
{
	return 1;
}