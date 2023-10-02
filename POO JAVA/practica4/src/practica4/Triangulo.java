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
public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(double lado1, double lado2, double lado3,String unCR, String unCL) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    public double calcularArea(){
       double s = this.calcularPerimetro();
       return Math.round(Math.sqrt(s*(s-this.lado1)*(s-this.lado2)*(s-this.lado3))*100.0)/100.0;
    }
    
    public double calcularPerimetro(){
       return  Math.round(((lado1+lado2+lado3)/2)*100.0)/100.0;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String toString() {
        return "Triangulo "+super.toString()+ " lado1: " + lado1 + ", lado2: " + lado2 + ", lado3: " + lado3 + '}';
    }
    
}
