/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
/**
 *
 * cada una desocupada y con costo aleatorio e/ 
    2000 y 8000.
    * 
 * De cada habitación conoce costo por noche, si está 
   ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
 */
public class Habitacion {
    private double costo;
    private boolean ocupada = false;
    private Cliente cliente;

    public Habitacion(double costo, Cliente cliente) {
        this.costo = costo;
        this.ocupada = true;
        this.cliente = cliente;
    }
    
    public Habitacion() {
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
        this.ocupada = true;
    }

    @Override
    public String toString() {
        if(isOcupada())
            return "OCUPADA por: "+ cliente;
        else
            return "DESOCUPADA";
    }
    
    
    
}
