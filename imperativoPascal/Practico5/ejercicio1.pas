// El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
// de las expensas de dichas oficinas.
// Implementar un programa que:

// 1. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada
//     oficina se ingresa código de identificación, DNI del propietario y valor de la expensa.
//     La lectura finaliza cuando llega el código de identificación -1.
// 2. Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el
//     vector ordenado por código de identificación de la oficina.
// 3. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de 
//     identificación de oficina y retorne si dicho código está en el vector. En el caso
//     de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar
//     que el código buscado no existe.
// 4. Tenga un módulo recursivo que retorne el monto total de las expensas.


Program ejercicio1;

Const 
  dimF = 300;

Type 
  rango = 1..dimF;
  oficina = Record
    cod: integer;
    dni: integer;
    valor: real;
  End;

  vectOficinas = array [rango] Of oficina;

Procedure generarOficinas (Var V: vectOficinas; Var dimL: integer);


Procedure leerOficina(Var O:oficina);
Begin
  O.cod := random(999);
  O.dni := random(999);
  O.valor := random(999);
  Writeln('Oficina ',O.cod,', dni: ',O.dni,' con valor: ',O.valor:2:1);
  Writeln('---------');
End;

Var 
  i: integer;
  O: oficina;
Begin
  dimL := 0;
  For i:= 1 To dimF Do
    Begin
      dimL := dimL +1;
      leerOficina(O);
      V[dimL] := O;
    End;
End;

Procedure ordenPorInsercion (Var V:vectOficinas; dimL:integer);

Var 
  i,j: integer;
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
End;


Procedure imprimirVector (V:vectOficinas; dimL:integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      Writeln('Oficina ',V[i].cod,', dni: ',V[i].dni,' con valor: ',V[i].valor:2:1);
      Writeln('**********************************');
    End;
End;

Procedure busquedaDicotomica (V: vectOficinas; ini,fin,dato:integer; Var pos: integer);
Begin
  pos := (ini + fin) Div 2;
  If (ini <= fin) Then
    Begin
      If (V[pos].cod = dato) Then
        Writeln('DNI del propietario :',V[pos].dni)
      Else
        Begin
          If (V[pos].cod>dato) Then
            busquedaDicotomica (V, ini, pos-1, dato, pos)
          Else If (V[pos].cod< dato) Then
                 busquedaDicotomica(V, pos+1, fin, dato, pos);
        End;
    End
  Else If (V[pos].cod<>dato) Then
         Writeln('El codigo de oficina buscado no existe')
End;

Function calcularMontoTotal(V:vectOficinas; i:Integer): real;
Begin
  If (i<=dimF)Then
    calcularMontoTotal := calcularMontoTotal(V,(i+1)) + V[i].valor;
End;

Var 
  V: vectOficinas;
  dimL,valor,pos,i: integer;
  tot: real;
Begin
  i := 1;
  tot := 0;
  generarOficinas(V,dimL);
  ordenPorInsercion(V,dimL);
  Writeln('----VECTOR ORDENADO POR INSERSION-----');
  imprimirVector(V,dimL);
  Writeln('Ingrese valor a buscar');
  ReadLn(valor);
  busquedaDicotomica(V,1,dimL,valor,pos);
  writeln(calcularMontoTotal(V,i): 2: 1);
End.
