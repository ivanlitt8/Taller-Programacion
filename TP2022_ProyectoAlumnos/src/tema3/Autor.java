 /*
    Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
    y que deben permitir devolver/modificar el valor de sus atributos y devolver una
    representación String formada por nombre, biografía y origen.
    Luego realice las modificaciones necesarias en la clase Libro.
 */
package tema3;

/**
 *
 * @author ivanl
 */
public class Autor {
   private String nombre;
   private String biografia; 
   private String origen;

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
   
    public Autor(){
       
    } 
   
   
    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    
    /**
     *
     * @return
     */
    @Override
    public String toString(){
        String aux; 
        aux = nombre + ", del pais " + origen +". Biografia: "+ biografia;
        return aux;
    }    
    
   
}
