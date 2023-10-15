/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialTeatro;

/**
 *
 * @author ivanl
 */
public class Butaca {
    private double precio;
    private boolean ocuapada = false;
    private int nroFila;
    private int nroColumna;

    public Butaca(int nroFila, int nroColumna) {
        this.precio = 800+(100*nroFila);
        this.nroFila = nroFila;
        this.nroColumna = nroColumna;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isOcuapada() {
        return ocuapada;
    }

    public void setOcuapada(boolean ocuapada) {
        this.ocuapada = ocuapada;
    }

    public int getNroFila() {
        return nroFila;
    }

    public void setNroFila(int nroFila) {
        this.nroFila = nroFila;
    }

    public int getNroColumna() {
        return nroColumna;
    }

    public void setNroColumna(int nroColumna) {
        this.nroColumna = nroColumna;
    }
    
   
    @Override
    public String toString() {
        return "Butaca F:" + (getNroFila()+1)+", C:"+(getNroColumna()+1) +" precio= " + getPrecio()+ "$, ocuapada= " + isOcuapada();
    }
    
    
    
    
    
}
