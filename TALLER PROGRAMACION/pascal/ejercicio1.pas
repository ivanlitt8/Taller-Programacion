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
  cantidades = 0..99;
  rango = 0..dimF;

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

Procedure inicializarVect (Var vectP:productos);

Var 
  i: integer;
Begin
  For i:=1 To dimF Do
    Begin
      vectP[i].cod := 0;
      vectP[i].cant := 0;
    End;
End;

Procedure cargarVentas (Var V: venta; Var dimL: rango; Var vectP:productos);

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
Begin
  inicializarVect(vectP);
  leerVenta(V);
  While (V.cod<>0) And ( dimL < dimF ) Do
    Begin
      dimL := dimL+1;
      vectP[dimL] := V;
      leerVenta(V);
    End;
End;

Procedure ordenarVector(Var V:productos; dimL:rango);

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

Procedure imprimir( V: productos ; dimL: rango);

Var 
  i: Integer;
Begin
  For i:=1 To dimL Do
    Begin
      WriteLn('Producto codigo: ',V[i].cod,' con ',V[i].cant,' unidades.')
    End;
End;

Procedure eliminarVentas (Var v: productos; Var dimL: rango);

Function BuscarPosicion (v: productos; dimL: rango; buscar: codigos): codigos;

Var 
  pos: codigos;
Begin
  pos := 1;
  While (pos <= dimL) And (buscar > v[pos].cod) Do
    pos := pos + 1;
  If (pos > dimL) Then
    buscar := 0
  Else
    BuscarPosicion := pos;
End;

Function BuscarDesde (v: productos ; dimL, pos : integer; elemABuscar: codigos): rango;

Begin
  While (pos <= dimL) And (elemABuscar >= v[pos].cod) Do
    pos := pos + 1;
  If (pos > dimL) Then
    BuscarDesde := dimL
  Else
    BuscarDesde := pos - 1;
End;

Var 
  posInf, posSup, salto, i, valorInf,valorSup: rango;
Begin
  WriteLn('Ingrese valor inferior');
  ReadLn(valorInf);
  WriteLn('Ingrese valor superior');
  ReadLn(valorSup);
  posInf := BuscarPosicion (v, dimL, valorInf);
  If (posInf <> 0) Then
    Begin
      posSup := BuscarDesde (v, dimL, posInf, valorSup);
      salto := (posSup-posInf) + 1;
      For i:= posSup + 1 To dimL Do
        v[i-salto] := v[i];
      dimL := dimL - salto;
    End;
End;

Procedure cargarLista (v: productos; dimL: rango ; Var L: lista);

Procedure AgregarAdelante (Var L: lista; elem: venta);

Var 
  nue: lista;
Begin
  New(nue);
  nue^.dato := elem;
  nue^.sig := L;
  L := nue;
End;

Function Cumple (num: codigos): boolean;
Begin
  If (num Mod 2 = 0) Then
    Cumple := true
  Else
    Cumple := False;
End;

Var i: rango;
Begin
  L := Nil;
  For i:= dimL Downto 1 Do
    If Cumple (v[i].cod) Then
      AgregarAdelante (L, v[i]);
End;

Procedure imprimirLista (L:lista);
Begin
  While (L<>Nil) Do
    Begin
      WriteLn('Producto codigo: ',L^.dato.cod,' unidades: ',L^.dato.cant);
      L := L^.sig;
    End;
End;






// -----------------------------------Programa Principal-----------------------------------

Var 
  V: venta;
  dimL: rango;
  vectP: productos;
  L: lista;
Begin
  dimL := 0;
  cargarVentas(V,dimL,vectP);
  WriteLn('------------Ventas Cargadas-----------');
  imprimir(vectP,dimL);
  ordenarVector(vectP,dimL);
  WriteLn('------------Vector Ordenado por Codigo-----------');
  imprimir(vectP,dimL);
  eliminarVentas(vectP,dimL);
  WriteLn('------------Ventas Eliminadas-----------');
  imprimir(vectP,dimL);
  cargarLista(vectP,dimL,L);
  WriteLn('------------Lista Cargada-----------');
  imprimirLista(L);
End.
