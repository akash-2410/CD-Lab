%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER OPERATOR

%%

expression: NUMBER
          | expression expression OPERATOR { 
              switch ($3) {
                  case '+': $$ = $1 + $2; break;
                  case '-': $$ = $1 - $2; break;
                  case '*': $$ = $1 * $2; break;
                  case '/': $$ = $1 / $2; break;
				  default: yyerror("Invalid operator"); break;
              }
			  printf("%d ", $$);
          }

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) {
    printf("Error: %s\n", s);
    exit(1);
}