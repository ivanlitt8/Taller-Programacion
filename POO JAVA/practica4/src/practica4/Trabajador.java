/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author ivanl
 */
public class Trabajador extends Persona{
    private String trabajo;

    public Trabajador(String trabajo, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.trabajo = trabajo;
    }  
    
    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }

    @Override
    public String toString() {
        return super.toString()+" Soy: "+ trabajo + ".";
    }
    
    
}
