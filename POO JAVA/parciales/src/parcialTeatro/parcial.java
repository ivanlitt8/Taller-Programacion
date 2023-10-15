/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialTeatro;

/**
 *
 * @author ivanl
 */
public class parcial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Funcion funcion = new Funcion("Funcion Test", "12 de mayo", "21.00", 5, 4);

        System.out.println(funcion.ocuparButaca(1, 1));
        System.out.println(funcion.ocuparButaca(2, 1));
        System.out.println(funcion.ocuparButaca(1, 2));
        System.out.println(funcion.ocuparButaca(5, 4));
        System.out.println(funcion.ocuparButaca(3, 3));
        System.out.println(funcion.ocuparButaca(1, 3));
        System.out.println(funcion.ocuparButaca(2, 4));
        
        System.out.println(funcion);
        
        System.out.println("------------Impresion columna 1------------");
        System.out.println(funcion.imprimirColumna(1));
        
        System.out.println("------------Desocupar fila 1------------");
        funcion.desocuparFila(1);
        
        System.out.println(funcion);
        

    }

}
