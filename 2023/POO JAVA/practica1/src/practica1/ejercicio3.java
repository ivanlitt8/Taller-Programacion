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
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio3 {

    /**
     3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice 
        la matriz con números aleatorios entre 0 y 30. 
        Luego realice las siguientes operaciones: 
       
        - Mostrar el contenido de la matriz en consola. 
        - Calcular e informar la suma de los elementos de la fila 1
        - Generar un vector de 5 posiciones donde cada posición j contiene la suma 
        de los elementos de la columna j de la matriz. Luego, imprima el vector.
        - Lea un valor entero e indique si se encuentra o no en la matriz. En caso de 
        encontrarse indique su ubicación (fila y columna) en caso contrario 
        imprima “No se encontró el elemento”.
     
        NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java
     */
    public static void main(String[] args) {
        
        int filas = 5, col = 5;
        
        int [][] matriz = new int[filas][col];
        
        int i,j,k;
        GeneradorAleatorio.iniciar();
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                System.out.print((i+1)+","+(j+1)+": "+matriz[i][j]+" - ");
            }
            System.out.println("");
        }
        /*
        System.out.println("------------------------------------");
        int total = 0;
        for(j=0;j<5;j++){
            total = total + matriz[0][j];
        }        
        System.out.println("La suma de los elementos de la fila 1 es: "+total);
        */
        int [] totalJ = new int[5];
        int tot;
        for(j=0;j<5;j++){
            tot = 0;
            for(i=0;i<5;i++){
                tot = tot + matriz[i][j];
            }
            totalJ[j]= tot;
        }
        /**
        System.out.println("------------------------------------");
        System.out.println("Suma de los elementos de las columnas:");
        for(k=0;k<5;k++){
            
            System.out.println("columna "+(k+1)+": "+totalJ[k]);
        }
        */
        
        System.out.println("Ingrese valor entero para buscar en la matriz");
        int valor = PaqueteLectura.Lector.leerInt();
        boolean encontrado = false;
        int colAct = 0;
        int filAct = 0;
        while((!encontrado)&&(colAct<col)){
            filAct = 0;
            while((!encontrado)&&(filAct<filas)){
                if(matriz[filAct][colAct]==valor){
                    encontrado = true;
                }
                filAct++;
            }
            colAct++;
        }
        if(!encontrado){
            System.out.println("El valor no existe en la matriz");
        }else{
            System.out.println("El valor existe fila :"+filAct+", columna :"+colAct);
        }
    }
}
