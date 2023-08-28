// Una librería requiere el procesamiento de la información de sus productos. De cada
// producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
// Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
// a. Lea los datos de los productos y los almacene ordenados por código de producto y
// agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
// cuando se lee el precio 0.
// b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
// c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
// puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
// es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
// d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
// métodos vistos en la teoría.
// e. Muestre los precios del vector resultante del punto d).
// f. Calcule el promedio de los precios del vector resultante del punto d).

Program ejercicio4;

Const 
  dimF = 8;

Type 
  rango = 1..dimF;
  
  rangoRubro = 1..30;
  
  prod = Record
    cod : integer;
    rubro: rango;
    precio: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: prod;
    sig: lista;
  End;

  vector = array [rango] Of lista;
  vectorRubTres = array [rangoRubro] Of prod;

Procedure leerProd(Var P: prod);
Begin
  write('Ingrese precio de producto: ');
  readln(P.precio);
  If (P.precio<>0) Then
    Begin
      write('Ingrese codigo de producto: ');
      readln(P.cod);
      write('Ingrese rubro de producto: ');
      readln(P.rubro);
    End;
End;

procedure cargarEnLista(var L: lista; P: prod);
var
	nuevo, actual, anterior: lista;
begin
	new(nuevo);
    nuevo^.data := P;
    nuevo^.sig := nil;
    if (L = nil) then begin // Caso especial: la lista está vacía
		L := nuevo;
    end
    else if (P.cod > L^.data.cod) then begin  // Caso especial: el nuevo nodo debe ser el primer elemento de la lista
		nuevo^.sig := L;
        L := nuevo;
    end
    else begin // Recorrer la lista hasta encontrar la posición adecuada para insertar el nuevo nodo
		actual := L;
        anterior := nil;
		while (actual <> nil) and (P.cod <= actual^.data.cod) do begin
			anterior := actual;
			actual := actual^.sig;
		end; // Insertar el nuevo nodo en la posición adecuada
        nuevo^.sig := actual;
        anterior^.sig := nuevo;
    end;
end;

Procedure cargarProductos(Var V: vector);

Var 
  P: prod;
Begin
  leerProd(P);
  While (P.precio<>0) Do
    Begin
      cargarEnLista(V[P.rubro],P);
      leerProd(P);
    End;
End;

Procedure imprimirProductos(V: vector);

Var 
  i: rango;
  aux: lista;
Begin
  For i:= 1 To dimF Do
    Begin
      aux := V[i];
      If (aux<>Nil) Then
        Begin
          writeln('Rubro: ',i);
          While (aux<>Nil) Do
            Begin
              writeln('Codigo de producto: ',aux^.data.cod);
              aux := aux^.sig;
            End;
        End;
    End;
End;

Procedure inicializVectProd(Var V: vector);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

procedure cargarVectorRubTres(L: lista; var VP: vectorRubTres; var dimL: integer);
begin
	dimL:= 0;
	while(L<>nil)and(dimL<30)do begin
		dimL:= dimL + 1;
		VP[dimL]:= L^.data;
		L:= L^.sig;
	end;
end;

procedure imprimirVector(VP:vectorRubTres ; dimL:integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('********');
		writeln('',VP[i].cod);
		writeln('',VP[i].rubro);
		writeln('',VP[i].precio:4:2);
	end;
end;

Procedure ordenarPorInsercion (var VP:vectorRubTres; dimL:rango);

Var 
  i,j: integer;
  actual: prod;
Begin
  For i:=2 To dimL Do
    Begin
      actual := VP[i];
      j := i-1;
      While (j>0) And (VP[j].precio>actual.precio) Do
        Begin
          VP[j+1] := VP[j];
          j := j-1;
        End;
      VP[j+1] := actual;
    End;
  WriteLn('*** Vector ordenado por insersion ***');
End;

procedure calcularPromPrecios(VP: vectorRubTres; dimL: integer);
var
	total: real;
	i: integer;
begin
	total:= 0;
	for i:= 1 to dimL do begin
		total:= total + VP[i].precio;
	end;
	writeln('El promedio de precio de los productos de rubro 3 es :',(total/dimL):4:2);
end;

Var 
  V: vector;
  VP: vectorRubTres;
  dimL: integer;
Begin
	inicializVectProd(V);
	cargarProductos(V);
	imprimirProductos(V);
	cargarVectorRubTres(V[3],VP,dimL);
	imprimirVector(VP,dimL);
	ordenarPorInsercion(VP,dimL);
	imprimirVector(VP,dimL);
	calcularPromPrecios(VP,dimL);
End.
