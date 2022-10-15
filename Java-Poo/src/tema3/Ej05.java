/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */
public class Ej05 {
    
    public static void main (String[] args){
        
        System.out.println("Ingrese radio del nuevo Circulo");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese color de relleno");
        String relleno = Lector.leerString();
        System.out.println("Ingrese color de linea");
        String linea = Lector.leerString();
        Circulo nuevoCirculo = new Circulo(radio,relleno,linea);
        
        System.out.println(nuevoCirculo.toString());
        
    }
}
