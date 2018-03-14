%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token NUM
%token ADD SUB MUL DIV ABS
%token EOL
%%
calclist:
|calclist exp EOL {printf("The result is :%d\n",$2);
			exit(0);}
;
exp:factor
|exp ADD factor {$$=$1+$3;}
|exp SUB factor {$$=$1-$3;}
;
factor: term
|factor DIV term {$$=$1/$3;}
|factor MUL term {$$=$1*$3;}
;
term:NUM
|term ABS {$$=$2>=0?$2 : -$2;}
;
%%
int main()
{
printf("Enter the expression :\n");
yyparse();
return 0;
}
int yyerror(char* str)
{
printf("String has error!!\n");
exit(0);
}
