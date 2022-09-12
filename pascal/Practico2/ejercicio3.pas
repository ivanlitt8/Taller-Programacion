// Escribir un programa que:

// a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y
// menores a 100. Finalizar con el número 0.

// b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

// c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

// d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en
// la lista o falso en caso contrario.

Program ejercicio3;

Type 

  lista = ^nodo;
  nodo = Record
    num: integer;
    sig: lista;
  End;
Procedure generarLista (Var L: lista);

Procedure agregarEnLista(Var L:lista; N:integer);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.num := N;
  nue^.sig := L;
  L := nue;
End;

Var 
  N: integer;
Begin
  N := random(100);
  writeln('numero: ',N);
  If (N<>0) Then
    Begin
      generarLista(L);
      agregarEnLista(L,N);
    End
  Else
    L := Nil;
End;


Procedure busquedas (L:lista);

Function buscarMinimo(L:lista; Var min:integer) : integer;
Begin
  If (L<>Nil) Then
    Begin
      If (L^.num<min)Then
        min := L^.num;
      L := L^.sig;
      buscarMinimo(L,min);
    End;
  buscarMinimo := min;
End;

Function buscarMaximo(L:lista; Var max:integer) : integer;
Begin
  If (L<>Nil) Then
    Begin
      If (L^.num>max)Then
        max := L^.num;
      L := L^.sig;
      buscarMaximo(L,max);
    End;
  buscarMaximo := max;
End;


Function buscarValor (L:lista; val:integer): Boolean;
Begin
  If (L=Nil) Then
    buscarValor := false
  Else
    Begin
      If (L^.num=val) Then
        buscarValor := true
      Else
        buscarValor := buscarValor(L^.sig,val);
    End;
End;

Var 
  min,max,val: integer;
Begin
  min := 100;
  max := 0;
  WriteLn(buscarMinimo(L,min));
  WriteLn(buscarMaximo(L,max));
  WriteLn('Ingrese valor a buscar');
  ReadLn(val);
  WriteLn(buscarValor(L,val));
End;


Var 
  L: lista;
Begin
  generarLista(L);
  busquedas(L);
End.
