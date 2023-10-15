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
public class CursoPresencial extends Curso{
    private int aula;

    public CursoPresencial(int aula, int anio, int cantAlumnos) {
        super(anio, cantAlumnos);
        this.aula = aula;
    }

    @Override
    public boolean puedeRendir(Alumno alumno) {
        return (alumno.getAsist()>=3);
    }  
    
}
