/*
    B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
    busque e informe el autor del libro “Mujercitas”.
 */
package tema3;
import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */
public class Ej03 {
    public static void main(String[] args) {
        System.out.println("Ingrese Espacios de Estante...");
        int espacio = Lector.leerInt();
        Estante estanteUno = new Estante(espacio);

        System.out.println("Estante de "+espacio+" espacios generado.");

        
        Libro nuevoLibro;
        Autor nuevoAutor;
        int i;
        for (i=0;i<5;i++){
            
            System.out.println("Ingrese Titulo de Libro");
            String titulo = Lector.leerString();
            System.out.println("Ingrese Editorial de Libro");
            String editorial = Lector.leerString();
            System.out.println("Ingrese ISBN de Libro");
            String ISBN = Lector.leerString();
            
            nuevoAutor = new Autor(); // Creo un autor nulo para simplificar
            nuevoLibro = new Libro(titulo,editorial,nuevoAutor,ISBN);

            estanteUno.agregarLibro(nuevoLibro);
        }
        
        System.out.println("Ingrese nombre de libro a buscar");
        String buscar = Lector.leerString();
        
        System.out.println(estanteUno.buscarLibro(buscar));        
    }
}
