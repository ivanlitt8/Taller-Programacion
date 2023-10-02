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
public class ejercicio1 {

    /**
     1-
     A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo 
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
    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo(5, 3, 4, "rojo", "azul");
        Circulo circulo = new Circulo(5,"verde", "violeta");
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        triangulo.despintar();
        circulo.despintar();
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
    }
    
}
