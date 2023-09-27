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
import PaqueteLectura.Lector;

public class ejercicio5 {

    /**
     * 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto
     * partido representa un encuentro entre dos equipos (local y visitante). Un
     * objeto partido puede crearse sin valores iniciales o enviando en el
     * mensaje de creación el nombre del equipo local, el nombre del visitante,
     * la cantidad de goles del local y del visitante (en ese orden). Un objeto
     * partido sabe responder a los siguientes mensajes:
     *
     * getLocal() retorna el nombre (String) del equipo local getVisitante()
     * retorna el nombre (String) del equipo visitante getGolesLocal() retorna
     * la cantidad de goles (int) del equipo local getGolesVisitante() retorna
     * la cantidad de goles (int) del equipo visitante setLocal(X) modifica el
     * nombre del equipo local al “String” X setVisitante(X) modifica el nombre
     * del equipo visitante al “String” X setGolesLocal(X) modifica la cantidad
     * de goles del equipo local al “int” X setGolesVisitante(X) modifica la
     * cantidad de goles del equipo visitante al “int” X hayGanador() retorna un
     * boolean que indica si hubo (true) o no hubo (false) ganador getGanador()
     * retorna el nombre (String) del ganador del partido (si no hubo retorna un
     * String vacío). hayEmpate() retorna un boolean que indica si hubo (true) o
     * no hubo (false) empate
     *
     *
     * Implemente un programa que cargue un vector con a lo sumo 20 partidos
     * disputados en el campeonato. La información de cada partido se lee desde
     * teclado hasta ingresar uno con nombre de visitante “ZZZ” o alcanzar los
     * 20 partidos. Luego de la carga:
     *
     * - Para cada partido, armar e informar una representación String del
     * estilo: {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante } -
     * Calcular e informar la cantidad de partidos que ganó River. - 
     * Calcular e informar el total de goles que realizó Boca jugando de local. -
     */
    public static void main(String[] args) {

        int dimF = 5;
        Partido[] partidos = new Partido[dimF];

        int i;
        int dimL = 0;
        String visitante = "";
        while ((!"ZZZ".equals(visitante)) && (dimL < dimF)) {
            Partido partido = new Partido();
            System.out.println("Ingrese nombre de equipo local");
            partido.setLocal(Lector.leerString());
            System.out.println("Ingrese nombre de equipo visitante");
            visitante = Lector.leerString();
            partido.setVisitante(visitante);
            if (!"ZZZ".equals(partido.getVisitante())) {
                System.out.println("Ingrese goles de equipo local");
                partido.setGolesLocal(Lector.leerInt());
                System.out.println("Ingrese goles de equipo visitante");
                partido.setGolesVisitante(Lector.leerInt());
                partidos[dimL] = partido;
                dimL++;
            }
        }

        int partidosRiv = 0;
        int golesBoca = 0;
        
        for (i = 0; i < dimL; i++) {
            System.out.println(partidos[i]
                    .getLocal()
                    .toUpperCase() + " " + partidos[i].
                            getGolesLocal() + " VS " + partidos[i].
                            getVisitante().toUpperCase() + " " + partidos[i]
                            .getGolesVisitante());
            if("river".equals(partidos[i].getGanador())){
                partidosRiv++;
            }
            if("boca".equals(partidos[i].getLocal())){
                golesBoca += partidos[i].getGolesLocal();
            }
        }
        System.out.println("La cantidad de partidos ganados de River es: "+partidosRiv);
        System.out.println("El total de goles que realizó Boca jugando de local es: "+golesBoca);
    }

}
