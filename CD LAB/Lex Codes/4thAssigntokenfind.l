%{
#include <stdio.h>
%}

%%
"/"([^]|[\r\n]|(\+([^/]|[\r\n])))\+"/"        { printf("Comment\n"); }
"//"([^]|[\r\n])[\r\n]                        { printf("Single Line Comment\n"); }
"\\\"([^\"\\]|\\.)*\\\""                       { printf("String Literal\n"); }
'([^'\\]|\\.)+'                                 { printf("Character Literal\n"); }
[0-9]+                                          { printf("Integer Literal\n"); }
[0-9]+"."[0-9]*([eE][+-]?[0-9]+)?               { printf("Floating Point Literal\n"); }
[a-zA-Z_][a-zA-Z0-9_]*                          { printf("Identifier\n"); }
"="                                             { printf("Assignment Operator\n"); }
"=="                                            { printf("Equality Operator\n"); }
"!="                                            { printf("Inequality Operator\n"); }
"<"                                             { printf("Less Than Operator\n"); }
"<="                                            { printf("Less Than or Equal Operator\n"); }
">"                                             { printf("Greater Than Operator\n"); }
">="                                            { printf("Greater Than or Equal Operator\n"); }
"&&"                                            { printf("Logical AND Operator\n"); }
"||"                                            { printf("Logical OR Operator\n"); }
"!"                                             { printf("Logical NOT Operator\n"); }
"("                                             { printf("Left Parenthesis\n"); }
")"                                             { printf("Right Parenthesis\n"); }
"{"                                             { printf("Left Curly Brace\n"); }
"}"                                             { printf("Right Curly Brace\n"); }
";"                                             { printf("Semicolon\n"); }
","                                             { printf("Comma\n"); }
"+"                                             { printf("Addition Operator\n"); }
"-"                                             { printf("Subtraction Operator\n"); }
"*"                                             { printf("Multiplication Operator\n"); }
"/"                                             { printf("Division Operator\n"); }
"%"                                             { printf("Modulus Operator\n"); }
"&"                                             { printf("Bitwise AND Operator\n"); }
"|"                                             { printf("Bitwise OR Operator\n"); }
"^"                                             { printf("Bitwise XOR Operator\n"); }
"~"                                             { printf("Bitwise NOT Operator\n"); }
"<<"                                            { printf("Left Shift Operator\n"); }
">>"                                            { printf("Right Shift Operator\n"); }
"sizeof"                                        { printf("Sizeof Operator\n"); }
"return"                                        { printf("Return Keyword\n"); }
"if"                                            { printf("If Keyword\n"); }
"else"                                          { printf("Else Keyword\n"); }
"for"                                           { printf("For Loop Keyword\n"); }
"while"                                         { printf("While Loop Keyword\n"); }
"do"                                            { printf("Do-While Loop Keyword\n"); }
"break"                                         { printf("Break Keyword\n"); }
"continue"                                      { printf("Continue Keyword\n"); }
"switch"                                        { printf("Switch Keyword\n"); }
"case"                                          { printf("Case Keyword\n"); }
"default"                                       { printf("Default Keyword\n"); }
"void"                                          { printf("Void Keyword\n"); }
"int"                                           { printf("Int Keyword\n"); }
"float"                                         { printf("Float Keyword\n"); }
"char"                                          { printf("Char Keyword\n"); }
"double"                                        { printf("Double Keyword\n"); }
"long"                                          { printf("Long Keyword\n"); }
"short"                                         { printf("Short Keyword\n"); }
"signed"                                        { printf("Signed Keyword\n"); }
"unsigned"                                      { printf("Unsigned Keyword\n"); }
"static"                                        { printf("Static Keyword\n"); }
"extern"                                        { printf("Extern Keyword\n"); }
"const"                                         { printf("Const Keyword\n"); }
"volatile"                                      { printf("Volatile Keyword\n"); }
"register"                                      { printf("Register Keyword\n"); }
"struct"                                        { printf("Struct Keyword\n"); }
"union"                                         { printf("Union Keyword\n"); }
"typedef"                                       { printf("Typedef Keyword\n"); }
"enum"                                          { printf("Enum Keyword\n"); }
"goto"                                          { printf("Goto Keyword\n"); }
"asm"                                           { printf("Asm Keyword\n"); }
[ \t]+                                          { /* ignore whitespace */ }
[\n]                                            { printf("Newline\n"); }
.                                               { printf("Unknown Token: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}