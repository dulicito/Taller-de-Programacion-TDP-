public class Pareja {
    private String estiloDeBaile;
    private Participantes participante1;
    private Participantes participante2;
    
    public Pareja(String estilo, Participantes p1, Participantes p2){
        this.estiloDeBaile = estilo;
        this.participante1 = p1;
        this.participante2 = p2;
    }
    
//- Obtener la diferencia de edad de la pareja.
    public int obtenerDiferenciaDeEdad(){
        int edad = (this.participante1.getEdad() - this.participante2.getEdad());
        if (edad < 0){
            return edad * -1;
        }
        return edad;
    }
    
    public String getEstiloDeBaile(){
        return this.estiloDeBaile;
    }
}
