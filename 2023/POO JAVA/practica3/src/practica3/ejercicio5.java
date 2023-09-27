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
public class ejercicio5 {

    /**
     * 5- A- Definir una clase para representar círculos. Los círculos se
     * caracterizan por su radio (double), el color de relleno (String) y el
     * color de línea (String). Provea un constructor que reciba todos los datos
     * necesarios para iniciar el objeto. Provea métodos para: -
     * Devolver/modificar el valor de cada uno de sus atributos (métodos get y
     * set) - Calcular el perímetro y devolverlo (método calcularPerimetro) -
     * Calcular el área y devolverla (método calcularArea)
     *
     * B- Realizar un programa que instancie un círculo, le cargue información
     * leída de teclado e informe en consola el perímetro y el área.
     *
     * NOTA: la constante PI es Math.PI
     */
    public static void main(String[] args) {
        Circulo circulo = new Circulo();
        System.out.println("Ingrese radio del circulo: ");
        circulo.setRadio(Lector.leerDouble());
        System.out.println("Ingrese color de relleno: ");
        circulo.setRelleno(Lector.leerString());
        System.out.println("Ingrese color de linea: ");
        circulo.setLinea(Lector.leerString());
        
        
        System.out.println(circulo);

    }

}
