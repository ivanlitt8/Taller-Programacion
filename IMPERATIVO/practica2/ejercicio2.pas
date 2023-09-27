// Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
// leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
// recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
// imprimir 2 5 6

Program ejercicio2;

Procedure procesar();

Procedure imprimirDigitos(num:integer);
Begin
  If (num<>0) Then
    Begin
      imprimirDigitos(num Div 10);
      writeln(num Mod 10);
    End;
End;

Var 
  num: integer;
Begin
  Write('Ingrese nuevo numero...');
  readln(num);
  If (num <> 0) Then
    Begin
      ImprimirDigitos(num);
      procesar();
    End;
End;

Begin
  procesar();
End.
