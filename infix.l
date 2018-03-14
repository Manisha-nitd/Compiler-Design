%{
#include<stdio.h>
#include "y.tab.h"
%}
op "+"|"-"|"*"|"/"
%%
[a-zA-Z] {yylval=*yytext; return id1;}
[0-9]+ 	{yylval=atoi(yytext); return id2;}
{op} {return (int)yytext[0];}
\n {return (0);}
. {return err;}
%%
