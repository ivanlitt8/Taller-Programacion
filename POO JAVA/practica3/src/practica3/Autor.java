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
public class Autor {
    public String nombre;
    private String biografia;
    private String origen;

    public Autor(String nombre, String biografía, String origen) {
        this.nombre = nombre;
        this.biografia = biografía;
        this.origen = origen;
    }

    public Autor() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    @Override
    public String toString() {
        return "Autor: " + nombre + ", biografia: " + biografia + ", de origen " + origen + '.';
    }
    
    
    
}
