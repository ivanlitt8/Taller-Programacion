















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

Program ejercicio3;

Const 
  dimF = 10;

Type 
  rango = 1..dimF;

  producto = Record
    cod: integer;
    rubro: rango;
    stock: integer;
    precio: real;
  End;

  max = Record
    cod: integer;
    stock: integer;
  End;

  arbol = ^nodo;
  nodo = Record
    data: producto;
    HI: arbol;
    HD: arbol;
  End;

  vectorRubro = array [rango] Of arbol;

  vectorContador = array [rango] Of max;

  vectorIntervalo = array [rango] Of integer;

Procedure inicializarVect(Var V: vectorRubro );

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

Procedure leerProducto(Var P: producto);
Begin
  write('Ingrese codigo de producto: ');
  readln(P.cod);
  If (P.cod<>-1)Then
    Begin
      write('Ingrese rubro de producto: ');
      readln(P.rubro);
      write('Ingrese stock: ');
      readln(P.stock);
      write('Ingrese precio de producto: ');
      readln(P.precio);
      writeln('  ++ Producto Cargado ++  ');
    End;
End;

Procedure cargarArbol(Var A: arbol; P: producto);
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data := P;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (A^.data.cod >= P.cod) Then
         cargarArbol(A^.HI,P)
  Else
    cargarArbol(A^.HD,P);
End;

Procedure cargarEstructura(Var V: vectorRubro);

Var 
  P: producto;
Begin
  leerProducto(P);
  While (P.cod<>-1) Do
    Begin
      cargarArbol(V[P.rubro],P);
      leerProducto(P);
    End;
End;

Procedure imprimirArbol(A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      writeln('Codigo: ',A^.data.cod);
      writeln('Rubro: ',A^.data.rubro);
      writeln('Stock: ',A^.data.stock);
      writeln('Precio: ',A^.data.precio:4:2);
      writeln('  -----------------  ');
      imprimirArbol(A^.HD);
    End;
End;

Procedure imprimirVector(V: vectorRubro);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    imprimirArbol(V[i]);
End;

Function busqueda(A: arbol; cod: integer): boolean;
Begin
  If (A <> Nil) Then
    Begin
      If (A^.data.cod <> cod) Then
        Begin
          If (A^.data.cod < cod) Then
            busqueda := busqueda(A^.HD,cod)
          Else If (A^.data.cod > cod) Then
                 busqueda := busqueda(A^.HI,cod);
        End
      Else
        busqueda := true;
    End
  Else
    busqueda := false;
End;

Procedure buscarCodEnRubro(V: vectorRubro);

Var 
  rub: rango;
  cod: integer;
Begin
  write('Ingrese rubro: ');
  readln(rub);
  write('Ingrese codigo de producto a buscar: ');
  readln(cod);
  If (busqueda(V[rub],cod)) Then
    WriteLn('El codigo existe en el rubro')
  Else
    writeln('El codigo no existe en el rubro');
End;

Function buscarMax(A:arbol): arbol;
Begin
  If (A^.HD <> Nil) Then
    buscarMax := buscarMax(A^.HD)
  Else
    buscarMax := A;
End;

Procedure cargarCantidad(V:vectorRubro; Var VC: vectorContador);

Var 
  i: rango;
  aux: arbol;
Begin
  For i:= 1 To dimF Do
    Begin
      aux := Nil;
      If (V[i] <> Nil )Then
        aux := buscarMax(V[i]);
      If (aux <> Nil ) Then
        Begin
          VC[i].cod := aux^.data.cod;
          VC[i].stock := aux^.data.stock;
        End
      Else
        Begin
          VC[i].cod := 0;
          VC[i].stock := 0;
        End;
    End;
End;

Function contarEntreValores(A:arbol ; cod1,cod2: integer): integer;
Begin
  If (A <> Nil) Then
    Begin
      If (A^.data.cod >= cod1) Then
        Begin
          If (A^.data.cod <= cod2) Then
            contarEntreValores := contarEntreValores(A^.HI,cod1,cod2)+ contarEntreValores(A^.HD,cod1,cod2)+ 1
          Else
            contarEntreValores := contarEntreValores(A^.HI,cod1,cod2);
        End
      Else
        contarEntreValores := contarEntreValores(A^.HD,cod1,cod2);
    End
  Else
    contarEntreValores := 0;
End;

Procedure cantidadEntreValores(V: vectorRubro; Var VI: vectorIntervalo);

Var 
  cod1,cod2,aux: integer;
  i: rango;
Begin
  write('Ingrese codigo 1: ');
  readln(cod1);
  write('Ingrese codigo 2: ');
  readln(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod2;
      cod2 := cod1;
      cod1 := aux;
    End;
  For i:= 1 To dimF Do
    Begin
      VI[i] := contarEntreValores(V[i],cod1,cod2);
    End
End;

Procedure imprimirVectorCant(VC:vectorContador);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    Begin
      If (VC[i].stock<>0) Then
        Begin
          writeln('Rubro: ',i);
          writeln('Codigo: ',VC[i].cod);
          writeln('Stock: ',VC[i].stock);
          writeln('************');
        End;
    End;
End;

Procedure imprimirVectorIntervalo(V: vectorIntervalo);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    Begin
      If (V[i]<>0) Then
        Begin
          writeln('Rubro: ',i);
          writeln(V[i]);
          writeln('********');
        End;
    End;
End;

Var 
  V: vectorRubro;
  VC: vectorContador;
  VI: vectorIntervalo;
Begin
  inicializarVect(V);
  cargarEstructura(V);
  imprimirVector(V);
  buscarCodEnRubro(V);
  cargarCantidad(V,VC);
  imprimirVectorCant(VC);
  cantidadEntreValores(V,VI);
  imprimirVectorIntervalo(VI);
End.
