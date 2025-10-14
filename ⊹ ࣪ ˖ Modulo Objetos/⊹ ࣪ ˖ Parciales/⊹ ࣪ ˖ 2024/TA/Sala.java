
package parciales.TL;

public class Sala {
    private int ID;
    private String url;
    private Participante[] participante;
    private int cantParticipantesRechazadosPorFaltaDeEspacio;
    private int DF; 
    private int DL; 
    
    //constructor 
    public Sala(int ID, String url) {
        this.ID = ID;
        this.url = url;
        this.DF = 300;
        this.DL = 0;
        this.cantParticipantesRechazadosPorFaltaDeEspacio = 0;
        
        this.participante = new Participante[this.DF];
        for (int i = 0; i < DF; i++) {
            this.participante[i] = null;
        }
        
    }

    public int getID() {
        return ID;
    }

    public String getUrl() {
        return url;
    }

    public Participante getParticipante(int i) {
        return this.participante[i];
    }

    public int getDL() {
        return DL;
    }

    public int getCantParticipantesRechazadosPorFaltaDeEspacio() {
        return cantParticipantesRechazadosPorFaltaDeEspacio;
    }
    
    
    //agregar participante a sala
    
    public void agregarParticipante ( Participante p ){
        if (this.DL < this.DF){
            participante[DL] = p;
            DL++;
        } else {
            this.cantParticipantesRechazadosPorFaltaDeEspacio++;
        }
    }
    //reiniciar sala
    
    public void reiniciarSala(){
        for (int i = 0; i < DL; i++) {
            this.participante[i] = null;
        }
        this.DL = 0;
        this.cantParticipantesRechazadosPorFaltaDeEspacio = 0;
    }
    //tasa admision
    
    public double tasaAdmision(){
        int totalSolicitudes = this.DL + this.cantParticipantesRechazadosPorFaltaDeEspacio;
        double div = (double)this.DL / totalSolicitudes;
        double aux = 100*div;
        return aux; 
    }
    //toString

    @Override
    public String toString() {
        String aux = "Sala ID: " + this.ID + "\n" +
                     "URL: " + this.url + "\n" +
                     "Participantes conectados:\n";
        for (int i = 0; i < this.DL; i++) {
            aux += this.participante[i].toString();
        }
        aux += "Tasa de admisión: " + this.tasaAdmision() + "%\n";
        return aux;
    }
    
    
}
