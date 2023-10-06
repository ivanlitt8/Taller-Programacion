/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author ivanl
 */
public abstract class Coro {
    
    private String nombre;
    private Director director;

    public Coro(String nombre, Director director) {
        this.nombre = nombre;
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista corista);
    public abstract boolean coroLLeno();
    public abstract boolean coroBienFormado();

    @Override
    public String toString() {
        return "Nombre de coro: " + nombre + ", del Director " + director ;
    }    
    
}
/**
 Una escuela de música arma coros para participar de ciertos eventos. Los coros poseen 
        un nombre y están formados por un director y una serie de coristas. Del director se 
        conoce el nombre, DNI, edad y la antigüedad (un número entero). De los coristas se conoce 
        el nombre, DNI, edad y el tono fundamental (un número entero). Asimismo, hay dos tipos 
        de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado 
        del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
        
 */
