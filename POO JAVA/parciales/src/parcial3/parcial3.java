/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author ivanl
 */
public class parcial3 {

    /**
     1) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u
        de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la información del paciente
        que tomó el turno. De los pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.

        a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; 
          los pacientes a partir de toda su información.
          
        b)Lea atentamente y luego implemente métodos que permitan:
        - Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
        - Dado el nombre de un paciente, liberar todos sus turnos.
        - Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día.
          Asuma que D es válido.
          
        c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
        Libere turnos agendados. Para finalizar, imprima el resultado del inciso b.iii

     */
    public static void main(String[] args) {
        Sistema sistema = new Sistema();

        Paciente paciente1 = new Paciente("Raul", true, 1500);
        Paciente paciente2 = new Paciente("Jose", false, 300);
        Paciente paciente3 = new Paciente("Pedro", true, 1500);
        //Paciente paciente4 = new Paciente("Raul", true, 1500);
        Paciente paciente5 = new Paciente("Alejandro", true, 1500);
        Paciente paciente6 = new Paciente("Jose", false, 3000);
        //Paciente paciente7 = new Paciente("Raul", true, 1500);
        Paciente paciente8 = new Paciente("Julian", true, 1500);
        Paciente paciente9 = new Paciente("Alberto", false, 3000);

        sistema.agendarPaciente(paciente1, 1, 2);
        sistema.agendarPaciente(paciente2, 2, 2);
        sistema.agendarPaciente(paciente3, 2, 4);
        sistema.agendarPaciente(paciente1, 4, 1);
        sistema.agendarPaciente(paciente5, 3, 1);
        sistema.agendarPaciente(paciente6, 1, 3);
        sistema.agendarPaciente(paciente1, 5, 6);
        sistema.agendarPaciente(paciente8, 2, 3);
        sistema.agendarPaciente(paciente9, 4, 6);

        System.out.println(sistema.tieneTurno("Raul", 5));

        sistema.liberarTurnos("Raul");

        System.out.println(sistema.tieneTurno("Raul", 5));
    }
    
}
