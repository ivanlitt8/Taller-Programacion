// 6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
// equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
// el número 0 (cero).

// Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
// ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
// próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.


Program ejercicio6;

Procedure leerNum(Var num: integer);
Begin
  Write('Ingrese numero decimal: ');
  readln(num);
End;

Procedure conversionBinario(num:integer);
Begin
  If (num<2) Then
    Write(num)
  Else
    Begin
      conversionBinario(num Div 2);
      Write(num Mod 2);
    End;
End;


Procedure procesar();

Var 
  num: integer;
Begin
  WriteLn('');
  leerNum(num);
  If (num<>0) Then
    Begin
      writeln('El numero ',num,' convertido a binario es :');
      conversionBinario(num);
      procesar();
    End;
End;

Begin
  procesar();
End.
