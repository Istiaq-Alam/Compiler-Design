%{
#include <stdio.h>
%}

digit[0-9]
letter[a-zA-Z]

%%
({letter}({letter}|{digit})*) | 
(_({letter}|{digit})*) {printf("\n%s is accepted.\n", yytext);}
{digit}({letter}|{digit})* {printf("\n%s is not accepted.\n", yytext);}
%%

int main()
{
	printf("Enter a variable : ");
	yylex();
	return 0;
}
