/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

/**
 *
 * @author ivanl
 */
import PaqueteLectura.Lector;
public class ejercicio4 {

    /**
     4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
        (1..4). 
        
        Realice un programa que permita informar la cantidad de personas que 
        concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al 
        edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de 
        oficina a la cual quiere concurrir. 
        
        * La llegada de personas finaliza al indicar un nro. 
        de piso 9. Al finalizar la llegada de personas, informe lo pedido.
     */
    public static void main(String[] args) {
        
        int[][] edificio = new int[8][4];
        int i,j;
        for(i = 0;i<8;i++){
            for(j = 0;j<4;j++){
                edificio[i][j] = 0;
            }
        }
        
        int piso =0;
        int oficina = 0;
        
        while(piso != 9){
            System.out.println("Ingrese numero de piso: ");
            piso = Lector.leerInt();
            if(piso != 9){
                System.out.println("Ingrese numero de oficina: ");
                oficina = Lector.leerInt();
                edificio[piso-1][oficina-1]++;
            }
        }
        
        for(i = 0;i<8;i++){
            System.out.println("Piso numero: "+(i+1));
            for(j = 0;j<4;j++){
                if(edificio[i][j]!=0){
                    System.out.println("Oficina numero: "+(j+1));
                    System.out.println("Cantidad de ocupantes: "+edificio[i][j]);
                }
            }
            System.out.println("-----------------");
        }        
    }    
}
