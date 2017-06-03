%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>

FILE* yyin;
void ThreeAddressCode();
void initialise();
void push();
void pop();
char* AddToTable(char* ,char*, char*);
char* label1;
char* label2;
char* prev_label1;
char* prev_label2;
char* istab;
int ind=0;
char* temp;
struct incod
{
	char* opd1;
	char* opd2;
	char* opr;
};
%}

%union
{
	char* sym;
}
%token INT FLOAT WHILE OR AND NOT NEQ EQ GEQ LEQ GT LT IF ELSE
%token <sym> LETTER NUMBER
%type <sym> expr bexp var
%left '-' '+' OR
%right '*' '/' AND
%nonassoc NOT
%%
start: declarations statements
	;
declarations: declaration declarations
	| declaration
	;
declaration: type LETTER ';'
	;
type: INT
	| FLOAT
	;
statements: statement statements
	| statement
	;
statement: LETTER '=' expr ';' {AddToTable($1,$3,"=");}
	| WHILE '(' bexp ')' {push();label1=(char*)malloc(2*sizeof(char));memcpy(label1,AddToTable($3,"","if"),2*sizeof(char));label2=(char*)malloc(2*sizeof(char));memcpy(label2,AddToTable("","","else"),2*sizeof(char));AddToTable(label1,"","label");AddToTable("","","indent");} '{' statements '}' {AddToTable($3,label1,"while");AddToTable("","","unindent");AddToTable(label2,"","label");AddToTable("","","indent");pop();}
	| IF '(' bexp ')' {push();label1=(char*)malloc(2*sizeof(char));memcpy(label1,AddToTable($3,"","if"),2*sizeof(char));label2=(char*)malloc(2*sizeof(char));memcpy(label2,AddToTable("","","else"),2*sizeof(char));AddToTable(label1,"","label");AddToTable("","","indent");} '{' statements '}' ELSE {AddToTable("","","unindent");AddToTable(label2,"","label");AddToTable("","","indent");} '{' statements '}' {AddToTable("","","unindent");pop();}
	;
bexp: bexp AND bexp {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"&&"),2*sizeof(char));}
	| bexp OR bexp {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"||"),2*sizeof(char));}
	| NOT bexp {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($2,"","!"),2*sizeof(char));}
	| var GT var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,">"),2*sizeof(char));}
	| var LT var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"<"),2*sizeof(char));}
	| var GEQ var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,">="),2*sizeof(char));}
	| var LEQ var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"<="),2*sizeof(char));}
	| var EQ var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"=="),2*sizeof(char));}
	| var NEQ var {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"!="),2*sizeof(char));}
	;
var: LETTER {$$=(char*)malloc((sizeof($1)+1)*sizeof(char));memcpy($$,$1,(sizeof($1)+1)*sizeof(char));}
	| NUMBER {$$=(char*)malloc((sizeof($1)+1)*sizeof(char));memcpy($$,$1,(sizeof($1)+1)*sizeof(char));}
	;
expr: expr '+' expr {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"+"),2*sizeof(char));}
	| expr '-' expr {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"-"),2*sizeof(char));}
	| expr '*' expr {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"*"),2*sizeof(char));}
	| expr '/' expr {$$=(char*)malloc(2*sizeof(char));memcpy($$,AddToTable($1,$3,"/"),2*sizeof(char));}
	| '(' expr ')' {$$=(char*)malloc(1*sizeof(char));memcpy($$,$2,1*sizeof(char));}
	| NUMBER {$$=(char*)malloc((sizeof($1)+1)*sizeof(char));memcpy($$,$1,(sizeof($1)+1)*sizeof(char));}
	| LETTER {$$=(char*)malloc((sizeof($1)+1)*sizeof(char));memcpy($$,$1,(sizeof($1)+1)*sizeof(char));}
	;

%%

yyerror(char *s)
{
printf("%s\n",s);
exit(0);
}

struct incod code[9999];

int id=0;

