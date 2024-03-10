#include <stdio.h>
#include <stdlib.h>

extern int yylex();  // Declared in lex-generated file
extern int yyparse();  // Declared in yacc-generated file
extern int yylineno;
extern char* yytext;
extern FILE* yyin;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("%s <FILENAME>\n", argv[0]);
        exit(1);
    }

    FILE* fd = fopen(argv[1], "r");
    if (fd == NULL) {
        printf("Can't open %s\n", argv[1]);
        exit(1);
    }

    yyin = fd;

    // Call yyparse to initiate parsing
    if (yyparse() == 0) {
        printf("Parsing successful!\n");
    } else {
        printf("Parsing failed!\n");
    }

    fclose(fd);
    return 0;
}
