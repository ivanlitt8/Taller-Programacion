/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoySeApruba;

/**
 *
 * @author ivanl
 */
public class Estacion {
    private String direccion;
    private Surtidor[] surtidores;
    private int dimL = 0;

    public Estacion(String direccion) {
        this.direccion = direccion;
        this.surtidores = new Surtidor[6];
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public void agregarSurtidor(Surtidor surtidor){
        this.surtidores[dimL] = surtidor;
        this.dimL++;
    }
    
    public void generarVenta(int numSurtidor, int dni, double litros, String pago){
        this.surtidores[numSurtidor-1].vender(dni,litros,pago);
    }
    
    public int surtidorMaxMonto(){
        double maxMonto = -1;
        int maxSurtidor = -1;
        for (int i = 0; i < this.dimL; i++) {
            if(this.surtidores[i].montoTotalSurtidor()>maxMonto){
                maxMonto = this.surtidores[i].montoTotalSurtidor();
                maxSurtidor = i+1;
            }
        }
        return maxSurtidor;
    }

    @Override
    public String toString() {
        String aux = "";
        aux += "Estacion de Servicio: " + getDireccion() + ", cantidad de surtidores = " + this.dimL+"\n";
        for (int i = 0; i < this.dimL; i++) {
            aux += "Surtidor "+ (i+1)+" "+ this.surtidores[i].getCombustible()+
                    " precio por litro = "+this.surtidores[i].getPrecioLitro()+": \n"+
                    this.surtidores[i];
        }
        return aux;
    }
    
    
    
    
}
