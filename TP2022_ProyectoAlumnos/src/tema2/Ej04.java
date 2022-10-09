/*
    Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
    cada día se entrevistarán a 8 personas en distinto turno.
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
    nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: 
    
    Las personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
    40 cupos de casting.

    Una vez finalizada la inscripción:
    b) Informar para cada día y turno el nombre de la persona a entrevistar
.
    NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */
public class Ej04 {
    public static void main(String[] args) {
        int dimF = 8;
        int dimC = 5;
        Persona [][] matriz = new Persona[dimF][dimC];
        
        GeneradorAleatorio.iniciar();
        
        System.out.println("Comienza Proceso de Casting...");
        
         System.out.print("Ingrese Nombre: ");
         String nombre = Lector.leerString();
         System.out.print("Ingrese DNI: ");
         int dni = Lector.leerInt();
         System.out.print("Ingrese Edad: ");
         int edad = Lector.leerInt();
         
         Persona p;
         int i,j;
         i=0;
         j=0;
         while((j<dimC)&&(!"ZZZ".equals(nombre))){
            while ((!"ZZZ".equals(nombre))&&(i<dimF)){
                p = new Persona(nombre,dni,edad);
                matriz[i][j]= p;
                i= i+1;
                System.out.print("Ingrese Nombre: ");
                nombre = Lector.leerString();
                System.out.print("Ingrese DNI: ");
                dni = Lector.leerInt();
                System.out.print("Ingrese Edad: ");
                edad = Lector.leerInt();
            }
            if(!"ZZZ".equals(nombre)){
                j= j+1;
            }
         }
         for (i=0;i<dimF;i++){
            System.out.println("Turno: "+(i+1));
            for (j=0;j<dimC;j++){
                System.out.println("---Dia: "+ (j+1) +" "+matriz[i][j]);
            }
            System.out.println("|");
        }
    }
}
