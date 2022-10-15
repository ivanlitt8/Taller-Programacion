/*
 Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido
 */
package tema1;
import PaqueteLectura.Lector;


public class Ej04 {
    public static void main(String[] args) {
        int dimF = 8;
        int dimC = 4;
        int [][] edificio = new int[dimF][dimC];
        
        System.out.print("Ingrese numero de piso ");
        int piso = Lector.leerInt();
        System.out.print("Ingrese numero de oficina ");
        int ofic = Lector.leerInt();
        
        while(piso!=9){
            edificio[piso-1][ofic-1]= edificio[piso-1][ofic-1] + 1;
            System.out.print("Ingrese numero de piso ");
            piso = Lector.leerInt();
            System.out.print("Ingrese numero de oficina ");
            ofic = Lector.leerInt();
        }
        int i,j;
        for (i=0;i<dimF;i++){
            for (j=0;j<dimC;j++){
                System.out.println("En el piso "+ (i+1) +" oficina "+ (j+1) +" hay " + edificio[i][j] + " personas ");
            }
        } 
    }
}
