%{
%}

%%
[a-zA-Z][a-zA-Z0-9]* printf("Valid Identifier"); 
[^a-zA-Z] printf("Invalid Identifier"); 

%% 
int yywrap(){
return 1;
}
int main() {

	printf("Enter");
	yylex(); 
} 
