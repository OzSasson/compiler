%{
#include <stdio.h>
#include "y.tab.h"
extern int yylineno;

int yyerror(const char *s) {
  fprintf(stderr, "Error: %s, in line: %d\n", s, yylineno);
  return 1;
}

typedef enum {
    NODE_INT,
    NODE_DOUBLE,
    NODE_CHAR,
    NODE_STRING,
    NODE_BOOL,
    NODE_ID,
    NODE_ADD,
    NODE_SUB,
    NODE_MUL,
    NODE_DIV,
    NODE_MOD,
    NODE_ASSIGN,
    NODE_EQ,
    NODE_NEQ,
    NODE_LT,
    NODE_GT,
    NODE_LTEQ,
    NODE_GTEQ,
    NODE_PRINT,
    NODE_EXIT,
    NODE_IF,
    NODE_ELSE,
    NODE_WHILE,
    NODE_STATEMENT_LIST,
    NODE_COMPOUND_STATEMENT,
    NODE_BLOCK
} NodeType;

typedef struct Node {
  int type;
  void *value;
  struct Node *left;
  struct Node *right;
} Node;

Node* create_int_node(int value) {
  // Implement logic to create an integer node
}

Node* create_id_node(char *name) {
  // Implement logic to create an identifier node
}
%}
//  need to add void and function and declerations
%start program

%union {
    int int_val;          // for INTEGER
    double double_val;    // for DOUBLENUM
    char char_val;        // for CHARLIT
    char *string_val;     // for STRINGLIT
    char bool_val;         // for BOOLOP
    char *id;         // for ID
};

%left LT GT EQ NEQ LTEQ GTEQ ADD SUB MUL DIV MOD

%token INT DOUBLE CHAR STRING BOOL 
%token PRINT EXIT IF ELSE WHILE RETURN

%token ASSIGN LT GT EQ NEQ LTEQ GTEQ ADD SUB MUL DIV MOD NOT
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA

%token <id> ID 
%token <int_val> INTEGER
%token <double_val> DOUBLENUM
%token <char_val> CHARLIT
%token <string_val> STRINGLIT
%token <bool_val> BOOLOP

%token UNRECOGNIZED

%%

program:  declaration_or_function
        | program declaration_or_function

declaration_or_function: declaration
                     | function_definition

declaration: data_type ID ASSIGN expression SEMICOLON

function_definition: data_type ID LPAREN opt_parameter_list RPAREN compound_statement

opt_parameter_list : 
                   | parameter_list
                   ;

parameter_list : data_type ID
                | parameter_list COMMA data_type ID
                ;

compound_statement:
        LBRACE statement_list RBRACE

data_type:
        INT 
        | DOUBLE
        | CHAR
        | STRING
        | BOOL

expression: term
     | rel_condition
     | expression ADD term
     | expression SUB term
     ;

term: factor
      | term MUL factor
      | term DIV factor
      | term MOD factor
      ;

factor: INTEGER                 {printf("%d", $1);}
       | DOUBLENUM
       | STRINGLIT
       | LPAREN expression RPAREN
       | BOOLOP
       | ID
       | function_call
       ;

rel_condition: expression EQ expression
          | expression NEQ expression
          | expression LT expression
          | expression GT expression
          | expression LTEQ expression
          | expression GTEQ expression


condition: rel_condition
          | BOOLOP
          | ID
          ;

statement_list:
        statement
        | statement_list statement

statement:
        if_statement
        | declaration
        | while_statement
        | compound_statement
        | print_statement
        | exit_statement
        | return_statement
        | function_call SEMICOLON

function_call:
        ID LPAREN opt_parameter_list RPAREN 

return_statement:
        RETURN expression SEMICOLON

if_statement:
        IF LPAREN condition RPAREN compound_statement 
        | IF LPAREN condition RPAREN compound_statement ELSE compound_statement

while_statement:
        WHILE LPAREN condition RPAREN compound_statement

print_statement:
        PRINT LPAREN expression RPAREN SEMICOLON

exit_statement:
        EXIT SEMICOLON

%%
