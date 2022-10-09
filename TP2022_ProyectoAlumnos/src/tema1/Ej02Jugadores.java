/*
Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
*/
    
package tema1;
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int dimF = 5;
        double [] vectAlt = new double[dimF];
        int i;
        double total = 0;
        
        for (i=0;i<dimF;i++){
            System.out.println("Ingrese altura de jugador "+(i+1));
            double altura = Lector.leerDouble();
            vectAlt[i]= altura;
            total = total + altura;
        }
        double prom = (total/dimF);
        
        System.out.println("La altura promedio es " + prom );
        
        int cant = 0;
        for (i=0;i<dimF;i++){
            if (vectAlt[i]>prom){
                cant= cant +1;
            }
        }
        
        System.out.println("La cantidad de jugadores con altura mayor al promedio es " + cant );

    }
    
}
