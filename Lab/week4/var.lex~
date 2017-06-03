%{
  #include "y.tab.h"
%}

%option noyywrap
%%
([a-zA-Z_][a-zA-Z0-9]*)* {return VALID;}
([0-9][a-zA-Z0-9]*)* {return INVALID;}
%%
