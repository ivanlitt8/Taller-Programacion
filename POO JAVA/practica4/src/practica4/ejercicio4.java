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
public class ejercicio4 {

    /**
     4- Un objeto visor de figuras se encarga de mostrar en consola cualquier figura que reciba 
    y también mantiene cuántas figuras mostró. Analice y ejecute el siguiente programa y 
    responda: ¿Qué imprime? ¿Por qué?
     */
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
 
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);

        System.out.println(visor.getMostradas());
        
        // mostrar es un metodo de la clase visor muestra y que cuenta las veces que se 
        // mostro una figura, getMostradas devuelve dicho contador para el visor.
    }
    
}
