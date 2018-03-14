%{
#include<stdio.h>
#include<ctype.h>
#define YYSTYP char
int yyerror();
int yylex();
int f=0;
%}
%token id1 id2 err
%left '-' '+'
%left '*' '/'
%%
input :
|input exp {}
|error{f=1;}
;
exp:exp '+' exp {printf("+");}
|exp '-' exp {printf("-");}
|exp '*' exp {printf("*");}
|exp '/' exp {printf("/");}
|id1 {printf("%c",yylval);}
|id2 {printf("%d",yylval);}
;
%%
int main()
{
printf("Enter the arithmetic expression :\n");
yyparse();
printf("\n");
if(f==1)
printf("Invalid expression!!\n");
return 0;
}
int yyerror(char* mes)
{
return 0;
}
int yywrap()
{
return 1;
}
