%{
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror()
{
	printf("THIS IS A CORRECT FORM OF YOUR PROGRAMMING LANGUAGE, ALI BORAN YILMAZ!\n");
}
%}

%token INTNUMBER FLOATNUMBER STRING IDENTIFIER PLUS MINUS MULTIPLICATE DIVIDE
%token INT FLOAT STR
%token AND_OPERATOR OR_OPERATOR ASSIGNMENT EQUAL
%token IF ELSE WHILE
%token LEFTPAR RIGHTPAR
%token LEFT_CURLY RIGHT_CURLY
%token GREATER_THAN LESS_THAN NOT_EQUAL
%token SEMICOLON
%token NEWLINE START END

%%
program: START SEMICOLON stmts END SEMICOLON;
 
stmts:  stmts stmt | stmt;
 
stmt: non_block_stmt SEMICOLON | block_stmt;
 
non_block_stmt: assignment_stmt | var_declaration;

block_stmt: if_else_stmt | loop_stmt;
 
if_else_stmt: IF LEFTPAR conditional_expression RIGHTPAR body | IF LEFTPAR conditional_expression RIGHTPAR body ELSE body;

loop_stmt: while_stmt;

while_stmt: WHILE LEFTPAR conditional_expression RIGHTPAR body;

expression : conditional_expression;
 
conditional_expression: or_expression;
 
or_expression: and_expression | or_expression OR_OPERATOR and_expression;
 
and_expression: equality_expression | and_expression AND_OPERATOR equality_expression;
 
equality_expression: relational_expression | equality_expression equality_operator relational_expression;
 
relational_expression: additive_expression | relational_expression relational_operator additive_expression;
 
additive_expression: multiplication_expression | additive_expression addition_operator multiplication_expression;
 
multiplication_expression: primary_expression | multiplication_expression multipication_operator primary_expression;                                    
 
primary_expression: IDENTIFIER | primitive_type | LEFTPAR expression RIGHTPAR;
 
assignment_stmt: var_declaration ASSIGNMENT expression SEMICOLON | IDENTIFIER ASSIGNMENT expression SEMICOLON;
  
var_declaration: type_name IDENTIFIER SEMICOLON;
 
multipication_operator: MULTIPLICATE | DIVIDE;
 
addition_operator: PLUS | MINUS;
 
relational_operator:  LESS_THAN | GREATER_THAN;
 
equality_operator: EQUAL | NOT_EQUAL;
 
body: LEFT_CURLY stmts RIGHT_CURLY | LEFT_CURLY RIGHT_CURLY;
 
type_name: INT | FLOAT;
 
primitive_type: INTNUMBER | FLOATNUMBER;

%%

#include "lex.yy.c"

int main()
{
yyparse();

return 0;
}
