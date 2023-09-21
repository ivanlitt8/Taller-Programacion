/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio1 {

    /**
    - Analice el programa Ej01Tabla2.java, que carga un vector que representa la 
      tabla del 2. Luego escriba las instrucciones necesarias para:
    
    - generar enteros aleatorios hasta obtener el número 11. Para cada número 
      muestre el resultado de multiplicarlo por 2 (accediendo al vector).
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "10" + "="+ tabla2[10]);        
        
        int num = 0;
        GeneradorAleatorio.iniciar(); 
        while(num!=11){
            num = GeneradorAleatorio.generarInt(12);
            if(num!=11)
                System.out.println(num+"*2 = "+tabla2[num]);
        }
    }
}
