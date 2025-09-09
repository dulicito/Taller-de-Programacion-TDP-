{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
c. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas}

wtfff con este ej. dsp lo hago :c


{codigo de adrian}
{
    2. Escribir un programa que: 
    
    a.  Implemente un módulo que genere aleatoriamente información de ventas de un comercio. 
        Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar 
        con el código de producto 0. Un producto puede estar en más de una venta. Se pide: 
    
        i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de 
        producto. Los códigos repetidos van a la derecha. 
            
        ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
        código de producto. Cada nodo del árbol debe contener el código de producto y la 
        cantidad total de unidades vendidas. 
    
        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
        código de producto. Cada nodo del árbol debe contener el código de producto y la lista de 
        las ventas realizadas del producto. 
    
        Nota: El módulo debe retornar TRES árboles. 
    
            b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad 
            total de productos vendidos en la fecha recibida. 
            
            c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto 
            con mayor cantidad total de unidades vendidas. 
            
            d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto 
            con mayor cantidad de ventas. 
}


program Clase3Actividad2;
type
	
	{
		i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de 
        producto. Los códigos repetidos van a la derecha. 
	}
	
    RangoDia = 1..31;
    RangoMes = 1..12;
    
    
    calendario = record
        dia:RangoDia;
        mes:RangoMes;
    end;
    
    
    venta = record
        codprod:integer;// Codigo de producto.
        fecha:calendario;
        unidades:integer;// Cantidad de unidades vendidas.
    end;
	
	
    arbol = ^nodo;
    nodo = record
        dato:venta;
        Hd:arbol;
        Hi:arbol;
    end;
    
    {
		ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
        código de producto. Cada nodo del árbol debe contener el código de producto y la 
        cantidad total de unidades vendidas. 
	}
    
    productos = record
		codprod:integer;
		Totalcant:integer;
	end;
	arbol2 = ^nodo2;
	nodo2 = record
		dato:productos;
		HD:arbol2;
		Hi:arbol2;
	end;
	{
	        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
        código de producto. Cada nodo del árbol debe contener el código de producto y la lista de 
        las ventas realizadas del producto.  
	}
	vendidos = record
		unidades:integer;
		fecha:calendario;
	end;
	prodvend = record
		codprod:integr;
		L:Lista;
		
	end;
	
	Lista = ^nodo3A;
	nodo3A = record
		dato:vendidos;
		sig:Lista;
	end;
	
	arbol3 = ^nodo3
	nodo3 = record
		dato:prodvent;
		Hd:arbol3;
		Hi:arbol3;
	end;
	
	
	
{
    a.  Implemente un módulo que genere aleatoriamente información de ventas de un comercio. 
        Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar 
        con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
}





{
     i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de 
        producto. Los códigos repetidos van a la derecha.
}




{
    ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por 
        código de producto. Cada nodo del árbol debe contener el código de producto y la 
        cantidad total de unidades vendidas. 
}


var
	
begin
	
end.
