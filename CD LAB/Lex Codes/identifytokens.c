#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>

bool isKeyword(char* str) {
    char keywords[37][10] = {
        "auto", "break", "case", "char", "const",
         "continue", "default","do", "double", "else",
          "enum", "extern", "float", "for", "goto","if", "int",
           "long", "register", "return", "short", "signed","sizeof",
            "static", "struct", "switch", "typedef", "union","unsigned",
             "void", "volatile", "while" ,"int" ,"main" ,"printf" ,"return", "getch"
    };
    for (int i = 0; i < 37; i++) {
        if (strcmp(keywords[i], str) == 0) {
            return true;
        }
    }
    return false;

}

bool isOperator(char ch) {
    char operators[] = "+-*/%=";
    for (int i = 0; i < strlen(operators); i++) {
        if (ch == operators[i]) {
            return true;
        }
    }
    return false;
}

bool isDelimiter(char ch) {
    char delimiters[] = " \t\n,;(){}[]\"";
    for (int i = 0; i < strlen(delimiters); i++) {
        if (ch == delimiters[i]) {
            return true;
        }
    }
    return false;
}

bool isValidIdentifier(char* str) {
    if (!isalpha(str[0]) && str[0] != '_') {
        return false;
    }

    for (int i = 1; i < strlen(str); i++) {
        if (!isalnum(str[i]) && str[i] != '_') {
            return false;
        }
    }
    return true;
}

bool isConstant(char ch) {
    if(isdigit(ch)){
        return true;
    }
    return false;
}

void tokenizeCFile(FILE* file) {
    char buffer[100];
    char token[100];
    int tokenIndex = 0;
    while (fgets(buffer, sizeof(buffer), file)) {
        for (int i = 0; i < strlen(buffer); i++) {
            if (isDelimiter(buffer[i])) {
                if (tokenIndex > 0) {
                    token[tokenIndex] = '\0';
                    if (isKeyword(token)) {
                        printf("Keyword: %s\n", token);
                    } else if (isValidIdentifier(token)) {
                        printf("Identifier: %s\n", token);
                    } else {
                        printf("Invalid token: %s\n", token);
                    }
                    tokenIndex = 0;
                }
                if (isOperator(buffer[i])) {
                    printf("Operator: %c\n", buffer[i]);
                }
                if (isConstant(buffer[i])) {
                    printf("Constant: %c\n", buffer[i]);
                }
            } else {
                token[tokenIndex++] = buffer[i];
            }
        }
    }
}



int main() {
    FILE* file = fopen("identifytokens.c", "r");
    if (file == NULL) {
        printf("Failed to open file.\n");
        return 1;
    }
    tokenizeCFile(file);
    fclose(file);
    return 0;
}
