/*
 Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.

 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int dimF = 5;  
        int dimC = 5;  
        int [][] matriz = new int[dimF][dimC]; 
        int i;
        int j;
        int num;
        for (i=0;i<dimF;i++){
            for (j=0;j<dimC;j++){
                num = GeneradorAleatorio.generarInt(31);
                matriz[i][j]= num;
            }
        }
        // Matriz cargada con numero aleatorios
 
        for (i=0;i<dimF;i++){
            System.out.print("|");
            for (j=0;j<dimC;j++){
                System.out.print("-"+ matriz[i][j]);
            }
            System.out.println("|");
        }
        // Matriz impresa
        
        System.out.println("**********************");
        int contador = 0;
        for (j=0;j<dimF;j++){
            contador = contador + matriz[0][j];
        }
        System.out.println("La suma de los elementos de la fila 1 es : "+ contador);
        
        // Suma de fila uno impresa 
        
        int [] vect = new int[dimF]; 
        for (i=0;i<dimC;i++){
            int total = 0;
            for (j=0;j<dimF;j++){
                total = total + matriz[j][i];
            }
            vect[i] = total;
        }
        for (i=0;i<dimC;i++){
            System.out.println("La suma de los elementos de la columna "+i+" es "+vect[i]);
        }
        
        // Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
        // encontrarse indique su ubicación (fila y columna) en caso contrario
        
        System.out.print("Ingrese numero a buscar en matriz: ...");
        int nro = Lector.leerInt();
        boolean find = false;
        for (i=0;i<dimF;i++){
            for (j=0;j<dimC;j++){
                if(matriz[i][j]==nro){
                   find = true;
                   System.out.println("Numero encontrado en posicion: Fila "+ (i+1) +" Columna "+(j+1));
                }
            }
        }
        if(find!=true){
            System.out.println("Numero no encontrado en matriz");
        }      
        
    }
}
