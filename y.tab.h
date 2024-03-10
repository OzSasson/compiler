#ifndef _yy_defines_h_
#define _yy_defines_h_

#define LT 257
#define GT 258
#define EQ 259
#define NEQ 260
#define LTEQ 261
#define GTEQ 262
#define ADD 263
#define SUB 264
#define MUL 265
#define DIV 266
#define MOD 267
#define INT 268
#define DOUBLE 269
#define CHAR 270
#define STRING 271
#define BOOL 272
#define PRINT 273
#define EXIT 274
#define IF 275
#define ELSE 276
#define WHILE 277
#define RETURN 278
#define ASSIGN 279
#define NOT 280
#define LPAREN 281
#define RPAREN 282
#define LBRACE 283
#define RBRACE 284
#define SEMICOLON 285
#define COMMA 286
#define ID 287
#define INTEGER 288
#define DOUBLENUM 289
#define CHARLIT 290
#define STRINGLIT 291
#define BOOLOP 292
#define UNRECOGNIZED 293
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    int int_val;          /* for INTEGER*/
    double double_val;    /* for DOUBLENUM*/
    char char_val;        /* for CHARLIT*/
    char *string_val;     /* for STRINGLIT*/
    char bool_val;         /* for BOOLOP*/
    char *id;         /* for ID*/
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
