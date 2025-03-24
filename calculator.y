%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

int err_flag=0;
%}

%union {
    double fval;
}

%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN POW
%token <fval> NUMBER

%left PLUS MINUS
%left TIMES DIVIDE
%right POW

%type <fval> expr

%%

run:

    | run statement
    ;

statement:
    '\n'
    | expr { if (!err_flag)
            printf("Ans: %lf\n", $1);
    }
    ;

expr:
    expr PLUS expr       { $$ = $1 + $3; }
    | expr MINUS expr    { $$ = $1 - $3; }
    | expr TIMES expr    { $$ = $1 * $3; }
    | expr DIVIDE expr   { 
        if ($3 == 0) { 
            yyerror("DIVIDE by 0 exeption"); 
            $$ = 0; 
        } else {
            $$ = $1 / $3; 
        }
    }
    | expr POW expr      { 
        $$ = 1;
        for(int i = 0; i < $3 ; i++){
            $$ = $$*$1;
        }
    }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER              { $$ = $1; }
    ;

%%
void yyerror(const char *s) {
    printf("Hata: %s\n", s);
    err_flag = 1;
}

int main() {
    printf("\nctrl+c to exit, enter statement: \n");
    yyparse();
    return err_flag;
}
