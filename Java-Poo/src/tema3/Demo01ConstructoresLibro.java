/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */

/*
    Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
    libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
    los libros instanciados, obtenga e imprima la representación del autor de ese libro.
*/


package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Autor autor1 = new Autor("Herbert Schildt","Esta es la biografia 1","Rusia");
        Autor autor2 = new Autor("John Horton","Esta es la biografia 2","Egipto");

        
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014, autor1  
                                 , "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
