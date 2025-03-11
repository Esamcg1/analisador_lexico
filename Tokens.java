package proyecto_1_analizador_lexico;

public enum Tokens{
    //Operadores
    Suma, Resta, Multiplicacion, Division, Potencia,

    //Corchetes
    Parentesis_Apertura, Parentesis_Cierre,
    Corchete_Apertura, Corchete_Cierre,

    //Operaciones logicas
    And, Or, Not,

    //Relacionales
    Igualdad, Diferente, Mayor, Menor, MayorIgual, MenorIgual,

    //Palabra Clave
    True, False,

    //Tipos de datos
    NumeroEntero, NumeroDecimal, Identificador, 
    ERROR
    
}