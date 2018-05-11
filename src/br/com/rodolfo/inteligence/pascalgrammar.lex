package br.com.rodolfo.inteligence;

import java_cup.runtime.*;

%%

/* -----------------Opcoes e declaracoes----------------- */

/*
   O nome da classe que o jflex vai criar eh PascalLexer
   O codigo serah escrito no arquivo PascalLexer.java
*/
%public
%class PascalLexer

/*
  O numero da linha atual pode ser acessado atraves da variavel yyline
  e o numero da coluna corrente com a variavel yycolumn.
*/
%line
%column

/*
   Coloca em modo de compatibilidade com o parser gerado pelo CUP.
*/
%cup

/*
  Declaracoes

  O codigo entre %{ e %}, both of which must be at the beginning of a
  line, serah copiado para o codigo da classe gerada.
  Aqui voce declara variaveis e metodos que sao usados dentro das acoes do scanner.
*/
%{
    /* Cria um novo java_cup.runtime.Symbol com informacoes sobre o token corrente.
    Nesse caso o token nao possui valor. */

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    /* Cria um new java_cup.runtime.Symbol com informacoes sobre
       o token corrente, o token possui um valor*/

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    public String current_lexeme(){
    	int l = yyline+1;
    	int c = yycolumn+1;
    	return " (line: "+l+" , column: "+c+" , lexeme: '"+yytext()+"')";
  	}

  	public int current_line() {
  		return yyline+1;
  	}
%}


/*
  Declaracoes de Macros

  Essas declaracoes sao expressoes regulares que serao usadas posteriormente
  na secao de regras lexicas.
*/

