%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token ID FOR NUM LE GE EQ NE OR AND
%right '=' UMINUS
%left AND OR '<''>' LE GE EQ NE '+''-''*''/''!'

%%
S:
ST { printf("Input Accepted.\n");
     exit(0); }
;

ST:
FOR '(' E ';' E2 ';' E ')' DEF;
DEF: '{' BODY '}'
|E ';'
|ST 
|
;

BODY: 
 BODY BODY
|E ';'
|ST
|
;

E: 
 ID '=' E
|E '+' E
|E '-' E
|E '*' E
|E '/' E
|E '<' E
|E '>' E
|E LE E
|E GE E
|E EQ E
|E NE E
|E OR E
|E AND E
|E '+''+'
|E '-''-'
|ID
|NUM
;

E2:
 E '<' E
|E '>' E
|E LE E
|E GE E
|E EQ E
|E NE E
|E OR E
|E AND E
|ID
|NUM
;
%%

int main()
{
    printf("Enter Expression : ");
    yyparse();
    return 0;
}

