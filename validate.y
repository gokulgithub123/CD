%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin;
int yylex(void);
void yyerror(char* s);
%}

%token ID NUM WHILE LE GE EQ NE OR AND FOR PRINTF SCANF COD pointer mall type size1 eq1 call reall
%right '=' INC DEC
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-' PLUS MINUS
%left '*''/'
%right UMINUS
%left '!'


%%
program:stat program
	|
;
stat:loopstat { printf("valid loop statement\n"); }
    | print   { printf("valid printf\n"); }
|scanf { printf("valid scanf\n"); }
|malloc1	{printf("valid malloc\n");}
|calloc1 {printf("Valid calloc\n");}
|realloc1 {printf("Valid realloc\n");}
;

loopstat:FOR'('expr1';'cont';'expr1')' '{' st '}'
        |WHILE'('cont')' '{' st '}'
;
expr1:expr
     |
;
expr:expr'+'expr
    |expr'-'expr
|expr'*'expr
|expr'/'expr
|ID'='expr
|cont
|NUM
|ID
|incre
|next
;
incre:expr INC expr
     |expr DEC expr
;
cont:expr'<'expr
    |expr'>'expr
|expr LE expr
|expr GE expr
|expr EQ expr
|cont1
;
cont1:expr AND expr
     |expr OR expr
|expr NE expr
|
;
st:st st
  |expr';'
|print
|scanf
|malloc1
|calloc1
|realloc1
;
next:ID PLUS
    |ID MINUS
;

print:PRINTF'('COD expr COD')'';'
     ;
scanf:SCANF'('COD'%'ID COD',''&'ID')'';'
;

malloc1: pointer ID '=''('pointer')'mall'('NUM'*'size1'('type')'')'';'
      ;
calloc1: pointer ID'=''('pointer')'call'('NUM','size1'('type')'')'';'
       ;
realloc1: ID'='reall'('ID','NUM'*'size1'('type')'')'';'
	;
%%

void yyerror(char* s)
{
        printf("%s\n",s);
        exit(0);
}

int main(){
        yyin = fopen("sample1.c","r");
        yyparse();
        return 0;
}

