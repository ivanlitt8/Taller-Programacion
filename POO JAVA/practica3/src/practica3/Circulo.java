/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author ivanl
 */
public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public Circulo() {
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double getPerimetro(){
        return Math.round((2*Math.PI*radio) * 100.0) / 100.0;
    }
    
    public double getArea(){
        return Math.round((Math.PI*Math.pow(radio,2)) * 100.0) / 100.0;
    }
    

    @Override
    public String toString() {
        return "El circulo de radio "+ this.getRadio() +" tiene un perimetro de "+this.getPerimetro()
                + " y un area de "+ this.getArea();
    }
    
    
}
