/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author ivanl
 */
public class Trabajador extends Persona {
    private String tarea;

    public Trabajador(){
        
    }
    
    public Trabajador (String nombre, int DNI, int edad, String tarea){
        super(nombre,DNI,edad);
        this.tarea= tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        String aux = super.toString()+
                ". Soy " +tarea+ ".";
        return aux;
    }
    
}
