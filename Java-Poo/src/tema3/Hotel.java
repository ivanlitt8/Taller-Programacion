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
        for (int i=0;i<cantHabitaciones;i++){
            vectHab[i]= new Habitacion (GeneradorAleatorio.generarDouble(6001)+2000);
        }
    }
    
    public void cargarCliente(Persona C,int X ){
        if(vectHab[X].isOcupada()==false){
            vectHab[X].setCliente(C);
            vectHab[X].setOcupada(true);
        }
    }
            
    
    public void aumentarPrecio(double aumento){
        for (int i=0;i<cantHabitaciones;i++){
            vectHab[i].aumentarCosto(aumento);
        }
    }

    @Override
    public String toString(){
        String aux= "";
        for (int i=0;i<cantHabitaciones;i++) {
            aux= aux + "Habitacion "+(i+1)+"  "+vectHab[i].toString()+"\n";
        }
        return aux;
    }
    
    
}
