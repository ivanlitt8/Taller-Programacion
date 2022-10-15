/*
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
   {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}


   B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
   muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.

   NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
   delegar la responsabilidad de la operación.
 */
package tema3;

/**
 *
 * @author ivanl
 */
public class Habitacion {
   private double costo;
   private boolean ocupada;
   private Persona persona;
    
    public Habitacion(){
        
    }

    public Habitacion(double costo) {
        this.costo = costo;
        this.ocupada = false;
    }
       
    public double getCosto() {
        return costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }
    
    public Persona getPersona() {
        if(ocupada==true){
            return persona;
        }else{
            return null;
        }
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
    
    public void setCliente(Persona C){
        persona = C;
    }
    
    public void aumentarCosto(double aumento) {
        costo = this.costo + aumento;
    }
    
    @Override
    public String toString(){
        String aux="Costo: "+costo+"$   ";
        if (ocupada){
            aux=aux+"Ocupada por --> "+persona.toString();
        }
        else{
            aux=aux+"Libre.\n";
        }
        return aux;
    }
    

}
