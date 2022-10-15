// El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las 
// expensas de dichas oficinas.
// Implementar un programa modularizado que:

//  a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se 
//  ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza 
//  cuando se ingresa el código de identificación -1, el cual no se procesa.

//  b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.

//  c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.

Program ejercicio2;

Const 
  dimF = 300;

Type 
  rango = 0..dimF;

  pago = Record
    cod: integer;
    dni: integer;
    valor: real;
  End;

  vectOficinas = array [rango] Of pago;

Procedure imprimir (V:vectOficinas; dimL:rango);

Var 
  i: integer;
Begin
  For i:=1 To dimL Do
    WriteLn('Codigo de oficina: ',V[i].cod,' dni propietario ',V[i].dni,' valor ',V[i].valor:2:1);
End;

Procedure cargarPagos (Var V:vectOficinas; Var dimL:rango);

Procedure leerPago (Var P:Pago);
Begin
  WriteLn('Ingrese codigo de identificacion:');
  ReadLn(P.cod);
  WriteLn('Ingrese dni de propietario:');
  readln(P.dni);
  WriteLn('Ingrese valor de expensa:');
  readln(P.valor);
End;

Var 
  P: pago;
Begin
  dimL := 0;
  leerPago(P);
  While (P.cod<>-1) And (dimL<dimF) Do
    Begin
      dimL := dimL+1;
      V[dimL] := P;
      leerPago(P);
    End;
  imprimir(V,dimL);
End;

Procedure ordenPorInsercion (V:vectOficinas; dimL:rango);

Var 
  i,j: rango;
  actual: pago;
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
  WriteLn('vector ordenado por insersion');
  imprimir(V,dimL);
End;



Procedure ordenPorSeleccion( V:vectOficinas; dimL:rango);

Var 
  i,j,k: rango;
  P: pago;
Begin
  For i:=1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If V[j].cod < V[k].cod Then
          k := j;
      P := V[k];
      V[k] := V[i];
      V[i] := P;
    End;
  WriteLn('vector ordenado por seleccion');
  imprimir(V,dimL);
End;


Var 
  V: vectOficinas;
  dimL: rango;
Begin
  cargarPagos(V,dimL);
  ordenPorSeleccion(V,dimL);
  ordenPorInsercion(V,dimL);
End.
