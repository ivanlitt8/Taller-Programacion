/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.Lector;
public class ejercicio3 {

    /**
     3
        A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
        Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 
        (i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
        (iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
        
        B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante, 
        busque e informe el autor del libro “Mujercitas”.
        
        C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que 
        almacenen como máximo N libros? ¿Cómo instanciaría el estante?
     */
    public static void main(String[] args) {
        Estante estante = new Estante();
        
        
        System.out.println("Ingrese nombre del libro");
        String nombre = PaqueteLectura.Lector.leerString();
        System.out.println("Ingrese autor del libro");
        String nombreAutor = PaqueteLectura.Lector.leerString();
        while(!"ZZZ".equals(nombre)){
            Autor autor = new Autor();
            autor.setNombre(nombreAutor);
            Libro libro = new Libro();
            libro.setTitulo(nombre);
            libro.setPrimerAutor(autor);
            estante.agregarLibro(libro);
            System.out.println("Ingrese nombre del libro");
            nombre = PaqueteLectura.Lector.leerString();
            System.out.println("Ingrese autor del libro");
            nombreAutor = PaqueteLectura.Lector.leerString();
        }
       
        System.out.println(estante.getLibro("mujercitas"));
    }
    
}
