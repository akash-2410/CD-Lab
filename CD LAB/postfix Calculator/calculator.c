// Build a calculator in c which takes expression in postfix notation.

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct {
    int top;
    int items[100];
} Stack;

void push(Stack *s, int item) {
    s->top++;
    s->items[s->top] = item;
}

int pop(Stack *s) {
    int item = s->items[s->top];
    s->top--;
    return item;
}

int is_empty(Stack *s) {
    return s->top == -1;
}

int calc(char *expression) {
    Stack s;
    s.top = -1;

    int i = 0;
    while (expression[i] != '\0') {
        if (isdigit(expression[i])) {
            int digit = expression[i] - '0';
            push(&s, digit);
        } else if (expression[i] == '+') {
            int a = pop(&s);
            int b = pop(&s);
            int result = a + b;
            push(&s, result);
        } else if (expression[i] == '-') {
            int a = pop(&s);
            int b = pop(&s);
            int result = b - a;
            push(&s, result);
        } else if (expression[i] == '*') {
            int a = pop(&s);
            int b = pop(&s);
            int result = a * b;
            push(&s, result);
        } else if (expression[i] == '/') {
            int a = pop(&s);
            int b = pop(&s);
            int result = b / a;
            push(&s, result);
        }
        i++;
    }

    int result = pop(&s);
    if (!is_empty(&s)) {
        printf("Invalid expression\n");
        exit(EXIT_FAILURE);
    }
    return result;
}

int main() {
    char expression[100];
    printf("Enter postfix expression: ");
    fgets(expression, 100, stdin);
    int result = calc(expression);
    printf("Result: %d\n", result);
    return 0;
}
