// Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído,
// sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo
// que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2 5 6


Program ejercicio2;

Procedure procesar();

Procedure imprimirDigitos(N:integer);
Begin
  If (N<>0) Then
    Begin
      imprimirDigitos(N Div 10);
      writeln(N Mod 10);
    End;
End;

Var 
  N: integer;
Begin
  WriteLn('Ingrese nuevo numero...');
  readln(N);
  If (N <> 0) Then
    Begin
      ImprimirDigitos(N);
      procesar();
    End;
End;

Begin
  procesar();
End.
