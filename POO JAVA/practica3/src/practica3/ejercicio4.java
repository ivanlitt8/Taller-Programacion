/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio4 {

    /**
   
   -4
    A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está 
    ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
    (i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
    (ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre, 
    DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 
    2000 y 8000.
    (iii) Implemente en las clases que corresponda todos los métodos necesarios para:
    - Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está 
    en el rango 1..N) y que la habitación está libre. 
    - Aumentar el precio de todas las habitaciones en un monto recibido.
    - Obtener la representación String del hotel, siguiendo el formato: 
     {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada} 
     …
     {Habitación N: costo, libre u ocupada, información del cliente si está ocupada
     ****************
     B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones, 
     muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
     NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe 
     delegar la responsabilidad de la operación
    */
    public static void main(String[] args) {
        System.out.println("Ingrese numero de habitaciones del hotel: ");
        int dimF = Lector.leerInt();
        int i;
        Hotel hotel = new Hotel(dimF);
        hotel.setValores();
        
        for (i=0;i<3;i++){
            Cliente cliente = new Cliente();
            System.out.println("Ingrese nombre de cliente: ");
            cliente.setNombre(Lector.leerString());
            System.out.println("Ingrese dni de cliente: ");
            cliente.setDni(Lector.leerInt());
            System.out.println("Ingrese edad de cliente: ");
            cliente.setEdad(Lector.leerInt());
            System.out.println("Seleccione numero de habitacion entre 1 y "+(dimF));
            int num = Lector.leerInt();
            if(!hotel.verificarHabitacion(num-1)){
                hotel.cargarCliente(cliente, num-1);
            }else{
                System.out.println("La habitacion esta ocupada");
            }
        }
        
        System.out.println(hotel); 
        
        System.out.println("Ingrese monto de aumento: ");
        hotel.setAumento(Lector.leerDouble());
        
        System.out.println(hotel);              

    }
    
}
