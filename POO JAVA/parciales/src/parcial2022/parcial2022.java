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
public class parcial2022 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CursoPresencial cursoPres = new CursoPresencial(5, 2023, 5);
        CursoDistancia cursoDist = new CursoDistancia("linkTest.com", 2023, 5);

        Alumno alumno1 = new Alumno(25632, "Jose");
        Alumno alumno2 = new Alumno(15623, "Marcelo");
        Alumno alumno3 = new Alumno(25432, "Pepe");
        Alumno alumno4 = new Alumno(29632, "Soledad");
        Alumno alumno5 = new Alumno(63152, "Julieta");
        Alumno alumno6 = new Alumno(25102, "Marcos");

        System.out.println(cursoPres.agregarAlumno(alumno1));
        System.out.println(cursoPres.agregarAlumno(alumno2));
        System.out.println(cursoPres.agregarAlumno(alumno3));
        System.out.println(cursoPres.agregarAlumno(alumno4));
        System.out.println(cursoPres.agregarAlumno(alumno5));
        System.out.println(cursoPres.agregarAlumno(alumno6));
        System.out.println("-----------------------");
        System.out.println(cursoDist.agregarAlumno(alumno1));
        System.out.println(cursoDist.agregarAlumno(alumno2));
        System.out.println(cursoDist.agregarAlumno(alumno3));
        System.out.println(cursoDist.agregarAlumno(alumno4));
        System.out.println(cursoDist.agregarAlumno(alumno5));
        System.out.println(cursoDist.agregarAlumno(alumno6));

        cursoPres.incrementarAsistencia(29632);
        cursoPres.incrementarAsistencia(29632);
        cursoPres.incrementarAsistencia(29632);
        
        cursoDist.aprobarAutoevaluacion(29632);
        cursoDist.aprobarAutoevaluacion(29632);
        cursoDist.aprobarAutoevaluacion(29632);
        cursoDist.incrementarAsistencia(29632);        

        System.out.println(cursoDist.cantidadDeAlumnosQuePuedenRendir());
        System.out.println(cursoPres.cantidadDeAlumnosQuePuedenRendir());

    }

}
