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
import PaqueteLectura.GeneradorAleatorio;
public abstract class Sistema {

    private Estacion estacion;
    private int anioInicial;
    private int cantAnios;
    private double[][] temp;

    public Sistema(int anioInicial, int cantAnios, Estacion estacion) {
        this.estacion = estacion;
        this.anioInicial = anioInicial;
        this.cantAnios = cantAnios;
        this.temp = new double[cantAnios][12];
        for (int i = 0; i < cantAnios; i++) {
            for (int j = 0; j < 12; j++) {
                temp[i][j] = 25 + GeneradorAleatorio.generarDouble(50);
            }
        }
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    public void cargarTemp(int mes, int anio, double T) {
        this.temp[anio][mes] = T;
        System.out.println("Temperatura cargada");
    }

    public double obtenerTemp(int mes, int anio) {
        return this.temp[anio][mes];
    }
    
    public String mayorTemp(){
        double max = 0;
        int anioMax= -1;
        int mesMax = -1;
        for (int i = 0; i < cantAnios; i++) {
            for (int j = 0; j < 12; j++) {
                if(temp[i][j]>max){
                    max = temp[i][j];
                    anioMax = i;
                    mesMax = j;
                }
            }
        }
        return "La temp maxima fue en el anio "+anioMax+", mes "+mesMax;
    }
    
    public abstract String retornarMedia();

    @Override
    public String toString() {
        return estacion + "\n"+ retornarMedia();
    }
    
    
    

}
