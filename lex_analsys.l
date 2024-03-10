%{
    #include "y.tab.h"  // Include the generated header from yacc
%}

%option yylineno

%%

"int"                   { return INT; }
"double"                { return DOUBLE; }
"char"                  { return CHAR; }
"string"                { return STRING; }
"bool"                  { return BOOL; }
"print"                 { return PRINT; }
"exit"                  { return EXIT; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"return"                { return RETURN; }

[ \t\n]+                ;  // Ignore whitespace

[0-9]+                  { 
                            yylval.int_val = atoi(yytext);
                            return INTEGER; 
                        }
[0-9]+"."[0-9]+         {
                            yylval.double_val = atof(yytext);
                            return DOUBLENUM; 
                        }
'.'                     {
                            yylval.char_val = yytext[0];
                            return CHARLIT; 
                        }
\"(\\.|[^\\"])*\"       { 
                            yylval.string_val = strdup(yytext);
                            return STRINGLIT; 
                        }
"true"|"false"          { 
                            yylval.bool_val = (strcmp(yytext, "true") == 0);
                            return BOOLOP; 
                        }

"="                     { return ASSIGN; }
"<"                     { return LT; }
">"                     { return GT; }
"=="                    { return EQ; }
"!="                    { return NEQ; }
"<="                    { return LTEQ; }
">="                    { return GTEQ; }
"+"                     { return ADD; }
"-"                     { return SUB; }
"*"                     { return MUL; }
"/"                     { return DIV; }
"%"                     { return MOD; }
"!"                     { return NOT; }

"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
";"                     { return SEMICOLON; }
","                     { return COMMA; }

[a-zA-Z_][a-zA-Z0-9_]*  {
                            yylval.id = strdup(yytext);
                            return ID; 
                        }

.                       { return UNRECOGNIZED; }

%%

int yywrap(){
    return 1;
}
