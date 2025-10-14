package parciales.TL;

public class SalaRestringida extends Sala {
    private int contraseñaSala;
    private int cantParticipantesPorContraseñaErronea;
    
    //constructor
    public SalaRestringida( int ID, String url) {
        super(ID, url);
        this.contraseñaSala = 1234; //valor agregado por default 
        this.cantParticipantesPorContraseñaErronea = 0;
    }
    // agregar a la sala
    
    public void agregarParticipante (Participante p ) {
        if (p.getContraseñaIngresada() == this.contraseñaSala){
            super.agregarParticipante(p);
        }else {
            this.cantParticipantesPorContraseñaErronea++;
        }
    }
            
    //tasa admision
    public double tasaAdmision() {
        int totalSolicitudes = super.getDL()
                              + super.getCantParticipantesRechazadosPorFaltaDeEspacio()
                              + this.cantParticipantesPorContraseñaErronea;
        if (totalSolicitudes == 0) {
            return 0;
        }
        double tasa = (100.0 *super.getDL()) / totalSolicitudes;
        return tasa;
    }
    
    
    //to string 
    @Override
    public String toString() {
        String aux = "Sala Restringida ID: " + super.getID() + "\n" +
                     "URL: " + super.getUrl() + "\n" +
                     "Participantes conectados:\n";

        for (int i = 0; i < super.getDL(); i++) {
            aux+= super.getParticipante(i).toString() + "\n";
        }
            aux += "Tasa de admisión: " + this.tasaAdmision() + "%\n";
        return aux;
    }
}
  
