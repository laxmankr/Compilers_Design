%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node
{
   struct node *left;
   struct node *right;
   char *token;
} node;

node *insert(node *left, node *right, char *token);
void printtree(node *tree);

%}

%union
{
 struct node *n;
 char* string;
}

%token <string> NUMBER
%token  PLUS MINUS 
%token  LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token  END

%left   PLUS MINUS

%type <n> line exp term

%%

line:   exp END     { printtree($1); printf("\n");}
    ;

exp    : term             {$$ = $1;}
        | exp PLUS term     {$$ = insert($1, $3, "+");}
        | exp MINUS term    {$$ = insert($1, $3, "-");}
        ;


term : NUMBER           {$$ = insert(0,0,yylval.string);}
        | LEFT_PARENTHESIS exp RIGHT_PARENTHESIS {$$ = $2;}
        ;
%%


node *insert(node *left, node *right, char *token)
{
  node *newnode = (node *)malloc(sizeof(node));
  char *newstr = (char *)malloc(strlen(token)+1);
  strcpy(newstr, token);
  newnode->left = left;
  newnode->right = right;
  newnode->token = newstr;
  return(newnode);
}

void printtree(node *tree)
{
  int i;


  if (tree->left || tree->right)
    printf("(");

  printf(" %s ", tree->token);

  if (tree->left)
    printtree(tree->left);
  if (tree->right)
    printtree(tree->right);

  if (tree->left || tree->right)
    printf(")");
}

