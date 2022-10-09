/*
 - El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author ivanl
 */
public class Ej05 {
    
    public static void main(String[] args) {
        int dimF = 5;
        int dimC = 4;
        double [][] matriz = new double[dimF][dimC];
        
        int i,j;
        double nota;
        for (i=0;i<dimF;i++){ //Carga de notas
            System.out.println("Cliente "+(i+1));
            for(j=0;j<dimC;j++){
                System.out.println("Ingrese nota de categoria "+(j));
                nota = Lector.leerDouble();
                while(nota<0 || nota>10){
                    System.out.println("*--- La nota debe estar entre 0 y 10 ---*");
                    System.out.println("Ingrese nota de categoria "+(j));
                    nota = Lector.leerDouble();

                }
                matriz[i][j]= nota;
            }
        }
        double total;
        for (j=0;j<dimC;j++){
            total =0;
            for(i=0;i<dimF;i++){
                total = total + matriz[i][j];
            }
            System.out.println("El puntaje promedio de la categoria "+j+" es "+(total/5));
        }
    }
}
     
