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
public class Director extends Persona {
    private int antiguedad;
    
    public Director (String nombre, int dni, int edad, int antiguedad){
        super(nombre, dni, edad);
        this.setAntiguedad(antiguedad);
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    
}
