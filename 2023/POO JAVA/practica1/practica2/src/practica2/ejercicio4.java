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
     * 4- Sobre un nuevo programa, modifique el ejercicio anterior para
     * considerar que:
     *
     * a) Durante el proceso de inscripción se pida a cada persona sus datos
     * (nombre, DNI, edad) y el día en que se quiere presentar al casting. La
     * persona debe ser inscripta en ese día, en el siguiente turno disponible.
     * En caso de no existir un turno en ese día, informe la situación. La
     * inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse
     * los 40 cupos de casting.
     *
     * Una vez finalizada la inscripción: b) Informar para cada día: la cantidad
     * de inscriptos al casting ese día y el nombre de la persona a entrevistar
     * en cada turno asignado.
     *
     */
    public static void main(String[] args) {
        int dias = 3;
        int entrev = 3;
        int i, j;

        Persona[][] entrevistas = new Persona[dias][entrev];
        for (i = 0; i < dias; i++) {
            for (j = 0; j < entrev; j++) {
                entrevistas[i][j] = null;
            }
        }

        String nombre = "";
        int dni;
        int edad = 0;
        int diaAct = 0;
        int eAct;
        int dia;
        boolean cargado;
        int turno;
        int cupos = 40;

        while ((cupos > 0) && (!"ZZZ".equals(nombre))) {
            System.out.println("Ingrese nombre");
            nombre = Lector.leerString();
            if(!"ZZZ".equals(nombre)){
                System.out.println("Ingrese dni");
                dni = Lector.leerInt();
                System.out.println("Ingrese edad");
                edad = Lector.leerInt();
                System.out.println("Seleccione dia de casting");
                dia = Lector.leerInt();
                while((dia>3)||(dia<1)){
                    System.out.println("Seleccione dia valido");
                    dia = Lector.leerInt();
                }
                cargado = false;
                turno = 0;
                while((!cargado)&&(turno<entrev)){
                    if (entrevistas[dia-1][turno] == null) {
                        entrevistas[dia-1][turno] = new Persona(nombre, dni, edad);
                        cupos--;
                        cargado= true;
                    }
                    turno++;
                }
                if(cargado){
                    System.out.println("Turno asignado, dia: "+dia+" turno "+turno);
                }else{
                    System.out.println("No hay turnos disponibles ese dia");
                }
            }
        }
        
        int cont;
        for(i=0;i<dias;i++){
            System.out.println("Día " + (i+1) + ":");
            cont = 0;   
            for(j=0;j<entrev;j++){
                if(entrevistas[i][j] != null){
                    System.out.println("Turno: "+(j+1)+", Nombre: " + entrevistas[i][j].getNombre());
                    cont++;
                }
            }
            System.out.println("Total de inscriptos "+cont);
        }
        
        
    }
}

// Una vez finalizada la inscripción: b) Informar para cada día: la cantidad
// de inscriptos al casting ese día y el nombre de la persona a entrevistar
// en cada turno asignado.
