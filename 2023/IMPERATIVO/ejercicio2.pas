
Program ejercicio2;

Const 
  max = 5;

Type 
  rango_zona = 1..max;

  prop = Record
    zona: rango_zona;
    cod: integer;
    tipoProp: integer;
    mt2: real;
    pMt2: real;
    pTot: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: prop;
    sig: lista;
  End;

  vectorProp = array [rango_zona] Of lista;

Procedure leerPropiedad( Var P: prop);
Begin
  write('Ingrese zona de propiedad: ');
  readln(P.zona);
  write('Ingrese codigo de propiedad: ');
  readln(P.cod);
  write('Ingrese tipo de propiedad: ');
  readln(P.tipoProp);
  write('Ingrese metros cuadrados de propiedad: ');
  readln(P.mt2);
  write('Ingrese precio de metros de metros cuadrados: ');
  readln(P.pMt2);
  If (P.pMt2<>-1) Then
    P.pTot := P.mt2 * P.mt2
End;

Procedure inicializarVector (Var v:vectorProp);

Var 
  i: rango_zona;
Begin
  For i:=1 To max Do
    v[i] := Nil;
End;


Procedure cargarPropiedad (Var l:lista; p:prop);

Var 
  ant,act,nue: lista;
Begin
  new(nue);
  nue^.data := p;
  nue^.sig := Nil;
  If (l = Nil) Then
    l := nue
  Else
    Begin
      ant := l;
      act := l;
      While (act <> Nil) And (act^.data.tipoProp < nue^.data.tipoProp) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (ant = act) Then
        Begin
          nue^.sig := l;
          l := nue;
        End
      Else
        Begin
          ant^.sig := nue;
          nue^.sig := act;
        End;
    End;
End;

Procedure cargarVector( Var V: vectorProp);

Var 
  P: prop;
Begin
  leerPropiedad(P);
  While (P.pMt2<>-1) Do
    Begin
      cargarPropiedad(V[P.zona],P);
      leerPropiedad(P);
    End;
End;

Procedure filtrarPropiedades (V:vectorProp; numZona:rango_zona; tipoProp: integer);
Begin
  While (V[numZona] <> Nil)And(V[numZona]^.data.tipoProp <= tipoProp) Do
    Begin
      If (V[numZona]^.data.tipoProp = tipoProp) Then
        writeln('Codigo de propiedad: ',V[numZona]^.data.cod);
      V[numZona] := V[numZona]^.sig;
    End;
End;

Var 
  V: vectorProp;
  numZona: rango_zona;
  tipoProp: integer;
Begin
  inicializarVector(V);
  cargarVector(V);
  Write('Ingrese numero de zona');
  ReadLn(numZona);
  Write('Ingrese tipo de propiedad');
  ReadLn(tipoProp);
  filtrarPropiedades(V,numZona,tipoProp);
End.
