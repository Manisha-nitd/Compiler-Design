%{
#include<stdio.h>
#include<stdlib.h>
int m=0;
int yylex();
int yyerror();
%}
%token WORD
%token EOL
%%
S:
|text EOL {printf("\n Number of words=%d\n",m);
	   	exit(0);			}
;
text:
|text WORD{m++;}
%%
int yyerror()
{
printf("Invalid!!\n");
exit(0);
}
int main()
{
yyparse();
return 0;
}
