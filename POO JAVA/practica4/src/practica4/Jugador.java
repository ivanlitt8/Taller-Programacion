/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author ivanl
 */
public class Jugador extends Empleado {
    private int golesAnotados;
    private int cantPartidos;
                    
    public Jugador(int golesAnotados, int cantPartidos, String nombre, double sueldo, int antig) {
        super(nombre, sueldo, antig);
        this.golesAnotados = golesAnotados;
        this.cantPartidos = cantPartidos;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    public int getCantPartidos() {
        return cantPartidos;
    }

    public void setCantPartidos(int cantPartidos) {
        this.cantPartidos = cantPartidos;
    }
    
    public double calcularEfectividad(){
        return (double) this.golesAnotados/this.cantPartidos;
    }
    
    public double calcularBono(){
        
        if(calcularEfectividad()>0.5){
            return super.getSueldo();
        }else{
            return 0.0;
        }
    }
    
    @Override
    public String toString() {
        return "Empleado: " + super.toString() + ". Es de tipo jugador con "+
                getCantPartidos()+" partidos, y " + getGolesAnotados() + " goles. Efectividad = "+
                this.calcularEfectividad();
    }
        
}
