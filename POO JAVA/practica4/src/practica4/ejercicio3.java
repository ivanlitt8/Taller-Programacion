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
public class ejercicio3 {

    /**
     3-
     
     A-Implemente las clases para el siguiente problema. Una garita de seguridad quiere 
        identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden 
        entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son 
        personas que se caracterizan además por la tarea realizada en el predio. 
        Implemente constructores, getters y setters para las clases. Además tanto las personas 
        como los trabajadores deben responder al mensaje toString siguiendo el formato:
         Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
         Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”
     
    B- Realice un programa que instancie una persona y un trabajador y muestre la 
        representación de cada uno en consola. 
        
        NOTA: Reutilice la clase Persona (carpeta tema2).
     */
    public static void main(String[] args) {
        Trabajador trabajador1 = new Trabajador("jardinero", "Juan", 35465, 40);
        Trabajador trabajador2 = new Trabajador("cocinero", "Julio", 29556, 32);
        
        Persona persona1 = new Persona("Mariano", 17654, 18);
        Persona persona2 = new Persona("Marcelo", 18964, 17);
        
        System.out.println(trabajador1);
        System.out.println(trabajador2);
        System.out.println(persona1);
        System.out.println(persona2);
    }
    
}
