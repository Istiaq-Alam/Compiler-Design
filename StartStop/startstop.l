%{
#include <stdio.h>
%}

%%
start|stop	{printf("%s command received.\n", yytext);}
%%

main()
{
yylex();
}
