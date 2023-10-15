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
public class Venta {
    private int dni;
    private double litros;
    private double monto;
    private String medio;
    private String[] pagos = {"debito", "credito", "efectivo"};

    public Venta(int dni, double litros, double monto, String medio) {
        this.dni = dni;
        this.litros = litros;
        this.monto = monto;
        this.medio = medio;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    @Override
    public String toString() {
        return "dni de cliente: " + dni + ", litros cargados = " + litros + ", monto = " + monto + ", medio de pago: " + medio;
    }
    
    
    
    
    
    

}
