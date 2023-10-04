/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author ivanl
 */
public class ejercicio4 {

    /**
     4- Una escuela de música arma coros para participar de ciertos eventos. Los coros poseen 
        un nombre y están formados por un director y una serie de coristas. Del director se 
        conoce el nombre, DNI, edad y la antigüedad (un número entero). De los coristas se conoce 
        el nombre, DNI, edad y el tono fundamental (un número entero). Asimismo, hay dos tipos 
        de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado 
        del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
        
        a. Implemente las clases necesarias teniendo en cuenta que los coros deberían crearse 
           con un director y sin ningún corista, pero sí sabiendo las dimensiones del coro.
        
        b. Implemente métodos (en las clases donde corresponda) que permitan:
        * agregar un corista al coro. 
            ** En el coro semicircular los coristas se deben ir agregando de izquierda 
               a derecha
            ** En el coro por hileras los coristas se deben ir agregando de izquierda a 
               derecha, completando la hilera antes de pasar a la siguiente.
        * determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus 
          coristas asignados o false en caso contrario.
        * determinar si un coro (se supone que está lleno) está bien formado. Un coro 
          está bien formado si:
            ** En el caso del coro semicircular, de izquierda a derecha los coristas 
               están ordenados de mayor a menor en cuanto a tono fundamental. 
            ** En el caso del coro por hileras, todos los miembros de una misma hilera 
               tienen el mismo tono fundamental y además todos los primeros
               miembros de cada hilera están ordenados de mayor a menor en cuanto 
               a tono fundamental.
        * devolver la representación de un coro formada por el nombre del coro, todos 
          los datos del director y todos los datos de todos los coristas.
          
        c. Escriba un programa que instancie un coro de cada tipo. Lea o bien la cantidad de 
        coristas (en el caso del coro semicircular) o la cantidad de hileras e integrantes por 
        hilera (en el caso del coro por hileras). Luego cree la cantidad de coristas necesarios,
        leyendo sus datos, y almacenándolos en el coro. Finalmente imprima toda la 
        información de los coros indicando si están bien formados o no.

     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
}
