%{
#include<stdio.h>
int lc=0,ch=0,wc=0;
%}

%%
[\n] { lc++; ch+=yyleng;}
[^\t\n ]+ { wc++; ch+=yyleng;} 
%%

int yywrap(){}

int main(){
	printf("Enter the Sentence : ");
	yylex();
	printf("Number of lines : %d\n",lc);
	printf("Number of charc : %d\n",ch);
	printf("Number of words : %d\n",wc);
	return 0;
}
