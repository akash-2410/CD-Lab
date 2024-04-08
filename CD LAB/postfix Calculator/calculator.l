%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

DIGIT [0-9]
OPERATOR [-+*/]

%%

{DIGIT}+ {
    yylval = atoi(yytext);
    return NUMBER;
}

{OPERATOR} {
    yylval = *yytext;
    return OPERATOR;
}

[ \t\n]  /* Ignore whitespace */

. {
    printf("Invalid character: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}
