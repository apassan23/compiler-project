%{
    #include "y.tab.h"
%}

%option yylineno

%%
switch                          {return KEYWORD_SWITCH;}
case                            {return KEYWORD_CASE;}
default                         {return KEYWORD_DEFAULT;}
break                           {return KEYWORD_BREAK;}
:                               {return COLON;}
\;                              {return SEMICOLON;}
\{                              {return LEFT_CURLY_BRACE;}
\}                              {return RIGHT_CURLY_BRACE;}
\(                              {return LEFT_PARENTHESIS;}
\)                              {return RIGHT_PARENTHESIS;}
[a-zA-Z_][a-zA-Z0-9_]*          {return ID;}
[0-9]+                          {return NUMBER;}
[ \t\n]                         {;}
.                               {return ANY;}
%%

int yywrap(){
    return 1;
}