/*

    -A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
    (double), el color de relleno (String) y el color de línea (String).
    Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
    Provea métodos para:

    - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
    - Calcular el perímetro y devolverlo (método calcularPerimetro)
    - Calcular el área y devolverla (método calcularArea)

    B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
    informe en consola el perímetro y el área.
    NOTA: la constante PI es Math.PI

 */
package tema3;

/**
 *
 * @author ivanl
 */
public class Circulo {
   private double radio;
   private String colorRelleno;
   private String colorLinea;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
   
    public Circulo(){
        
    }

    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

   public double calcularPerimetro(){
       return 2*(Math.PI)*radio;
   }
   
   public double calcularArea(){
       return (Math.PI)*radio*radio;
   }
   

    @Override
    public String toString() {
        return "El Circulo posee radio = " + radio + ", y un area = " + this.calcularArea() ;
    }
   
           
}
