/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoySeApruba;

/**
 *
 * @author ivanl
 */
public class parcialNuevo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacion estacion = new Estacion("Avenida 13");

        Surtidor surtidor1 = new Surtidor("Disel", 150, 10);
        Surtidor surtidor2 = new Surtidor("Nafta", 200, 7);
        Surtidor surtidor3 = new Surtidor("GNC", 100, 5);
        Surtidor surtidor4 = new Surtidor("Nafta Premium", 250, 8);
        Surtidor surtidor5 = new Surtidor("Disel Premium", 200, 8);

        estacion.agregarSurtidor(surtidor1);
        estacion.agregarSurtidor(surtidor2);
        estacion.agregarSurtidor(surtidor3);
        estacion.agregarSurtidor(surtidor4);
        estacion.agregarSurtidor(surtidor5);

        estacion.generarVenta(1, 38800, 20, "efectivo");
        estacion.generarVenta(1, 31622, 10, "debito");
        estacion.generarVenta(2, 12544, 5, "debito");
        estacion.generarVenta(3, 36221, 40, "credito");
        estacion.generarVenta(3, 38237, 25, "efectivo");
        estacion.generarVenta(4, 84800, 10, "credito");
        estacion.generarVenta(5, 55800, 30, "credito");
        
        System.out.println("El surtidor que mas recaudo fue: ");
        System.out.println(estacion.surtidorMaxMonto());
        System.out.println("--------------------------");
        
        System.out.println(estacion);
        
        
        
    }

}
