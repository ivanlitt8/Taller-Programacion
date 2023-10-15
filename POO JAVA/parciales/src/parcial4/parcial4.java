/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author ivanl
 */
public class parcial4 {

    /**
     1) Queremos representar estanterías de libros. Una estantería mantiene sus libros organizados en
        N estantes cada uno con lugar para M libros. Un libro posee título, nombre de su primer autor
        y peso.
        
        a) Implemente las clases de su modelo, con sus atributos y getters/setters adecuados.
        Provea constructores para iniciar: los libros a partir de toda su información; la estantería 
        para N estantes y lugar para M libros por estante (inicialmente no debe tener libros cargados).

        b) Implemente los siguientes métodos:
        - almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al libro
        en la estantería. Asuma que dicho lugar está disponible.

        - sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando 
        su lugar disponible. Tenga en cuenta que el libro puede no existir.

        - calcular: calcula y devuelve el libro más pesado de la estantería.
        
     2) Realice un programa que instancie una estantería para 5 estantes y 3 libros por estante. 
        Almacene 7 libros en la estantería. A partir de la estantería: saque un libro e informe su
        representación String; luego, informe el título del libro más pesado.

     */
    public static void main(String[] args) {
        Estanteria estanteria = new Estanteria(5, 3);
        
        Libro libro1 = new Libro("Libro 1", "Autor 1", 350);
        Libro libro2 = new Libro("Libro 2", "Autor 2", 220);
        Libro libro3 = new Libro("Libro 3", "Autor 3", 150);
        Libro libro4 = new Libro("Libro 4", "Autor 4", 500);
        Libro libro5 = new Libro("Libro 5", "Autor 5", 750);
        Libro libro6 = new Libro("Libro 6", "Autor 6", 1500);
        Libro libro7 = new Libro("Libro 7", "Autor 7", 1250);
        
        estanteria.almacenarLibro(libro1, 1, 1);
        estanteria.almacenarLibro(libro2, 5, 3);
        estanteria.almacenarLibro(libro3, 5, 1);
        estanteria.almacenarLibro(libro4, 3, 3);
        estanteria.almacenarLibro(libro5, 2, 1); /////////
        estanteria.almacenarLibro(libro6, 1, 2);
        estanteria.almacenarLibro(libro7, 4, 2);
        
        System.out.println(estanteria);
        
        System.out.println("------------------------");
                
        if(estanteria.sacarLibro("Libro 5") == null){
            System.out.println("El libro no existe");
        }else{
            System.out.println(estanteria.sacarLibro("Libro 5"));
        }
        
        System.out.println(estanteria.calcular());
        
        System.out.println("------------------------");
        
        
        System.out.println(estanteria);
        
    }
    
}
