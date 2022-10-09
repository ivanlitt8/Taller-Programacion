/*
    Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
    Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:

    (i) devolver la cantidad de libros que almacenados // ok
    (ii) devolver si el estante está lleno             // ok 
    (iii) agregar un libro al estante                  // ok
    (iv) devolver el libro con un título particular que se recibe. // 

    B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
    busque e informe el autor del libro “Mujercitas”.
    C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
    almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema3;

/**
 *
 * @author ivanl
 */
public class Estante {
   private int espacio;
   private int cantLibros;
   private Libro [] vectLibro;
   
   public Estante(int x){
       this.espacio = x;
       this.cantLibros = 0;
       this.vectLibro = new Libro[espacio];
   }
   
   public void agregarLibro(Libro libro){
       if(cantLibros<espacio){
           vectLibro[cantLibros] = libro;
           cantLibros++;
       }
   }
   
   public int cantLibros(){
       return cantLibros;
   }
   
   public boolean estaLleno(){
       return (cantLibros == espacio);
   }

   
   public String buscarLibro(String titulo){
       for (int i=0;i<cantLibros;i++){
           if(vectLibro[i].getTitulo().equals(titulo)){
               String aux;
               aux = " El autor del libro "+titulo+" es :" + vectLibro[i].getPrimerAutor();
               return aux;
           }
       }
       return "Libro no encontrado";
   }
   
   public void imprimirEstante(){
       for (int i=0;i<cantLibros;i++){
           System.out.println(vectLibro[i].toString());
       }
   }
   
}