NQUOTE = [^']

LineTerminator = \r|\n|\r\n

WhiteSpace = {LineTerminator} | [ \t\f]

Identifier = [a-zA-Z_][a-zA-Z_0-9]*

RealNumber = [0-9]+"."[0-9]+

DigSeq = [0-9]+

CharacterString = '({NQUOTE}|'')+' | ''

Comment = "(*" [^*] ~"*)" | "{" [^*] ~"}"

A = [aA]
B = [bB]
C = [cC]
D = [dD]
E = [eE]
F = [fF]
G = [gG]
H = [hH]
I = [iI]
J = [jJ]
K = [kK]
L = [lL]
M = [mM]
N = [nN]
O = [oO]
P = [pP]
Q = [qQ]
R = [rR]
S = [sS]
T = [tT]
U = [uU]
V = [vV]
W = [wW]
X = [xX]
Y = [yY]
Z = [zZ]

%%
/* ------------------------Regras Lexicas---------------------- */

/*
   Essa secao contem expressoes regulares e acoes, i. e. codigo Java,
   que serah executado quando o scanner
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner casar com a expressao
   regular associada. */

   /* YYINITIAL is the state at which the lexer begins scanning.  So
   these regular expressions will only be matched if the scanner is in
   the start state YYINITIAL. */

<YYINITIAL> {

	/* palavras chave pascal padrao */
	{A}{N}{D}			                   		 { return symbol(SYM.AND, yytext()); }
	{A}{R}{R}{A}{Y}                        		 { return symbol(SYM.ARRAY); }
	{B}{E}{G}{I}{N}		                   		 { return symbol(SYM.BEGIN); }
	{C}{A}{S}{E}                           		 { return symbol(SYM.CASE); }
	{C}{O}{N}{S}{T}                        		 { return symbol(SYM.CONST); }
	{D}{I}{V}                              		 { return symbol(SYM.DIV, yytext()); }
	{D}{O}                                 		 { return symbol(SYM.DO); }
	{D}{O}{W}{N}{T}{O}                     		 { return symbol(SYM.DOWNTO); }
	{E}{L}{S}{E}                           		 { return symbol(SYM.ELSE); }
	{E}{N}{D}                              		 { return symbol(SYM.END); }
	{F}{I}{L}{E}                           		 { return symbol(SYM.FILE); }
	{F}{O}{R}                              		 { return symbol(SYM.FOR); }
	{F}{O}{R}{W}{A}{R}{D}                        { return symbol(SYM.FORWARD); }
	{F}{U}{N}{C}{T}{I}{O}{N}                     { return symbol(SYM.FUNCTION); }
	{G}{O}{T}{O}                                 { return symbol(SYM.GOTO); }
	{I}{F}                                       { return symbol(SYM.IF); }
	{I}{M}{P}{L}{E}{M}{E}{N}{T}{A}{T}{I}{O}{N}   { return symbol(SYM.IMPLEMENTATION); }
	{I}{N}                                       { return symbol(SYM.IN); }
	{I}{N}{T}{E}{R}{F}{A}{C}{E}                  { return symbol(SYM.INTERFACE); }
	{L}{A}{B}{E}{L}                 			 { return symbol(SYM.LABEL); }
	{M}{O}{D}                                    { return symbol(SYM.MOD, yytext()); }
	{N}{I}{L}                                    { return symbol(SYM.NIL); }
	{N}{O}{T}                                    { return symbol(SYM.NOT, yytext()); }
	{O}{F}                                       { return symbol(SYM.OF); }
	{O}{R}                                       { return symbol(SYM.OR, yytext()); }
	{P}{A}{C}{K}{E}{D}                           { return symbol(SYM.PACKED); }
	{P}{R}{O}{C}{E}{D}{U}{R}{E}                  { return symbol(SYM.PROCEDURE); }
	{P}{R}{O}{G}{R}{A}{M}                        { return symbol(SYM.PROGRAM); }
	{R}{E}{C}{O}{R}{D}                           { return symbol(SYM.RECORD); }
	{R}{E}{P}{E}{A}{T}                           { return symbol(SYM.REPEAT); }
	{S}{E}{T}                                    { return symbol(SYM.SET); }
	{T}{H}{E}{N}                                 { return symbol(SYM.THEN); }
	{T}{O}                                       { return symbol(SYM.TO); }
	{T}{Y}{P}{E}                                 { return symbol(SYM.TYPE); }
	{U}{N}{I}{T}                                 { return symbol(SYM.UNIT); }
	{U}{N}{T}{I}{L}                              { return symbol(SYM.UNTIL); }
	{U}{S}{E}{S}                                 { return symbol(SYM.USES); }
	{V}{A}{R}                                    { return symbol(SYM.VAR); }
	{W}{H}{I}{L}{E}                              { return symbol(SYM.WHILE); }
	{W}{I}{T}{H}                                 { return symbol(SYM.WITH); }
	{X}{O}{R}                                    { return symbol(SYM.XOR); }
	{E}{X}{T}{E}{R}{N}{A}{L}                     { return symbol(SYM.EXTERNAL); }

	/* tipos pre-definidos */
	{I}{N}{T}{E}{G}{E}{R}                        { return symbol(SYM.INTEGER); }
	{B}{O}{O}{L}{E}{A}{N}                        { return symbol(SYM.BOOLEAN); }
	{R}{E}{A}{L}                                 { return symbol(SYM.REAL); }
	{S}{T}{R}{I}{N}{G}                           { return symbol(SYM.STRING); }
	{C}{H}{A}{R}                                 { return symbol(SYM.CHAR); }
	{T}{R}{U}{E}                                 { return symbol(SYM.TRUE); }
	{F}{A}{L}{S}{E}                              { return symbol(SYM.FALSE); }


	/* separadores */
    ";"                { return symbol(SYM.SEMICOLON); }
    "."                { return symbol(SYM.DOT); }
    ":="               { return symbol(SYM.ASSIGNMENT); }
	":"                { return symbol(SYM.COLON); }
	","                { return symbol(SYM.COMMA); }
	".."               { return symbol(SYM.DOTDOT); }
	"="                { return symbol(SYM.EQUAL); }
	">="               { return symbol(SYM.GE); }
	">"                { return symbol(SYM.GT); }
	"["                { return symbol(SYM.LBRAC); }
	"<="               { return symbol(SYM.LE); }
	"("                { return symbol(SYM.LPAREN); }
	"<"                { return symbol(SYM.LT); }
	"-"                { return symbol(SYM.MINUS, yytext()); }
	"<>"               { return symbol(SYM.NOTEQUAL); }
	"+"                { return symbol(SYM.PLUS, yytext()); }
	"]"                { return symbol(SYM.RBRAC); }
	")"                { return symbol(SYM.RPAREN); }
	"/"                { return symbol(SYM.SLASH, yytext()); }
	"*"                { return symbol(SYM.STAR, yytext()); }
	"**"               { return symbol(SYM.STARSTAR); }
	"->"               { return symbol(SYM.UPARROW); }
	"^"                { return symbol(SYM.UPARROW); }

	"{"				   {}
	"}"                {}

	{CharacterString}  { return symbol(SYM.CHARACTER_STRING, yytext()); }

    {DigSeq}           { return symbol(SYM.DIGSEQ, yytext()); }

    {RealNumber}       { return symbol(SYM.REALNUMBER, yytext()); }

    {Identifier}       { return symbol(SYM.IDENTIFIER, yytext()); }

    {WhiteSpace}       { /* faz nada */ }

    {Comment}          {}
}


/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
