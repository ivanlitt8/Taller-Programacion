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

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;
public class ejercicio2 {
    /**
     2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de 
        básquet y las almacene en un vector. Luego informe: 
        - la altura promedio
        - la cantidad de jugadores con altura por encima del promedio
        NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
     */
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double altura;
        int dimF = 5;  
        double [] vectAltura = new double[dimF];
        
        int i;
        for(i=0;i<dimF;i++){
            System.out.println("Ingrese la altura del jugador "+(i+1));
            altura = Lector.leerDouble();  
            vectAltura[i] = altura ; 
        }
        
        System.out.println("------------------------------");
        System.out.println("Listado de altura de jugadores: ");
        double total = 0;
        for(i=0;i<dimF;i++){
            System.out.println("Altura del jugador "+(i+1)+": "+vectAltura[i]+"cm");
            total = total + vectAltura[i];
        }
      
        double prom = (total/dimF);
        System.out.println("------------------------------");
        System.out.println("La altura promedio de los jugadoreses: "+prom+"cm");
        
        int cant = 0;
        for(i=0;i<dimF;i++){
            if(vectAltura[i]>prom)
                cant++;
        }        
        System.out.println("------------------------------");
        System.out.println("La cantidad de jugadores que sobrepasan el promedio de altura es: "+cant);
    }
    
}
