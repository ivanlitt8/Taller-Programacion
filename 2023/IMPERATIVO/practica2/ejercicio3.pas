// Escribir un programa que:
// a. Implemente un módulo recursivo que genere una lista de números enteros “random”
// mayores a 0 y menores a 100. Finalizar con el número 0.
// b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
// c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
// d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
// encuentra en la lista o falso en caso contrario.

Procedure ejercicio3;

Type 
  lista = ^nodo;
  nodo = Record
    data: integer;
    sig: lista;
  End;

Var 
  L: lista;
Begin
  L := Nil;

End.
