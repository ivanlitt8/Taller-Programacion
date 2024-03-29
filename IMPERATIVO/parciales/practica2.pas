{
Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
* 
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
   
}

program untitled;
const
	dimF = 10;
type

	rango = 1..dimF;

	prod = record
		cod: integer;
		rubro: rango;
		stock: integer;
		precio: real;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		data: prod;
		sig: lista;
	end;
	
	
	registro = record
		listado:lista;
		cod:integer;
	end;	
	
	arbol = ^nodo2;
	nodo2 = record
		data: registro;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rango] of arbol;
		
procedure inicializarVector(var V: vector);
var
	i: rango;
begin
	for i:= 1 to dimF do begin
		V[i]:= nil;
	end;
end;

procedure leerProducto(var P: prod);
begin
	write('Ingrese cod de producto: ');readln(P.cod);
	if(P.cod<>-1) then begin
		write('Ingrese rubro: ');readln(P.rubro);
		write('Ingrese stock: ');readln(P.stock);
		write('Ingrese precio: ');readln(P.precio);
		writeln('  ++ Producto leido ++  ');
	end;
end;

procedure agregarAlista(var L: lista; P: prod);
var
	nue: lista;
begin
	new(nue);
	nue^.data:= P;
	nue^.sig:= L;
	L:= nue;
end;

procedure agregarProducto(A: arbol;P: prod);
begin
	if(A=nil)then begin
		new(A);
		A^.data.listado:= nil;
		A^.HI:= nil;
		A^.HD:= nil;
		agregarAlista(A^.data.listado,P);
	end
	else begin
		if(A^.data.cod = P.cod) then
			agregarAlista(A^.data.listado,P)
		else if (A^.data.cod > P.cod) then 
			agregarProducto(A^.HI,P)
		else
			agregarProducto(A^.HD,P);
	end;
end;

procedure cargarVector(V:vector);
var
	P: prod;
begin
	leerProducto(P);
	while(P.cod<>-1) do begin
		agregarProducto(V[P.rubro],P);
		leerProducto(P);
	end;
end;

function buscarEnRubro(A: arbol; cod:integer):boolean;
begin
	if(A<>nil) then begin
		if(A^.data.cod = cod) then
			buscarEnRubro:= true;
		end
		else begin
			if(A^.data.cod < cod)then 
				buscarEnRubro(A^.HD,cod)
			else if (A^.data.cod > cod)then
				buscarEnRubro(A^.HI,cod);
		end;
	end
	else
		buscarEnRubro:= false;
end;

procedure buscarProd(V: vector);
begin
	write('Ingrese codigo de producto');readln(cod);
	write('Ingrese rubro ');readln(rub);
	writeln(buscarEnRubro(V[rub],cod);
end;

var
	V: vector;
BEGIN
	inicializarVector(V);
	cargarVector(V);
	buscarProd(V);
END.


