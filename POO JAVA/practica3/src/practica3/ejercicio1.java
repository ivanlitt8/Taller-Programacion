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
import PaqueteLectura.Lector;
public class ejercicio1 {

    /**
     1-
        A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
        tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
        Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
        Provea métodos para: 
        - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
        - Calcular el perímetro y devolverlo (método calcularPerimetro)
        - Calcular el área y devolverla (método calcularArea)
        
        B- Realizar un programa que instancie un triángulo, le cargue información leída desde
        teclado e informe en consola el perímetro y el área. 
        NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son 
        los lados y s = (a + b + c)/2. La función raíz cuadrada es Math.sqrt(#)
     */
    public static void main(String[] args) {
        
        Triangulo triangulo = new Triangulo();
        
        System.out.println("Crear nuevo Triangulo");
        System.out.println("Ingrese lado 1: ");
        triangulo.setLado1(Lector.leerDouble());
        System.out.println("Ingrese lado 2: ");
        triangulo.setLado2(Lector.leerDouble());
        System.out.println("Ingrese lado 3: ");
        triangulo.setLado3(Lector.leerDouble());
        System.out.println("Ingrese color de relleno: ");
        triangulo.setRelleno(Lector.leerString());
        System.out.println("Ingrese color de linea: ");
        triangulo.setLinea(Lector.leerString());
        
        
        System.out.println("El perimetro del triangulo ingresado es: "+triangulo.getPerimetro());
        
        System.out.println("El area del triangulo ingresado es: "+triangulo.getArea());
        
    }
    
}
