%{
#include <stdio.h>
%}

%%
[\t]+
is |
am |
are |
was |
were	 {printf("%s is a verb.", yytext);}
[a-zA-Z]+	{printf("%s is not a verb.", yytext);}
%%
main()
{
yylex();
}
