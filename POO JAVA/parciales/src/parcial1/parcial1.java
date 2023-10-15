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
public class parcial1 {

    /**
     * 1- Representar un concurso de baile. El concurso tiene a lo sumo N parejas
     * cada pareja tiene 2 participantes. De los participantes se tiene dni,
     * nombre, edad.
     
     * a- Genere las clases necesarias. Provea constructores para iniciar: el
       concurso para un N maximo de parejas (inicialmente sin parejas cargadas);
       las parejas y los participantes a partir de toda su informacion.
     
     * b- Implemente metodos en las clases adecuadas para permitir:
        * Agregar una pareja al concurso. Asuma que hay lugar.
        * Obtener la diferencia de edad de la pareja.
        * Obtener la pareja con mas diferencia de edad del concurso.
     
     * 2- Realice un programa que instancie un concurso, cargue 2 parejas y a
     * partir del concurso muestre: los nombres de los participantes de la
     * pareja con mas diferencia de edad.
     */
    public static void main(String[] args) {
        Concurso concurso = new Concurso(3);
        
        Participante part1 = new Participante(25633, "Javier", 35);
        Participante part2 = new Participante(26533, "Miriam", 20);
       
        Pareja pareja2 = new Pareja(part1, part2);
        
        Participante part3 = new Participante(24151, "Pedro", 36);
        Participante part4 = new Participante(3266, "Manuela", 40);
       
        Pareja pareja1 = new Pareja(part3, part4);
        
        concurso.agregarPareja(pareja1);
        concurso.agregarPareja(pareja2);
        
        System.out.println("La pareja con mas diferencia de edad es la pareja numero: "+concurso.maxDifEdad());
        
    }
    
}
