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
public abstract class Curso {

    private int anio;
    private int cantAlumnos;
    private int dimL = 0;
    private Alumno[] alumnos;

    public Curso(int anio, int cantAlumnos) {
        this.anio = anio;
        this.cantAlumnos = cantAlumnos;
        this.alumnos = new Alumno[cantAlumnos]; //Inicializado por Java por defecto 
    }
    
    public Alumno getAlumno(int pos){
        return this.alumnos[pos];
    }
    
    public boolean agregarAlumno(Alumno alumno) {
        boolean state = false;
        if (this.dimL < this.cantAlumnos) {
            alumnos[dimL] = alumno;
            this.dimL++;
            state = true;
        }
        return state;
    }

    public void incrementarAsistencia(int dni) {
        boolean encontrado = false;
        int i = 0;
        while ((i < this.dimL) && (!encontrado)) {
            if (this.alumnos[i].getDni() == dni) {
                encontrado = true;
                this.alumnos[i].setAsist(this.alumnos[i].getAsist() + 1);
            }
            i++;
        }
    }
    
    public void aprobarAutoevaluacion(int dni) {
        boolean encontrado = false;
        int i = 0;
        while ((i < this.dimL) && (!encontrado)) {
            if (this.alumnos[i].getDni() == dni) {
                encontrado = true;
                this.alumnos[i].setAprob(this.alumnos[i].getAprob() + 1);
            }
            i++;
        }
    }

    public abstract boolean puedeRendir(Alumno alumno);
    
    public int cantidadDeAlumnosQuePuedenRendir(){
        int contador = 0;
        for (int i = 0; i < this.dimL; i++){
            if (this.puedeRendir(this.getAlumno(i))){
                contador++;
            }
        }
        return contador;
    }

}
