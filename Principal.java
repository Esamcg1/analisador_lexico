package proyecto_1_analizador_lexico;   

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Principal {
    public static void main(String[] args) {
        File archivoEntrada = new File("input.txt");
        File archivoSalida = new File("output.txt");
        try {
            BufferedReader lector = new BufferedReader(new FileReader(archivoEntrada));
            PrintWriter escritor = new PrintWriter(new FileWriter(archivoSalida));

            Lexer lexer = new Lexer(lector);
            String resultado = "";

            while (true) {
                Tokens token = lexer.yylex();
                if (token == null) {
                    resultado += "FIN";
                    escritor.println(resultado);
                    System.out.println(resultado);
                    break;
                }
                switch (token) {
                    case ERROR:
                        resultado += "Error, simbolo no reconocido\n";
                        break;
                    case NumeroEntero:
                    case NumeroDecimal:
                    case Identificador:
                    case True:
                    case False:
                        resultado += lexer.lexeme + ": Es un " + token + "\n";
                        break;
                    default:
                        resultado += token + "\n";
                        break;
                }
            }

            escritor.close();
            lector.close();
            System.out.println("Analisis Léxico completado, verificar archivo de salida :)");
        } catch (Exception e) {
            System.out.println("Error al abrir el archivo: " + e.getMessage());
        }
    }
}