






















{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

Program ejercicio2;

Const 
  dimF = 30;

Type 
  rango = 1..dimF;

  oficina = Record
    cod: integer;
    dni: integer;
    expensa: real;
  End;

  vector = array[rango] Of oficina;

Procedure cargarVector(Var V:vector; Var dimL: integer);

Var 
  O: oficina;
Begin
  Randomize;
  O.cod := 1+ random(300);
  O.dni := 4000 + random (9000);
  O.expensa := 100 + random(9000);
  While (O.cod<>-1)And(dimL<dimF) Do
    Begin
      dimL := dimL + 1;
      V[dimL] := O;
      O.cod := 1+ random(300);
      O.dni := 4000 + random (9000);
      O.expensa := 100 + random(9000);
    End;
End;

Procedure imprimirVector(V:vector ; dimL: integer);

Var 
  i: integer;
Begin
  For i:=1 To dimL Do
    Begin
      writeln('Codigo oficina: ',V[i].cod);
      writeln('Dni del propietario: ',V[i].dni);
      writeln('Expensas que paga la oficina: ',V[i].expensa: 4: 2);
    End;
End;

Procedure ordenPorInsercion (V:vector; dimL:rango);

Var 
  i,j: rango;
  actual: oficina;
Begin
  For i:=2 To dimL Do
    Begin
      actual := V[i];
      j := i-1;
      While (j>0) And (V[j].cod>actual.cod) Do
        Begin
          V[j+1] := V[j];
          j := j-1;
        End;
      V[j+1] := actual;
    End;
  WriteLn('*** Vector ordenado por insersion ***');
  imprimirVector(V,dimL);
End;

Procedure ordenPorSeleccion( V:vector; dimL:rango);

Var 
  i,j,k: rango;
  O: oficina;
Begin
  For i:=1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If V[j].cod < V[k].cod Then
          k := j;
      O := V[k];
      V[k] := V[i];
      V[i] := O;
    End;
  WriteLn('*** Vector ordenado por seleccion ***');
  imprimirVector(V,dimL);
End;

Var 
  dimL: integer;
  V: vector;
Begin
  dimL := 0;
  cargarVector(V,dimL);
  ordenPorSeleccion(V,dimL);
  ordenPorInsercion(V,dimL);
End.
