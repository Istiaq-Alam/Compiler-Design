%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "y.tab.h"  // Include Flex-generated header for token definitions

#define YYSTYPE int
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT RIGHT
%token END

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG
%right POWER

%start Input

%%

Input:
    | Input Line
    ;

Line:
    END
    | Expression END { printf("Result: %d\n", $1); }
    ;

Expression:
    NUMBER { $$ = $1; }
    | Expression PLUS Expression { $$ = $1 + $3; }
    | Expression MINUS Expression { $$ = $1 - $3; }
    | Expression TIMES Expression { $$ = $1 * $3; }
    | Expression DIVIDE Expression { $$ = $1 / $3; }
    | MINUS Expression %prec NEG { $$ = -$2; }
    | Expression POWER Expression { $$ = pow($1, $3); }
    | LEFT Expression RIGHT { $$ = $2; }
    ;

%%

int yyerror(const char *s) {
     fprintf(stderr, "%s\n", s);
    return 0;
}

int main() {
    printf("Enter an expression:\n");
    if (yyparse()) {
        fprintf(stderr, "Parsing failed.\n");
    } else {
        fprintf(stderr, "Parsing successful.\n");
    }
    return 0;
}

