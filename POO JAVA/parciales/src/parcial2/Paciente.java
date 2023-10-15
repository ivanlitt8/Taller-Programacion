/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author ivanl
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costoSesion;

    public Paciente(String nombre, boolean obraSocial, double costoSesion) {
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costoSesion = costoSesion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCostoSesion() {
        return costoSesion;
    }

    public void setCostoSesion(double costoSesion) {
        this.costoSesion = costoSesion;
    }

    @Override
    public String toString() {
        return "Paciente: " + nombre + ", obraSocial: " + obraSocial + ", costo de la sesion=" + costoSesion + "$.";
    }
    
    
}
