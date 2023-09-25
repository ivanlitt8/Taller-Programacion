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
public class ejercicio3 {

    /**
     3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
    cada día se entrevistarán a 8 personas en distinto turno.
    
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
    nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
    personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
    40 cupos de casting.

    Una vez finalizada la inscripción: 
    b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.

        NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar 
        Strings use el método equals.
     */
    public static void main(String[] args) {
        
        int dias = 3;
        int entrev = 8;
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
        
        
        for(i=0;i<dias;i++){
            System.out.println("Dia de entrevista: "+(i+1));
            for(j=0;j<entrev;j++){
                System.out.println("Numero de entrevista: "+(j+1));
                System.out.println(entrevistas[i][j].toString());
                System.out.println("------------------------");
            }
        }
    }
    
}
