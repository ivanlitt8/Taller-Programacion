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
public class CursoDistancia extends Curso {
    private String link;

    public CursoDistancia(String link, int anio, int cantAlumnos) {
        super(anio, cantAlumnos);
        this.link = link;
    }

    @Override
    public boolean puedeRendir(Alumno alumno) {
        return ((alumno.getAprob()==3)&&(alumno.getAsist()>=1));
    }    
   
}
