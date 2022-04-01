%{
    #include <stdio.h>
    extern int yylex();
    int yyerror(char*);
    extern FILE* yyin;
    extern int yylineno;
%}

%token KEYWORD_SWITCH KEYWORD_CASE KEYWORD_DEFAULT
%token KEYWORD_BREAK COLON LEFT_CURLY_BRACE
%token RIGHT_CURLY_BRACE LEFT_PARENTHESIS
%token RIGHT_PARENTHESIS ID NUMBER
%token SEMICOLON ANY

%%
start: KEYWORD_SWITCH LEFT_PARENTHESIS expr RIGHT_PARENTHESIS switch_body  {printf("Valid Switch Statement!\n"); return 0;}
    ;
expr: expr '+' term
    | expr '-' term
    | term
    ;
term: term '*' factor
    | term '/' factor
    | factor
    ;
factor: LEFT_PARENTHESIS expr RIGHT_PARENTHESIS 
    | ID
    | NUMBER
    ;
switch_body: LEFT_CURLY_BRACE switch_case switch_default RIGHT_CURLY_BRACE
        | SEMICOLON
        ;
switch_case: KEYWORD_CASE NUMBER COLON stmt switch_break switch_case
        |
        ;
switch_break: KEYWORD_BREAK SEMICOLON
            |
            ;
switch_default: KEYWORD_DEFAULT COLON stmt KEYWORD_BREAK SEMICOLON
        |
        ;
stmt: other SEMICOLON stmt
    |
    ;
other: ANY other
    | ID other
    |
    ;
%%
int yyerror(char *msg){
    printf("Error: %s at line %d\n", msg, yylineno);
    return 1;
}


int main(int argc, char **argv){
    if(argc == 2)
        yyin = fopen(argv[1], "r");
    else printf("Enter a Statement: ");

    return yyparse();
}