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
class VisorFiguras {
     private int mostradas;
 
    public VisorFiguras(){
        mostradas=0;
    }
    public void mostrar(Figura f){
        System.out.println(f.toString()); 
        mostradas++;
    }
    public int getMostradas() {
        return mostradas;
 }
}
