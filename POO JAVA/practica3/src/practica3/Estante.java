/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 * Un estante almacena a lo sumo 20 libros. Implemente un constructor que
 * permita iniciar el estante sin libros. Provea métodos para: (i) devolver la
 * cantidad de libros que almacenados (ii) devolver si el estante está lleno
 * (iii) agregar un libro al estante (iv) devolver el libro con un título particular
 * que se recibe.
 */
public class Estante {

    private int dimL = 0;
    private Libro[] vector = new Libro[20];

    public Estante() {
    }

    public int cantidadLibros() {
        return dimL;
    }

    public void agregarLibro(Libro libro) {
        if (dimL < 19) {
            vector[dimL] = libro;
            this.dimL++;
        }
    }

    public boolean estaLleno() {
        return (dimL == 19);
    }
    
    public Libro getLibro(String titulo){
        int aux = 0;
        boolean esta = false;
        while ((esta == false)&&(aux < dimL)){
            if (this.vector[aux].getTitulo().equals(titulo)){
                esta = true;
            }
            else{
                aux++;
            }
        }
        if (!esta){
            return null;
        }
        else{
            return this.vector[aux];
            
        }
    }

}
