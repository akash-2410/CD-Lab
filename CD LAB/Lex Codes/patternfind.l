%{
int aa_count = 0;
int ab_count = 0;
int no_a_count = 0;
%}

%%
aa { aa_count++; }
ab { ab_count++; }
[^a] { no_a_count++; }

%%

int yywrap(void) { return 1; }

int main() {
    yylex();
    printf("Pattern 'aa' count: %d\n", aa_count);
    printf("Pattern 'ab' count: %d\n", ab_count);
    printf("No 'a' count: %d\n", no_a_count);
    return 0;
}
