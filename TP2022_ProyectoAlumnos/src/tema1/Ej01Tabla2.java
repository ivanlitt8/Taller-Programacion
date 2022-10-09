/*
 1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la
tabla del 2. Luego escriba las instrucciones necesarias para:

- generar enteros aleatorios hasta obtener el número 11. Para cada número
muestre el resultado de multiplicarlo por 2 (accediendo al vector).
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int dimF = 11;  
        int [] tabla2 = new int[dimF]; // indices de 0 a 10
        int i;
        for (i=0;i<dimF;i++){
            tabla2[i]=2*i;
            System.out.println("2x" + i + "=" + tabla2[i]);
        }
        //La tabla del 2 se cargo correctamente.
        
        GeneradorAleatorio.iniciar();
        i=0;
        int num;
        num = GeneradorAleatorio.generarInt(12); //Genera num entre 0 y 11
        while (num !=11){
            System.out.println( num + " multiplicado por 2 es igual a : " + tabla2[num] );
            num = GeneradorAleatorio.generarInt(12);
        }
    }

}
