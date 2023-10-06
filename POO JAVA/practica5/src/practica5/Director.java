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
public class Director extends Persona{

    private int antiguedad;

    public Director(int antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    
    
    @Override
    public String toString() {
        return super.toString()+ "antiguedad: "+this.antiguedad;
    }
    
    
}
/**
 * Una escuela de música arma coros para participar de ciertos eventos. Los
 * coros poseen un nombre y están formados por un director y una serie de
 * coristas. Del director se conoce el nombre, DNI, edad y la antigüedad (un
 * número entero). De los coristas se conoce el nombre, DNI, edad y el tono
 * fundamental (un número entero). Asimismo, hay dos tipos de coros: coro
 * semicircular en el que los coristas se colocan en el escenario uno al lado
 * del otro y coro por hileras donde los coristas se organizan en filas de igual
 * dimensión.
 *
 */
