/*
    E- Realizar un programa que instancie un jugador y un entrenador. Informe la
    representación String de cada uno.
 */
package tema4;

/**
 *
 * @author ivanl
 */
public class Ej02 {
    public static void main (String[] args){
        
        Entrenador nuevoEntrenador = new Entrenador(5,"Bianchi",100000,8);
        Jugador nuevoJugador = new Jugador(20,40,"Riquelme",500000,4);
        
        System.out.println(nuevoEntrenador.toString());
        System.out.println(nuevoJugador.toString() );
             
    }
}
