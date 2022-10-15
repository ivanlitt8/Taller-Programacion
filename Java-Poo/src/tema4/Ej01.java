/*
    Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
    representación String de cada uno. Pruebe el funcionamiento del método despintar.
 */
package tema4;

/**
 *
 * @author ivanl
 */
public class Ej01 {
    public static void main (String[] args){
        
        Triangulo nuevoTriangulo = new Triangulo(5,8,9,"Rojo","Verde");
        Circulo nuevoCirculo = new Circulo(2,"Amarillo","Azul");
        
        System.out.println("---------TRIANGULO---------");
        System.out.println(nuevoTriangulo.toString());        
        System.out.println("---------CIRCULO---------");
        System.out.println(nuevoCirculo.toString());
        
        nuevoTriangulo.despintar();
        nuevoCirculo.despintar();
        System.out.println("***********");

        System.out.println("---------TRIANGULO DESPINTADO---------");
        System.out.println(nuevoTriangulo.toString());        
        System.out.println("---------CIRCULO DESPINTADO---------");
        System.out.println(nuevoCirculo.toString());
        
    }
    
}
