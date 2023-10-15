/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2023;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.Lector;

public class parcial2023 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Concurso concurso = new Concurso(3, 5);

        Cancion cancion1 = new Cancion("Cancion 1", "Autor 1", 12);
        Cancion cancion2 = new Cancion("Cancion 2", "Autor 2", 20);
        Cancion cancion3 = new Cancion("Cancion 3", "Autor 3", 13);
        Cancion cancion4 = new Cancion("Cancion 4", "Autor 4", 42);
        Cancion cancion5 = new Cancion("Cancion 5", "Autor 5", 11);

        concurso.agregarCancionAConcurso(3, 5, cancion1);
        concurso.agregarCancionAConcurso(1, 1, cancion2);
        concurso.agregarCancionAConcurso(2, 2, cancion3);
        concurso.agregarCancionAConcurso(1, 2, cancion4);
        concurso.agregarCancionAConcurso(1, 3, cancion5);

        int id = -1;
        String nombre = "";
        String apellido = "";
        int dni = -1;
        while (id != 0) {
            System.out.println("Ingrese nombre de alumno");
            nombre = Lector.leerString();
            System.out.println("Ingrese apellido de alumno");
            apellido = Lector.leerString();
            System.out.println("Ingrese dni de alumno");
            dni = Lector.leerInt();
            System.out.println("Ingrese identificador de cancion");
            id = Lector.leerInt();
            System.out.println("Ingrese puntaje obtenido");
            int puntaje = Lector.leerInt();
            if (id != 0) {
                Estudiante estudiante = new Estudiante(nombre, apellido, dni);
                concurso.interpretar(id, estudiante, puntaje);
            }
        }
        
        System.out.println("--------------------");
        System.out.println(concurso);
        System.out.println("--------------------");

        System.out.println("INGRESE IDENTIFICADOR DE LA CANCION: ");
        int ident = Lector.leerInt();
        System.out.println("El estudiante con la mejor intepretacion es: ");
        if(concurso.getGanador(ident) == null){
            System.out.println("Nadie");
        }else{
            System.out.println(concurso.getGanador(ident));
        }
    }
}
