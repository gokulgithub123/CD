%option noyywrap
%{
#include<stdio.h>
int count=0;
%}
%%
"int" |
"float" |
"char" |
"double" |
"if" |
"printf" |
"scanf" |
"else if"    {printf("%s = keyword\n",yytext);  count++;}
["][a-zA-Z0-9 ]*["] {printf("%s = string\n",yytext); count++;}
[!@#$%^&*(),;]  {printf("%s = specialcharacter\n",yytext);  count++;} 
[A-Za-z_]+[A-Za-z0-9]*  {printf("%s = variable\n",yytext);  count++;}
.   ;
%%
int main()
{
	printf("Enter the line: ");
	yylex();
	printf("No of tokens are: %d\n",count);
}

