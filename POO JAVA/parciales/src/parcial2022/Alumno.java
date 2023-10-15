/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2022;

/**
 *
 * @author ivanl
 */
public class Alumno {
    private int dni;
    private String nombre;
    private int asist = 0;
    private int aprob = 0;

    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAsist() {
        return asist;
    }

    public void setAsist(int asist) {
        this.asist = asist;
    }

    public int getAprob() {
        return aprob;
    }

    public void setAprob(int aprob) {
        this.aprob = aprob;
    }
    
    

    @Override
    public String toString() {
        return "Alumno: " + "dni " + dni + ", nombre: " + nombre + ", asistencias: " + asist +
                ", materias aprobadas: " + aprob;
    }
    
    
    
}
