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
public class ejercicio5 {

    /**
    5-
      A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a 
      lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura.
      
      B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el 
      visor y por último haga que el visor muestre sus figuras almacenadas.

     */
    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado();
 
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        visor.guardar(c1);
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        visor.guardar(r);
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        visor.guardar(c2);
        
        visor.mostrar();
    }
    
}
