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

public class Entrenador extends Empleado{
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados,String nombre,double sueldo,int antiguedad){
        super(nombre,sueldo,antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public int getCantCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.campeonatosGanados = cantCampeonatosGanados;
    }
                
    public double calcularEfectividad(){
        double aux;
        aux= campeonatosGanados/super.getAntiguedad();
        return aux*100;
    }
    
    
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if(campeonatosGanados>0 && campeonatosGanados<5){
            aux= aux + 5000;
            return aux;
        }
        if(campeonatosGanados>4 && campeonatosGanados<11){
            aux= aux + 30000;
            return aux;
        }
        if(campeonatosGanados>10){
            aux= aux + 50000;
            return aux;
        }
        else{
            return aux;
        }
    }

    @Override
    public String toString() {
        String aux = super.toString()+
                "- ROL: Entrenador{" + "campeonatosGanados= " + campeonatosGanados + '}';
        return aux;
    }

                
}
