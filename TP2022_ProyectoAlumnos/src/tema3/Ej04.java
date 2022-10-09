/*

    - Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
    muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.

*/

package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author ivanl
 */
public class Ej04 {
    
    public static void main(String[] args){
        
        System.out.println("Ingrese cantidad de habitaciones del Hotel...");
        int nro = Lector.leerInt();
        Hotel nuevoHotel = new Hotel(nro);
        nuevoHotel.cargarHabitaciones();
        System.out.println("Hotel de "+nro+" habitaciones creado");
        System.out.println("---------------------------");
        int i;
        GeneradorAleatorio.iniciar();
        Persona C;
        for (i=0; i<nro; i++){
            C = new Persona(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(121));
            nuevoHotel.cargarClienteEnHab(C,GeneradorAleatorio.generarInt(nro));
        }
    }
        
}
  
