















// Implementar un programa que procese la información de las ventas de productos
// de un comercio (como máximo 20).
















//     De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida
















//     (como maximo 99 unidades).  El ingreso de las ventas finaliza con el código 0 (no se procesa).
//     a. Almacenar la información de las ventas en un vector. El código debe
//     generarse automáticamente (random) y la cantidad se debe leer.
//     b. Mostrar el contenido del vector resultante.
//     c. Ordenar el vector de ventas por código.
//     d. Mostrar el contenido del vector resultante.
















//     e. Eliminar del vector ordenado las ventas con código de producto entre dos
//     valores que se ingresan como parámetros.
//     f. Mostrar el contenido del vector resultante.
















//     g. Generar una lista ordenada por código de producto de menor a mayor a partir
//     del vector resultante del inciso e., sólo para los códigos pares.
//     h. Mostrar la lista resultante.

Program ejercicio1;

Const 
  dimF = 10;

Type 
  codigos = 0..15;
  cantidades = 1..99;
  codProd = codigos;

  venta = Record
    cod: codigos;
    cant: cantidades;
  End;

  lista = ^nodo;
  nodo = Record
    dato: venta;
    sig: lista;
  End;

  productos = array [1..dimF] Of venta;

Procedure leerVenta (Var V: venta);
Begin
  Randomize;
  writeln ('Codigo de producto: ');
  V.cod := random(16);
  writeln (V.cod);
  If (V.cod <> 0) Then
    Begin
      write ('Ingrese cantidad (entre 1 y 99): ');
      readln (V.cant);
    End
End;
Procedure ordenarVector(Var V:productos; dimL:Integer);

Var 
  i, j, pos: integer;
  art: venta;
Begin
  For i:= 1 To dimL - 1 Do
    Begin {busca el mínimo y guarda en pos la posición}
      pos := i;
      For j := i+1 To dimL Do
        If (v[j].cod < v[pos].cod) Then
          pos := j;
      art := v[pos];
      v[pos] := v[i];
      v[i] := art;
    End;
End;

Procedure imprimir( V: productos ; dimL: integer);

Var 
  i: Integer;
Begin
  For i:=1 To dimL Do
    Begin
      WriteLn('Producto codigo: ',V[i].cod,' con ',V[i].cant,' unidades.')
    End;
End;

Var 
  V: venta;
  L: lista;
  dimL: Integer;
  vectP: productos;
Begin
  L := Nil;
  dimL := 0;
  leerVenta(V);
  While (V.cod<>0) And ( dimL < dimF ) Do
    Begin
      dimL := dimL+1;
      vectP[dimL] := V;
      leerVenta(V);
    End;
  imprimir(vectP,dimL);
  ordenarVector(vectP,dimL);
  WriteLn('------------Orden por codigo completo-----------');
  imprimir(vectP,dimL);
End.
