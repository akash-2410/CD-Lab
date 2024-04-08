%{
#include <stdio.h>
int count=0;
%}
%%
a {count++;}
%%
int yywrap()
{
return 1;
}

int main()
{
printf("Enter your string:");
yylex();
printf("No. of A in a string is: %d\n",count);
return 0;
}
