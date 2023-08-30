// Escribir un programa que:
// a. Implemente un módulo recursivo que genere una lista de números enteros “random”
// mayores a 0 y menores a 100. Finalizar con el número 0.
// b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
// c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
// d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
// encuentra en la lista o falso en caso contrario.

Program ejercicio3;

Type 
  lista = ^nodo;
  nodo = Record
    data: integer;
    sig: lista;
  End;

Procedure cargarEnLista (Var L: lista; num: integer);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := num;
  nue^.sig := L;
  L := nue;
End;

Procedure generarListaRecursiva (Var L: lista);

Var 
  num: integer;
Begin
  num := Random(100);
  If (num <> 0) Then
    Begin
      cargarEnLista(L,num);
      generarListaRecursiva(L);
    End;
End;

Procedure imprimirLista(L: lista);
Begin
  If (L <> Nil) Then
    Begin
      WriteLn(L^.data);
      imprimirLista(L^.sig);
    End;
End;

Function buscarMinimo(L:lista; min:integer): integer;
Begin
  If (L = Nil) Then //llegué al final de la lista
    buscarMinimo := min //retorno el mínimo
  Else
    Begin
      If (L^.data < min) Then //compruebo si es el minimo
        min := L^.data ;
      //actualizo el minimo
      buscarMinimo := buscarMinimo(L^.sig,min);
      // llamo recursivamente a la funcion
    End;
End;

Function buscarMaximo(L:lista; max:integer): integer;
Begin
  If (L = Nil) Then //llegué al final de la lista
    buscarMaximo := max //retorno el mínimo
  Else
    Begin
      If (L^.data > max) Then //compruebo si es el minimo
        max := L^.data ;
      //actualizo el minimo
      buscarMaximo := buscarMaximo(L^.sig,max);
      // llamo recursivamente a la funcion
    End;
End;

Function buscarValor (L:lista; num:integer): Boolean;
Begin
  If (L=Nil) Then
    buscarValor := false
  Else
    Begin
      If (L^.data = num) Then
        buscarValor := true
      Else
        buscarValor := buscarValor(L^.sig,num);
    End;
End;

Var 
  L: lista;
  min,max, num: integer;
Begin
  L := Nil;
  min := 100;
  max := 0;
  Randomize;
  generarListaRecursiva(L);
  imprimirLista(L);
  writeln('El minimo es: ',buscarMinimo(L,min));
  writeln('El maximo es: ',buscarMaximo(L,max));
  Write('Ingrese valor a buscar...');
  ReadLn(num);
  WriteLn(buscarValor(L,num));
End.