char* AddToTable(char* opd1,char* opd2,char* opr)
{
code[ind].opd1=(char*)malloc((sizeof(opd1)+1)*sizeof(char));
memcpy(code[ind].opd1,opd1,sizeof(opd1)+1);

code[ind].opd2=(char*)malloc((sizeof(opd2)+1)*sizeof(char));
memcpy(code[ind].opd2,opd2,sizeof(opd2)+1);

code[ind].opr=(char*)malloc((sizeof(opr)+1)*sizeof(char));
memcpy(code[ind].opr,opr,(sizeof(opr)+1)*sizeof(char));

ind++;
if(strcmp(opr,"indent")==0 || strcmp(opr,"unindent")==0 || strcmp(opr,"while")==0 || strcmp(opr,"=")==0){
	return "";
}
char* next_temp = (char*)malloc(2*sizeof(char));
next_temp[0] = temp[0]+1;
next_temp[1] = '\0';
temp=(char*)malloc(2*sizeof(char));
memcpy(temp,next_temp,2*sizeof(char));
return temp;
}

void push(){
	prev_label1=(char*)malloc(1*sizeof(char));
	memcpy(prev_label1,label1,sizeof(label1));
	prev_label2=(char*)malloc(1*sizeof(char));
	memcpy(prev_label2,label2,sizeof(label2));
}

void pop(){
	label1=(char*)malloc(1*sizeof(char));
	memcpy(label1,prev_label1,sizeof(prev_label1));
	label2=(char*)malloc(1*sizeof(char));
	memcpy(label2,prev_label2,sizeof(prev_label2));
}

void initialise(){
	temp=(char*)malloc(2*sizeof(char));
	memcpy(temp,"A",2*sizeof(char));
	istab=(char*)malloc(10000*sizeof(char));
	label1=(char*)malloc(1*sizeof(char));
	label2=(char*)malloc(1*sizeof(char));
	prev_label1=(char*)malloc(1*sizeof(char));
	prev_label2=(char*)malloc(1*sizeof(char));
}
void ThreeAddressCode()
{
int cnt=0;
while(cnt<ind)
{
if(strcmp(code[cnt].opr,"=")==0)
printf("%s%s %s %s\n",istab,code[cnt].opd1,code[cnt].opr,code[cnt].opd2);
else if(strcmp(code[cnt].opr,"!")==0)
printf("%s%s = %s %s\n",istab,temp,code[cnt].opr,code[cnt].opd1);
else if(strcmp(code[cnt].opr,"if")==0)
printf("%sif %s goto %s\n",istab,code[cnt].opd1,temp);
else if(strcmp(code[cnt].opr,"else")==0)
printf("%sgoto %s\n",istab,temp);
else if(strcmp(code[cnt].opr,"label")==0)
printf("%s%s:\n",istab,code[cnt].opd1);
else if(strcmp(code[cnt].opr,"indent")==0){
	memcpy(istab,strcat(istab,"\t"),(sizeof(istab)+1)*sizeof(char));
}
else if(strcmp(code[cnt].opr,"unindent")==0){
	istab[strlen(istab)-1]='\0';
}
else if(strcmp(code[cnt].opr,"while")==0)
printf("%sif %s goto %s\n",istab,code[cnt].opd1,code[cnt].opd2);
else{
	printf("%s%s = %s %s %s\n",istab,temp,code[cnt].opd1,code[cnt].opr,code[cnt].opd2);
}
if(strcmp(code[cnt].opr,"indent")==0 || strcmp(code[cnt].opr,"unindent")==0 || strcmp(code[cnt].opr,"while")==0 || strcmp(code[cnt].opr,"=")==0){
	cnt++;
	continue;
}
cnt++;
char* next_temp = (char*)malloc(2*sizeof(char));
next_temp[0] = temp[0]+1;
next_temp[1] = '\0';
temp=(char*)malloc(2*sizeof(char));
memcpy(temp,next_temp,2*sizeof(char));
}
}

main()
{
initialise();
yyin = fopen("text.txt", "r"); //enter file name here
yyparse();
temp=(char*)malloc(2*sizeof(char));
memcpy(temp,"B",2*sizeof(char));
ThreeAddressCode();
}

yywrap()
{
return 1;
}