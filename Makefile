all: compiler

lex.yy.c: lex_analsys.l
		flex lex_analsys.l

y.tab.c:
	yacc -d parser.y

compiler: lex.yy.c compiler.c
		gcc -o compiler lex.yy.c compiler.c y.tab.c
