package proyecto_1_analizador_lexico;
import static proyecto_1_analizador_lexico.Tokens.*;

%%
%class Lexer
%unicode
%type Tokens

L=[a-zA-Z_]+
D=[0-9]+
DECIMAL={D}+"."{D}+

espacio = [ ,\t,\r,\n]+

%{
    public String lexeme;
%}

%%

// Operadores aritméticos
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"^" {return Potencia;}

// Paréntesis y corchetes
"(" {return Parentesis_Apertura;}
")" {return Parentesis_Cierre;}
"[" {return Corchete_Apertura;}
"]" {return Corchete_Cierre;}

// Operadores lógicos
"&&" {return And;}
"||" {return Or;}
"!" {return Not;}

// Operadores relacionales
"==" {return Igualdad;}
"!=" {return Diferente;}
"<" {return Menor;}
">" {return Mayor;}
"<=" {return MenorIgual;}
">=" {return MayorIgual;}

// Palabras clave lógicas
"true" {return True;}
"false" {return False;}

// Variables
{DECIMAL} {lexeme = yytext(); return NumeroDecimal;}
{D}+ {lexeme = yytext(); return NumeroEntero;}
{L}({L}|{D})* {lexeme = yytext(); return Identificador;}

// Ignorar espacios
{espacio} {/* Ignorar */}
. {return ERROR;}