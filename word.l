%{
#include "y.tab.h"
%}
%%
[a-zA-Z]+ {return WORD;}
[\n] {return EOL;}
%%
