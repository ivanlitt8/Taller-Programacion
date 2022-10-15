// Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el
// equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa el número 0 (cero).

// Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
// ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima
// llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.

Program ejercicio6;

Procedure convBinario (nro: Integer);
Begin
  If (nro<2) Then
    Write(nro,' ')
  Else
    Begin
      convBinario (nro Div 2);
      Write(nro Mod 2,' ');
    End;
End;

Var 
  nro: Integer;
Begin
  writeln('Ingrese numero');
  readln(nro);
  WriteLn('El numero ',nro,' expresado en binario es ');
  convBinario(nro);
End.
