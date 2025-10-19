/*Se debe representar un sistema para gestionar una aplicacion de delivery. la 
aplicacion tiene un nombre, una direccion web y una cantidad de usuarios registrados. 
existen dos tipos de aplicaciones de delivery: delivery de comidas, que conoce 
la cantidad de pedidos realizados, el monto recaudado y la cantidad de restaurantes 
asociados. delivery de envios rapidos, que contiene informacion de los envios 
efectuados(maximo n envios).de cada envio se conoce la direccion de origen, direccion 
de destino, monto cobrado al cliente y costo operativo del envio.

1) genere las clases necesarias y provea constructores para iniciar los objetos 
del modelo a partir de la informacion necesario. en particular, las aplicaciones 
se crean con 0 usuarios registrados. las aplicaciones de comidas comienzan con 
0 pedidos realizados, monto recaudado en 0 y 0 restaurantes asociados. las aplicaciones 
de envios rapidos se crean para un maximo de n envios, inicialmente sin envios efectuados.

2) implemente los metodos necesarios. en las clases que corresponda, para:
a) registrarPedidoEnvio: agrega un envio. el metodo debe retornar true si pudo 
agregarse y false en caso contrario.

b) registrarPedidoComida: recibe un monto m e incrementa en m el monto recaudado 
y en 1 la cantidad de pedidos realizados

c) calcularCotizacionComercial: retorna la cotizacion comercial, determinada de 
la siguiente forma:

*si se trata de un delivery de comidas, la cotizacion de $500 por cada restaurante 
asociados + $50 por cada usuario registrado + monto recaudado.

*si se trata de un delivery de envios rapidos, la cotizacion es de $400 por cada 
envio realizado + lo recaudado por cada envio. lo recaudado se obtiene restando al 
monto cobrado al cliente el costo operativo del envio.

d) devolver la representacion en string de una aplicacion de delivery

"nombre;direccion web;cantidad de usuarios; cotizacion comercial"

3) realice un programa que instancie un delivery de comidas y un delivery de envios 
rapidos. pruebe el correcto funcionamiento de los metodos implementados.*/


package TN;

public class main {

    public static void main(String[] args) {
        // instanciar un delivery de comidas y un delivery de envios rapidos
        DeliveryComida d1 = new DeliveryComida(5,5,"Chefsito","dqjdjqw.com");
        DeliveryEnviosRapidos d2 = new DeliveryEnviosRapidos(10,"AAA","ddwad.com");
        
        //probar cada metodo pedido en el inciso 2 
       
    
         Envio e1 = new Envio("California","Angeles",2312,12);/*
        Envio e2 = new Envio("BSAS","USA",2312,321);
        Envio e3 = new Envio("Peru","Afganistan",3213,22);
        Envio e4 = new Envio("Argentina","Chile",21312,222);*/
        
        d1.registrarPedidoComida(500);
        
        d2.registrarPedidoEnvio(e1);

        d1.calcularCotizacionComercial();
        d2.calcularCotizacionComercial();
        
        System.out.println(d1.toString());
        System.out.println(d2.toString());
    }
    
}
