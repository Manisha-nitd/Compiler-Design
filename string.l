%{
#include "y.tab.h"
%}
%%
[aA] {return A;}
[bB] {return B;}
[a-zA-Z] {return 0;}
\n {return EOL;}

%%
