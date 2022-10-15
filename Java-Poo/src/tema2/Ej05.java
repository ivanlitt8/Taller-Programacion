/*

    Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
    encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
    valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
    nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
    partido sabe responder a los siguientes mensajes:

    getLocal() retorna el nombre (String) del equipo local
    getVisitante() retorna el nombre (String) del equipo visitante
    getGolesLocal() retorna la cantidad de goles (int) del equipo local
    getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
    setLocal(X) modifica el nombre del equipo local al “String” X
    setVisitante(X) modifica el nombre del equipo visitante al “String” X
    setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
    setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
    hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
    getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
    un String vacío).
    hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

    Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
    el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
    nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

    - Para cada partido, armar e informar una representación String del estilo:
    {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
    - Calcular e informar la cantidad de partidos que ganó River.
    - Calcular e informar el total de goles que realizó Boca jugando de local.

*/
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */     
       
public class Ej05 {
    public static void main (String [] args){
        int dimF = 20;
        Partido [] vectPart =  new Partido [dimF];
        
        String eLoc;
        String eVis;
        
        int gLoc;
        int gVis;
        
        System.out.println("Ingrese el nombre del equipo local : ");
        eLoc = Lector.leerString();
        System.out.println("Ingrese el nombre del equipo visitante : ");
        eVis =  Lector.leerString();
        System.out.println("Ingrese la cantidad de goles del equipo local : ");
        gLoc= Lector.leerInt();
        System.out.println("Ingrese la cantidad de goles del equipo visitante: ");
        gVis = Lector.leerInt();
        Partido p;
        int dimL = 0;
        
        while((!"ZZZ".equals(eLoc))&&(dimL<dimF)){
            p = new Partido(eLoc,eVis,gLoc,gVis);
            vectPart[dimL]= p;
            System.out.println("Ingrese el nombre del equipo local : ");
            eLoc = Lector.leerString();
            System.out.println("Ingrese el nombre del equipo visitante : ");
            eVis =  Lector.leerString();
            System.out.println("Ingrese la cantidad de goles del equipo local : ");
            gLoc= Lector.leerInt();
            System.out.println("Ingrese la cantidad de goles del equipo visitante: ");
            gVis = Lector.leerInt();
            dimL= dimL+1;
        }
        int contRiver = 0;
        int contGoles = 0;
        int i;
        for (i=0;i<dimL;i++){
            if (vectPart[i].getGanador().equals("River")){
                contRiver = contRiver +1;
            }
            if("Boca".equals(vectPart[i].getLocal())){
                contGoles= contGoles + vectPart[i].getGolesLocal();
            }
            System.out.println("*******FECHA NUMERO: "+(i+1)+"*******");            
            System.out.println(vectPart[i].getLocal() + " goles -> " + vectPart[i].getGolesLocal() +" | | "+ vectPart[i].getVisitante() + " goles -> " +  vectPart[i].getGolesVisitante());
        }
        System.out.println("-------------------");
        System.out.println("La cantidad de partidos ganados por River fue de "+ contRiver); 
        System.out.println("La cantidad de goles marcados por Boca fue de "+ contGoles);          
    }
}