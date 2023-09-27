// Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido interesa conocer: 
// DNI del cliente, nombre, fecha y monto a abonar del pedido

// 1- Lea la informacion de los pedidos telefonicos hasta ingresar uno con monto 0. A partir de 
// esto, genere una estructura que almacene para cada DNI de cliente, su nombre y una lista con
// informacion de la fecha y monto de los pedidos realizados. La estructura debe estar ordenada
// por DNI y ser eficiente para la busqueda por dicho criterio.

// 2- Informe la cantidad de clientes que realizaron pedidos en una fecha que se lee por teclado

// 3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide
// con uno ingresado.

Program parcial3;

Type 

pedido = record
	dni: integer;
	nombre: string;
	fecha: string;
	monto: real;
end;

lista = ^nodo2;
nodo2 = record
	data: pedido;
	sig: lista;
end;

persona = record
	dni: integer;
	pedidos: lista;
	nombre: string;
end;

arbol= ^nodo1;
nodo1 = record
	data: persona; 
	HI: arbol;
	HD: arbol;
end;

procedure leerPedido(var P:pedido);
begin
	write('Ingrese monto de pedido: ');readln(P.monto);
	if(P.monto<>0)then begin
		write('Ingrese dni de persona: ');readln(P.dni);
		write('Ingrese nombre: ');readln(P.nombre);
		write('Ingrese fecha de pedido: ');readln(P.fecha);
		writeln('  ++ PEDIDO LEIDO ++  ');
	end;
end;

procedure agregarAlista(var L: lista; P: pedido);
var
	nue: lista;
begin
	new(nue);
	nue^.data:= P;
	nue^.sig:= L;
	L:= nue;
end;

procedure agregarPedido(var A: arbol; P: pedido);
begin
	if(A = nil) then begin
		new(A);
		A^.data.dni:= P.dni;
		A^.data.nombre:= P.nombre;
		A^.data.pedidos:= nil;
		agregarAlista(A^.data.pedidos,P);
	end
	else begin
		if(A^.data.dni = P.dni) then 
			agregarAlista(A^.data.pedidos,P)
		else if (A^.data.dni > P.dni) then
			agregarPedido(A^.HI,P)
		else
			agregarPedido(A^.HD,P);
	end;
end;

procedure cargarArbol(var A: arbol);
var
	P: pedido;
begin
	leerPedido(P);
	while(P.monto<>0) do begin
		agregarPedido(A,P);
		leerPedido(P);
	end;
end;

procedure imprimirLista(L: lista);
begin
	while(L<>nil) do begin
		writeln('Dni: ',L^.data.dni);
		writeln('Nombre: ',L^.data.nombre);
		writeln('Monto pedido: ',L^.data.monto:4:2);
		writeln('Fecha: ',L^.data.fecha);
		writeln('----------');
		L:= L^.sig;
	end;
end;

procedure imprimirArbol(A:arbol);
begin
	if(A<>nil) then begin
		imprimirArbol(A^.HI);
		imprimirLista(A^.data.pedidos);
		imprimirArbol(A^.HD);
	end;
end;

function contar(L:lista; fecha: string):integer;
var
	cant: integer;
begin
	cant:= 0;
	while(L<>nil) do begin
		if(L^.data.fecha = fecha) then
			cant:= cant + 1;
		L:= L^.sig;
	end;
	contar:= cant;	
end;

function calcularCant(A:arbol; fecha: string):integer;
begin
	if(A<>nil) then begin
		calcularCant:= calcularCant(A^.HI,fecha) + calcularCant(A^.HD,fecha) + contar(A^.data.pedidos,fecha);
	end
	else
		calcularCant:= 0;
end;

procedure cantPedidosFecha(A:arbol);
var
	fecha: string;
begin
	write('Ingrese fecha de pedidos: ');readln(fecha);
	writeln('La cantidad de pedidos en esa fecha fue de :',calcularCant(A,fecha),' pedidos');
end;

procedure contarEnLista(L:lista; var total: real; var cant:integer);
begin
	total:= 0;
	cant:= 0;
	while(L<>nil)do begin
		total:= total + L^.data.monto;
		cant:= cant + 1;
		L:= L^.sig
	end;
end;

procedure calcular(A:arbol;dni:integer; var total: real; var cant: integer);
begin
	if(A<>nil) then begin
		if(A^.data.dni=dni)then
			contarEnLista(A^.data.pedidos,total,cant)
		else begin
			if(A^.data.dni<dni)then
				calcular(A^.HD,dni,total,cant)
			else
				calcular(A^.HI,dni,total,cant);
		end;
	end;
end;

procedure totalAbonadoDNI(A:arbol);
var
	dni,cantPedidos: integer;
	montoTotal: real;
begin
	write('Ingrese dni de cliente: ');readln(dni);
	calcular(A,dni,montoTotal,cantPedidos);
	writeln('El total abonado para este DNI es: ',montoTotal:4:2,' por una cantidad de pedidos de: ',cantPedidos);
end;

Var 
	A: arbol;
Begin
	A:= nil;
	cargarArbol(A);
	imprimirArbol(A);
	cantPedidosFecha(A);
	totalAbonadoDNI(A);
End.

// 3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide
// con uno ingresado.
