/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11;

/**
 *
 * @author ivanl
 */
public class Torneo {

    private String nombre;
    private Fecha[] tabla;
    private int fechas;

    public Torneo(String nombre, int fechas, int M) {
        this.nombre = nombre;
        this.fechas = fechas;
        this.tabla = new Fecha[fechas]; //Java inicializa la tabla por defecto
        for (int i = 0; i < fechas; i++) {
            this.tabla[i] = new Fecha(M);
        }
    }

    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private int getFechas() {
        return fechas;
    }

    private void setFechas(int fechas) {
        this.fechas = fechas;
    }
    
    public void agregarJugador(int fecha, Goleador goleador){
        this.tabla[fecha-1].agregarGoleador(goleador);
    }

    public Goleador menosGoleadorFecha(int fecha) {
        return this.tabla[fecha-1].menosGoleador();
    }
    
    public int totalGoles(){
        int cant = 0;
        for (int i = 0; i < this.fechas; i++) {
            cant += this.tabla[i].golesFecha();
        }
        return cant;
    }

    @Override
    public String toString() {
        String aux = "Torneo 2022: " + nombre + "\n";
        for (int i = 0; i < this.fechas; i++) {
            aux += "Fecha numero " + (i + 1) + "/ Cantidad de goleadores " + this.tabla[i].getCantGoleadores() + "\n"
                    + this.tabla[i];
        }
        return aux;
    }
}
