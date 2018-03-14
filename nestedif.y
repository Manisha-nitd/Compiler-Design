%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
extern int yyerror(char *str);
int count=0;
%}

%token IF RELOP  NUMBER ID NL

%%
stmt :if_stmt NL{ printf("count=%d" , count);
                    exit(0);}
;
if_stmt: IF '(' cond ')' '{'  if_stmt '}'  {count++;}
      |cond 
      ;
cond  :x RELOP x ';' 
 ;
x :ID 
  | NUMBER
  ;
%%

int main()
{
 yyparse();
}
int yywrap()
{
 return 1;
}
int yyerror(char *str)
{ 
 printf("invalid input");
}
 
