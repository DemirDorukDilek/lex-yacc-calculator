%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
#include "y.tab.h" 
void yyerror(const char *s);
%} 

/* Rule Section */
%%
[0-9]+\.[0-9]+      { yylval.fval = atof(yytext); return NUMBER; }
[0-9]+              { yylval.fval = atof(yytext); return NUMBER; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return TIMES; }
"/"                     { return DIVIDE; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
[\^]                     { return POW; }
[ \t\r]+              { /* Ignore whitespace */ }
.   					{ yyerror("Unvalid character"); return 0; }
[\n]                     return '\n';

%% 

int yywrap() 
{ 
	return 1; 
} 
