/*
    B- Realice un programa que instancie una persona y un trabajador y muestre la
   representación de cada uno en consola. 
 */
package tema4;

/**
 *
 * @author ivanl
 */
public class Ej03 {
    public static void main (String[] args){
        
        Persona nuevaPersona = new Persona("Jose",35998874,28);
        Trabajador nuevoTrabajador= new Trabajador("Juan",20558941,50,"Pintor");

        System.out.println(nuevaPersona.toString());
        System.out.println(nuevoTrabajador.toString());

        
    }
}
