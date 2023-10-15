/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author ivanl
 */
public class Participante {
    private int dni;
    private String nombre;
    private int edad;

    public Participante(int dni, String nombre, int edad) {
        this.dni = dni;
        this.nombre = nombre;
        this.edad = edad;
    }

    private int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Participante " + "dni: " + dni + ", nombre: " + nombre + ", edad: " + edad ;
    }    
}
