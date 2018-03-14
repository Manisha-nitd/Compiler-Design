%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%token EOL
%%
str:
|S EOL {printf("Valid string\n");
		exit(0);}
;
S:
 |A S B
;
%%
int yyerror(char *str)
{
printf("\nInvalid String!!\n");
exit(0);
}
main()
{
printf("Enter the string :\n");
yyparse();
}
