/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author ivanl
 */
public class Corista extends Persona{
    private String tono;

    public Corista(String tono, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tono = tono;
    }    
    
    public String getTono() {
        return tono;
    }

    public void setTono(String tono) {
        this.tono = tono;
    }
    
    
}
