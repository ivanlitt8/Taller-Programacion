/*
    Definir una clase para representar triángulos. Un triángulo se caracteriza por el
    tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
    Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
    Provea métodos para:
    - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
    - Calcular el perímetro y devolverlo (método calcularPerimetro)
    - Calcular el área y devolverla (método calcularArea)
 */
package tema3;

/**
 *
 * @author ivanl
 */
public class Triangulo {
   private double ladoUno;
   private double ladoDos; 
   private double ladoTres;
   private String colorRelleno; 
   private String colorLinea;
   

    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String colorRelleno, String colorLinea) {
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public Triangulo() {
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

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
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

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
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
        String aux; 
        aux = "El perimetro de este triangulo es " + this.calcularPerimetro() + ", y su area es " + this.calcularArea();
        return aux;
    }    
    
}