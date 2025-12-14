%{
#include <stdio.h>
int line=0, chars=0;
%}

%%
[\n] {++line;}
. {chars++;}
%%

int main()
{
	printf("Enter the input : \n");
	yylex();
	printf("\nThere are %d characters and %d lines.\n", chars, line);
	return 0;
}
