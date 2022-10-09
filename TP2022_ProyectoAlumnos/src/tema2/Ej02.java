/*

    Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
    15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
    obtener edad 0. Luego de almacenar la información:
     - Informe la cantidad de personas mayores de 65 años.
     - Muestre la representación de la persona con menor DNI.

 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author ivanl
 */
public class Ej02 {
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
     
        int dimF = 15;
        Persona [] vectPerso = new Persona [dimF];
        System.out.println("Comienza generacion de personas...");
        Persona p = new Persona(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(121));
        int dimL = 0;
        while(p.getEdad()!=0 && dimL<dimF){
            p = new Persona(GeneradorAleatorio.generarString(8),GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(121));
            vectPerso[dimL]= p;
            dimL= dimL+1;
        }
        int i;
        for (i = 0; i < dimL; i++) {
            System.out.println(vectPerso[i].toString());
        }
    
        int cant =0;
        Persona pMin = new Persona("ejemplo",999,100);
        for (i=0;i<dimF;i++){
            if(vectPerso[i].getDNI()< pMin.getDNI()){
                pMin = vectPerso[i];
            }
            if(vectPerso[i].getEdad()>65){
                cant = cant+1;
            }
        }
        System.out.println("La cantidad de personas mayores a 65 años es: "+ cant);
        System.out.println(pMin.toString());
    }
}