package  proyecto_1_analizador_lexico;
import static proyecto_1_analizador_lexico.Tokens.*;

%%
%class Lexer
%unicode

//Se declaran las expresiones regulares que se usaran para los tokens
L=[a-zA-Z_]+
D=[0-9]+
DECIMAL={D}+"."{D}+

espacio = [ ,\t,\r,\n]+

%{
    public String lexeme;
%}

%%

//Operadores aritmenticos
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"^" {return Potencia;}

//Parensetis para expresiones algebraicas
"(" {return Parensetis_Apertura;}
")" {return Parensetis_Cierre;}
"[" {return Corchete_Apertura;}
"]" {return Corchete_Cierre;}

//Operaciones logicas
"&&" {return And; }
"||" {return Or;}
"!" {return Not;}

//Operadores relacionales
"==" {return Igualdad; }
"!=" {return Diferente;}
"<" {return Menor;}
">" {return Mayor;}
"<=" {return MenorIgual;}
">=" {return MayorIgual;}

//Palabras reservadas
"true" {return True;}
"false" {return False;}

//Variables
{DECIMAL} {lexeme = yytext(); return NumeroDecimal;}
{D}+ {lexeme = yytext(); return NumeroEntero;}
{L}({L}|{D})* {lexeme = yytext(); return Identificador;}

//No se toman en cuenta los espacios
{espacio} {/*Ingnorar*/}
. {return ERROR;}