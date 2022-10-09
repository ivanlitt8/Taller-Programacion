/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author ivanl
 */
public class Hotel {
    private int cantHabitaciones;
    private Habitacion [] vectHab;
    
    public Hotel(int cantHabitaciones){
        this.cantHabitaciones = cantHabitaciones;
        this.vectHab = new Habitacion[cantHabitaciones];
    }
    
    public void cargarHabitaciones(){
        GeneradorAleatorio.iniciar();
        for (int i=0;i==cantHabitaciones;i++){
            Persona nuevaPersona = new Persona();
            Double costo = GeneradorAleatorio.generarDouble(6001)+2000;
            Habitacion nuevaHabitacion = new Habitacion (costo,false,nuevaPersona);
            vectHab[i]= nuevaHabitacion;
        }
    }
    
    public void cargarClienteEnHab(Persona C,int X ){
        if(vectHab[X].guardarCliente(C)){
            System.out.println(C.getNombre()+ " Cargado exitosamente en habitacion "+ X);
        }else{
            System.out.println(" No pudo cargarse a "+C.getNombre()+ " en la habitacion "+ X);
        }
    }
    
    public void aumentarPrecio(double aumento){
        for (int i=0;i==cantHabitaciones;i++){
            double valorActual= vectHab[i].getCosto();
            vectHab[i].setCosto(aumento+valorActual);
        }
    }

    public void imprimirHotel(){
        for (int i=0;i==cantHabitaciones;i++){
            System.out.println("Habitacion "+(i+1)+" con costo = "+vectHab[i].getCosto()+" esta: "+vectHab[i].isOcupada());
            if(vectHab[i].isOcupada()){
                System.out.println("Habitacion ocupada por "+vectHab[i].informarCliente().getNombre()+" con DNI: "+vectHab[i].informarCliente().getNombre());
            }
        }
    }
    
    
}
