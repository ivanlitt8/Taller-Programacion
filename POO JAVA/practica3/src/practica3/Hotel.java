/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
import PaqueteLectura.GeneradorAleatorio;
        
/**
 *
 * @author ivanl
 */
public class Hotel {
    private int dimF;
    private Habitacion[] habitaciones; // Se inicializa por defecto ?

    public Hotel(int dimF) {
        this.dimF = dimF;
        this.habitaciones = new Habitacion[dimF];
        for(int i= 0; i<dimF; i++){
            this.habitaciones[i] = new Habitacion();
        }
    }
    
    public Hotel() {
    }
    
    public void setValores(){
        for (int i=0;i<dimF;i++){
            this.habitaciones[i].setCosto(2000 + GeneradorAleatorio.generarInt(6000));
        }
    }
    
    public boolean verificarHabitacion(int num){
        return this.habitaciones[num].isOcupada();
    }
    
    public void cargarCliente(Cliente cliente,int num){
        this.habitaciones[num].setCliente(cliente);
    }
    
    public void setAumento(double valor){
        for (int i=0;i<dimF;i++){
            this.habitaciones[i].setCosto(this.habitaciones[i].getCosto()+valor);
        }
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i=0;i<dimF;i++){
            aux += "Habitacion "+(i+1)+": "+habitaciones[i].getCosto()+ " esta "+habitaciones[i];
        }
        return aux;
    }
}
