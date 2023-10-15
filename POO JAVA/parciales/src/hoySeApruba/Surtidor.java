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
public class Surtidor {

    private Venta[] ventas;
    private String combustible;
    private double precioLitro;
    private int dimL = 0;
    private int maxVentas;

    public Surtidor(String combustible, double precioLitro, int maxVentas) {
        this.ventas = new Venta[maxVentas];
        this.combustible = combustible;
        this.precioLitro = precioLitro;
        this.maxVentas = maxVentas;
    }

    public double getMontoVenta(double litros) {
        return litros * this.precioLitro;
    }

    public void vender(int dni, double litros, String pago) {
        double monto = getMontoVenta(litros);
        this.ventas[dimL] = new Venta(dni, litros, monto, pago);
        dimL++;
    }
    
    public double montoTotalSurtidor(){
        double total = 0;
        for (int i = 0; i < this.dimL; i++) {
            total += this.ventas[i].getMonto();
        }
        return total;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public double getPrecioLitro() {
        return precioLitro;
    }

    public void setPrecioLitro(double precioLitro) {
        this.precioLitro = precioLitro;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dimL; i++){
            aux += this.ventas[i] + "\n";
        }
        return aux;
    }
}
