/*

To run the file
1. lex program.l
2. gcc lex.yy.c -ll   ( to create by default a.out )

*/



%{

#include<stdio.h>
#include<string.h>

int lineno = 1;
int count = 0;
%}

Line \n

%%

{Line}		{lineno++;}

[aA][pP][pP][lL][eE]	{printf("line no is : %d\n",lineno);count++;}

int|float		{printf("int or float on line no : %d\n",lineno);}

.		

%%

int yywrap(){
return 1;
}

int main(){

extern FILE *yyin, *yyout;
yyin = fopen("input.txt","r");
yylex();

printf("The total count is : %d\n",count);

return 0;
}
