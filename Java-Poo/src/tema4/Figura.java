/*
    A-Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
    debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
    métodos propios. Además debe redefinir el método toString.

    B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.

    C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
    debe modificar: el de cada subclase o el de Figura?

    D- Añada el método despintar que establece los colores de la figura a línea “negra” y
    relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?

    E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
    representación String de cada uno. Pruebe el funcionamiento del método despintar.
 */
package tema4;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = " Area: " + this.calcularArea() +
                     " Perimetro: " + this.calcularPerimetro()+
                     " Color relleno: "  + getColorRelleno() + 
                     " Color linea: " + getColorLinea();             
             return aux;
       }

    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    public void despintar(){
        this.colorLinea = "Negra";
        this.colorRelleno = "Blanco";
    }
    
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
}





