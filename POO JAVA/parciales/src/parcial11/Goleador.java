/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11;

/**
 *
 * @author ivanl
 */
public class Goleador {

    private String nombre;
    private String equipo;
    private int goles;

    public Goleador(String nombre, String equipo, int goles) {
        this.nombre = nombre;
        this.equipo = equipo;
        this.goles = goles;
    }

    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private String getEquipo() {
        return equipo;
    }

    private void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public int getGoles() {
        return goles;
    }

    private void setGoles(int goles) {
        this.goles = goles;
    }

    @Override
    public String toString() {
        return nombre + ", de equipo: " + equipo + ", con " + goles + " goles.";
    }  
    
}
