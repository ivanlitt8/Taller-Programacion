/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author ivanl
 */
public class Jugador extends Empleado{
    private int partidosJugados;
    private int golesAnotados;

    public Jugador(int partidosJugados,int golesAnotados,String nombre,double sueldo,int antiguedad){
        super(nombre,sueldo,antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public double calcularEfectividad(){
        double aux;
        aux= golesAnotados/partidosJugados;
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if(calcularEfectividad()>0.5){
            aux= aux*2;
            return aux;
        }else{
            return aux;
        }
    }

    @Override
    public String toString() {
        String aux = super.toString()+
                "- ROL: Jugador{" + "partidosJugados=" + partidosJugados + 
                ", golesAnotados=" + golesAnotados + '}';
        return aux;
    }
    
    
}
                
            
         