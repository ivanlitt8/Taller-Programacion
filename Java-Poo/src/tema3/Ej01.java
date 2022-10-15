/*
    Realizar un programa que instancie un triángulo, le cargue información leída desde
    teclado e informe en consola el perímetro y el área.
    NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
    los lados y s = (a+b+c)/2
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author ivanl
 */
public class Ej01 {
     public static void main(String[] args) {
         System.out.println("Ingrese largo lado 1 ");
         double ladoUno = Lector.leerDouble();
         System.out.println("Ingrese largo lado 2 ");
         double ladoDos = Lector.leerDouble();
         System.out.println("Ingrese largo lado 1 ");
         double ladoTres = Lector.leerDouble();
         System.out.println("Ingrese color de relleno ");
         String colorRelleno = Lector.leerString();
         System.out.println("Ingrese color de linea ");
         String colorLinea = Lector.leerString();
         
         Triangulo T1 = new Triangulo(ladoUno,ladoDos,ladoTres,colorRelleno,colorLinea);

         System.out.println(T1.toString());
         
     }
}