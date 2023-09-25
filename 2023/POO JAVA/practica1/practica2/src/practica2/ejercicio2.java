/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio2 {

    /**
     2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
    15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta 
    obtener edad 0. Luego de almacenar la información:
     - Informe la cantidad de personas mayores de 65 años.
     - Muestre la representación de la persona con menor DNI.
     */
    public static void main(String[] args) {
        
        int dimF = 15;
        int dimL = 0;
        int i;
        
        Persona[] personas = new Persona[dimF];
        
        
        for(i=0;i<dimF;i++){
            personas[i]= null;
        }
        
        String nombre;
        int dni;
        int edad = -1;
        
        GeneradorAleatorio.iniciar();
        while((dimL<dimF)&&(edad!=0)){
            nombre = GeneradorAleatorio.generarString(8);
            dni =  GeneradorAleatorio.generarInt(1000);
            edad = GeneradorAleatorio.generarInt(80);
            if(edad!=0) {
                personas[dimL] = new Persona(nombre,dni,edad);
                dimL++;
            }
        }
        
        for(i=0;i<dimL;i++){
            System.out.println("Persona numero: "+(i+1));
            System.out.println(personas[i].toString());
        }
        
        
        int mayores = 0;
        for (i=0;i<dimL;i++){
            if(personas[i].getEdad()>65)
                mayores++;
        }
        System.out.println("La cantidad de personas mayores de 65 años es: "+mayores);
        
        
        
        int min = 99999;
        int pos = 0;
        for (i=0;i<dimL;i++){
            if(personas[i].getDNI()<min) {
                min = personas[i].getDNI();
                pos = i;
            }
        }
        System.out.println("La persona con menor DNI es: ------ ");
        System.out.println(personas[pos].toString());      
        
    }
    
}
