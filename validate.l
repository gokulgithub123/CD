%option noyywrap

%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
%%
[ \t\n]* ;
"malloc" return mall;
"calloc" return call;
"realloc" return reall;
"int" 	return type;
"int*"	return pointer;
"sizeof"  return size1;
["]  return COD;
while   return WHILE;
for     return FOR;
"printf" return PRINTF;
"scanf" return SCANF;
{digit}+    return NUM;
{alpha}({alpha}|{digit})*    return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
"+="    return INC;
"-="    return DEC;
"++"    return PLUS;
"--"    return MINUS;
.    return yytext[0];
%%

