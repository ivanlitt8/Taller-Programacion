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
public class Entrenador extends Empleado{
    private int campeonatosGanados; 

    public Entrenador(int campeonatosGanados, String nombre, double sueldo, int antig) {
        super(nombre, sueldo, antig);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        return (double) this.campeonatosGanados/super.getAntig();
    }
    
    public double calcularBono(){
        
        if(getCampeonatosGanados()>5){
            if(getCampeonatosGanados()>10)
                return 50000;
            return 30000;
        }else{
            return 5000;
        }
    }

    @Override
    public String toString() {
        return "Empleado: " + super.toString() + ". Es de tipo entrenador con "+
                getCampeonatosGanados()+" campeonatos ganados. Efectividad = "+this.calcularEfectividad();
    }
}
