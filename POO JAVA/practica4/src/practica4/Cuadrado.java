package practica4;


public class Cuadrado extends Figura{
    
    private double lado;
    
    public Cuadrado(double unLado, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado(unLado);
    } 
    
    public double getLado(){
        return lado;       
    }
  
    public void setLado(double unLado){
        lado=unLado;
    }

    public double calcularArea(){
       return Math.round(getLado()* getLado()*100.0)/100.0;
    }
    
    public double calcularPerimetro(){
       return Math.round(getLado()*4*100.0)/100.0;
    }
    
    public String toString(){
       String aux = super.toString() + 
                    " Lado: " + getLado();
       return aux;
    } 
}
