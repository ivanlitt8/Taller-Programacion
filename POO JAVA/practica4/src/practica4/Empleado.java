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
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antig;

    public Empleado(String nombre, double sueldo, int antig) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antig = antig;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntig() {
        return antig;
    }

    public void setAntig(int antig) {
        this.antig = antig;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularBono();
    
    public double calcularSueldoACobrar(){
        return this.sueldo+((this.getSueldo()*0.1*this.getAntig())+this.calcularBono());
    }

    @Override
    public String toString() {
        return "Nombre: " + nombre + ", sueldo base: " + sueldo + "$, antiguedad " + antig +
                " año/s. SUELDO FINAL = "+this.calcularSueldoACobrar()+"$";
    }
    
    
}
