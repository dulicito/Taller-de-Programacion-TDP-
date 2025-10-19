
package TC;

public class Empresa {
    private String nombre; 
    private String direccion;
    private double costoMes;
    private Cliente[][] almacenamiento;
    private int S; // sectores
    private int dl1; //dimL de sectores
    private int B; //bauleras
    private int dl2;// dimL de bauleras
    
    //constructores 
    //constructor 1: inicia los clientes a partir de la informacion necesaria
    public Empresa(String nombre, int S, int B) {
        this.nombre = nombre;
        this.almacenamiento = new Cliente[S][B];
        this.S = S;
        this.B = B;
        this.dl1 = 0;
        this.dl2 = 0;
        
        //inicializar matriz aunque java lo haga por default 
        for (int f = 0; f < S; f++) { //f = filas
            for (int c = 0; c < B; c++) { //c = columnas
                this.almacenamiento[f][c] = null;
            }
            
        }
    }    
    
    
    //constructor 2: la empresa a partir de una direccion, costo por mes y las 
    //dimensiones del espacio de almacenamiento (S Y B) y sin clientes cargados

    public Empresa(String direccion, double costoMes, int S, int B) {
        this.direccion = direccion;
        this.costoMes = costoMes;
        this.S = S;
        this.B = B;
        this.dl1 = 0;
        this.dl2 = 0;
        this.almacenamiento = new Cliente[S][B];

        //inicializar matriz aunque java lo haga por default 
        for (int f = 0; f < S; f++) { //f = filas
            for (int c = 0; c < B; c++) { //c = columnas
                this.almacenamiento[f][c] = null;
            }
            
        }
    }
    
    
    
    //metodo ingresarClienteAlAlmacen, teniendo en cuenta que los clientes primero
    // completan el primer sector en lugares sucesivos, luego el segundo y asi siguiendo
    
    public void ingresarClienteAlAlmacen(Cliente cli){
        //ubicarme en la pos dl de la matriz
        //pregunto si no superaron la dimension fisica
            //si no superaron entonces lo agrego a la posicion actual
         //si supero la dimension fisica entonces verifico la siguiente posicion y lo agrego 
         
         if (this.dl1 < this.S){
             this.almacenamiento[this.dl1][this.dl2] = cli;
             this.dl2++;
             
             if (this.dl2 == this.B){
                 this.dl1++;
                 this.dl2 = 0;
             }
         }else {
             System.out.println("No hay mas espacio disponible.");
         }
      
         }
    
    //listar los clientes de la localidad de Los hornos que alquilan bauleras del
    //sector X. se debe devolver un string con las representaciones de los mismos asi:
    // "dni, nombre, telefono, localidad, asegurado" (usar tostring de cliente y equals)
    
    public String clientesHornos(int X){
        String aux = "";
        int sector = X-1;
        
        if (sector >=0 ){
            if (sector < S){
                for (int c = 0; c < this.B; c++) {
                    Cliente cli = almacenamiento[sector][c];
                    if (cli != null ){
                        if (cli.getLocalidad().equals("Los Hornos")){
                            aux += cli.toString() + "\n";
                        }
                    }
                }
            }
        }
        return aux;
        
    }
    
    
    //obtener el numero del sector con mas clientes que hayan contratado seguro 
    //retornar el sector 
   
    public int sectorMasClientes(){
        int max = -1;
        int sectorMax = -1;
        
        for (int f = 0; f < this.S; f++) {
            int total = 0;
            for (int c = 0; c < this.B; c++) {
                Cliente cli = almacenamiento[f][c];
                if (cli != null){
                    if (cli.tieneSeguro()){
                        total++;
                    }
                }            }
            
            if (total > max){
                max = total;
                sectorMax = f;
            }
        }
        return sectorMax+1;
    }
    
    
    
    //tostring formado:
    //"Empresa: nombre - direccion; costo por mes
    // Sector 1:
    //      baulera 1: to string de cliente
            // ....
             
    //Sector 2:
             //....

    public String imprimirSectores(){
        String aux = "";
        for (int f = 0; f < this.S; f++) {
            aux += " Sector "+ (f+1)+"\n";
            for (int c = 0; c < this.B; c++) {
                if (this.almacenamiento[f][c] != null){
                    aux += this.almacenamiento[f][c].toString() + "\n";

                }
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "Empresa: "+this.nombre+"-"+this.direccion+"-Costo por mes: "+this.costoMes +"\n"
                + imprimirSectores();
        
        return aux;
                

    }

    
    
}
