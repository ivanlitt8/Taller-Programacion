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

public class Triangulo extends Figura {
   private double ladoUno;
   private double ladoDos; 
   private double ladoTres;   

    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String colorRelleno, String colorLinea) {
        super(colorRelleno,colorLinea);
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
    }

    public double getLadoUno() {
        return ladoUno;
    }

    public double getLadoDos() {
        return ladoDos;
    }

    public double getLadoTres() {
        return ladoTres;
    }

    public void setLadoUno(double ladoUno) {
        this.ladoUno = ladoUno;
    }

    public void setLadoDos(double ladoDos) {
        this.ladoDos = ladoDos;
    }

    public void setLadoTres(double ladoTres) {
        this.ladoTres = ladoTres;
    }
   
    // Calcular el perímetro y devolverlo (método calcularPerimetro)

    public double calcularPerimetro () {
        double perimetro = ladoUno+ladoDos+ladoTres;
        return perimetro;
    }
    public double calcularArea (){
        double S = this.calcularSemiperimetro();
        double area =  Math.sqrt(S*(S-ladoUno)*(S-ladoDos)*(S-ladoTres));
        if (area>0){
            return area;
        }else{
            System.out.println("Los lados ingresados no pueden formar un triangulo");
            return 0;
        }
    }
    
    public double calcularSemiperimetro () {
        double S = (this.calcularPerimetro()/2);
        return S;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString(){
        String aux = super.toString()+ 
            " Lado uno: "+ladoUno+
            " Lado dos: "+ladoDos+
            " Lado tres: "+ladoTres;
        return aux;
    }      
    
    
}