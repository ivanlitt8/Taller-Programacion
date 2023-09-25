/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class ejercicio4 {

    /**
    4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
   
    a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
    y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el 
    siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación. 
    La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos 
    de casting.
    
    Una vez finalizada la inscripción:
    b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la 
    persona a entrevistar en cada turno asignado.

    */
    public static void main(String[] args) {
        int dias = 3;
        int entrev = 3;
        int i,j;
        
        Persona[][] entrevistas = new Persona[dias][entrev];
        for(i=0;i<dias;i++){
            for(j=0;j<entrev;j++){
                entrevistas[i][j] = null;
            }
        }
        
        String nombre = "";
        int dni;
        int edad = 0;
        int diaAct = 0;
        int eAct;
        
        while((diaAct<dias)&&(!"ZZZ".equals(nombre))) {
            eAct = 0;
            while((eAct<entrev)&&(!"ZZZ".equals(nombre))){
                System.out.println("Ingrese nombre");
                nombre = GeneradorAleatorio.generarString(3);
                if(!"ZZZ".equals(nombre)) {
                    dni =  GeneradorAleatorio.generarInt(1000);
                    edad = GeneradorAleatorio.generarInt(80);
                    entrevistas[diaAct][eAct] = new Persona(nombre,dni,edad);
                    eAct++;
                }
            }
            diaAct++;
        }
    }
    
}
