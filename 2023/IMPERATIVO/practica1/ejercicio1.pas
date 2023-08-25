
Program ejercicio1;

Const 
  dimF = 50;

Type 
  rango = 1..dimF;
  rangoCod = 1..15;
  rangoCant = 1..99;
  rangoDia = 0..31;

  venta = Record
    dia: rangoDia;
    cod: rangoCod;
    cantvendida: rangoCant;
  End;

  vector = array[rango] Of venta;

Procedure leerVentas (Var v: vector; Var dimL: integer);

Var 
  Vt: venta;
Begin
  Randomize;
  Vt.dia := random(32);
  While (Vt.dia<>0)And(dimL < dimF) Do
    Begin
      Vt.cod := 1 + random(15);
      Vt.cantvendida := 1 + random(99);
      dimL := dimL + 1;
      v[dimL] := vt;
      Vt.dia := random(32);
    End;
End;

Procedure imprimirVector(V: vector; dimL:integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln('------------------');
      writeln('VENTA NUMERO: ',i);
      writeln('Dia de venta ',V[i].dia);
      writeln('Codigo de venta ',V[i].cod);
      writeln('Cantidad de venta ',V[i].cantvendida);
    End;
End;
Procedure ordenarporCodigo ( Var v: vector; dimL: integer );

Var i, j, pos: integer;
  item : venta;

Begin
  For i:=1 To dimL-1 Do
    Begin
      pos := i;
      For j := i+1 To dimL Do
        If (v[ j ].cod < v[ pos ].cod) Then pos := j;
      item := v[ pos ];
      v[ pos ] := v[ i ];
      v[ i ] := item;
    End;
  writeln('*** Vector ordenado por codigo ***');
  imprimirVector(v,dimL);
End;

Function buscarPosInicio(inicio,dimL:integer; v:vector): integer;

Var 
  pos: integer;
Begin
  pos := 1;
  While (pos<=dimL)And(v[pos].cod < inicio) Do
    Begin
      pos := pos + 1;
    End;
  buscarPosInicio := pos;
End;

Function buscarPosFinal(fin,dimL,pos:integer; v:vector): integer;

Begin
  While (pos<=dimL)And(v[pos].cod <= fin) Do
    Begin
      pos := pos + 1;
    End;
  buscarPosFinal := pos - 1 ;
End;

Procedure eliminarVentas(Var v:vector ; Var dimL: integer ; cod1,cod2: integer);

Var 
  inicio,fin,i,posInicial,posFinal,diferencia: integer;
Begin
  If ((cod1 > 0) And (cod1 <=15)) And ((cod2 > 0) And (cod2 <=15)) Then
    Begin
      If (cod1 < cod2)Then
        Begin
          inicio := cod1;
          fin := cod2;
        End
      Else
        Begin
          inicio := cod2;
          fin := cod1;
        End;
      posInicial := buscarPosInicio(inicio,dimL,v);
      posFinal := buscarPosFinal(fin,dimL,posInicial,v);
      diferencia := (posFinal - posInicial) + 1;
      For i:= posInicial To dimL-diferencia Do
        v[i] := v[i+diferencia];
      dimL := dimL - diferencia;
      writeln('*** Eliminaciones del vector realizadas ***');
      imprimirVector(v,dimL);
    End
  Else
    Begin
      writeln('Los codigos a eliminar estan fuera del rango');
    End;
End;

Procedure contarProdPorCod(v:vector; dimL: integer);

Var 
  pos,cont,codAct: integer;
Begin
  pos := 1;
  While (pos <= dimL) Do
    Begin
      cont := 0;
      codAct := V[pos].cod;
      While (pos <= dimL) And (codAct=V[pos].cod) Do
        Begin
          cont := cont + V[pos].cantvendida;
          pos := pos + 1;
        End;
      writeln('El producto con codigo ',codAct,' tiene ',cont,' unidades vendidas');
    End;
End;

Var 
  v: vector;
  dimL: integer;
  cod1,cod2: rangoCod;
Begin
  dimL := 0;
  leerVentas(v,dimL);
  writeln('*** Vector Original ***');
  imprimirVector(v,dimL);
  ordenarporCodigo(v,dimL);
  write('Ingrese primer codigo: ');
  readln(cod1);
  write('Ingrese segundo codigo: ');
  readln(cod2);
  eliminarVentas(v,dimL,cod1,cod2);
  contarProdPorCod(v,dimL);
End.
