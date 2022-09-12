
Program ejercicio1;

Type 

  rango = 1..99;

  str = string [25];

  socio = Record
    nro: Integer;
    nombre: str;
    edad: rango;
  End;

  arbol = ^nodo;
  nodo = Record
    data: socio;
    hd: arbol;
    hi: arbol;
  End;

Function buscarNroMax (A:arbol): Integer;
Begin
  If (A=Nil) Then
    buscarNroMax := -1
  Else
    Begin
      If (A^.hd <> Nil) Then
        buscarNroMax := buscarNroMax(A^.hd)
      Else
        buscarNroMax := A^.data.nro;
    End;
End;

Procedure  datosNroMinimo (A:arbol);

Function socioNroMinimo (A:arbol): socio ;
Begin
  If (A<>Nil)Then
    Begin
      If (A^.hi <> Nil) Then
        socioNroMinimo := socioNroMinimo(A^.hi)
      Else
        socioNroMinimo := A^.data;
    End;
End;

Var 
  socMinimo: socio;
Begin
  socMinimo := socioNroMinimo(A);
  WriteLn('Datos del socio con numero menor: ');
  WriteLn('--> Numero: ',socMinimo.nro,' // Nombre: ',socMinimo.nombre,' // Edad: ',socMinimo.edad)
End;

Procedure cargarArbol(Var A:arbol);

Procedure leerSocio (Var S:socio);
Begin
  WriteLn('Ingrese numero de socio');
  readln(S.nro);
  If (S.nro<>0) Then
    Begin
      WriteLn('Ingrese nombre de socio');
      readln(S.nombre);
      WriteLn('Ingrese edad de socio');
      readln(S.edad);
    End;
End;

Procedure cargarSocio (Var A:arbol; S: socio);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := S;
      A^.hi := Nil;
      A^.hd := Nil;
    End
  Else
    Begin
      If (S.nro < A^.data.nro)Then
        cargarSocio(A^.hi,S)
      Else
        cargarSocio(A^.hd,S);
    End;
End;

Var 
  S: socio;
Begin
  leerSocio(S);
  While (S.nro<>0) Do
    Begin
      cargarSocio(A,S);
      leerSocio(S);
    End;
End;

Procedure aumentarEdad (A:arbol);
Begin
  If (A <> Nil) Then
    Begin
      aumentarEdad(A^.hd);
      A^.data.edad := A^.data.edad + 1;
      aumentarEdad(A^.hi);
    End
End;

// Function socioMayorEdad (A:arbol ; Var edadMax:Integer): Integer;

// Begin
//   If (A=Nil) Then
//     socioMayorEdad := -1
//   Else
//     Begin
//       If ( A^.data.edad > socioMayorEdad(A^.hd,edadMax) And ( A^.data.edad > socioMayorEdad(A^.hi,edadMax)) ) Then
//         Begin
//           edadMax := A^.data.edad;
//           socioMayorEdad := A^.data.nro;
//         End
//       Else
//         If (A^.data.edad < edadMax )Then
//           Begin
//             socioMayorEdad(A^.hd,edadMax);
//             socioMayorEdad(A^.hi,edadMax);
//           End;
//     End;
// End;

Function buscarSocio (A:arbol; valor: integer): Boolean;
Begin
  If (A=Nil)Then
    buscarSocio := false
  Else If (valor = A^.data.nro) Then
         buscarSocio := true
  Else
    Begin
      If (valor<A^.data.nro) Then
        buscarSocio := buscarSocio (A^.hi,valor)
      Else
        buscarSocio := buscarSocio (A^.hd,valor)
    End;
End;

Procedure busquedaPorNro(A:arbol);

Var 
  valor: integer;
Begin
  WriteLn('Ingrese numero de socio a buscar');
  ReadLn(valor);
  WriteLn(buscarSocio(A,valor));
End;

Procedure  busquedaPorNombre(A:arbol);

Function buscarNombre (A:arbol ; nombre:String): Boolean;
Begin
  If (A=Nil)Then
    buscarNombre := false
  Else
    Begin
      If (A^.data.nombre = nombre)Then
        Begin
          writeln(A^.data.nombre);
          buscarNombre := true;
        End
      Else
        Begin
          buscarNombre := buscarNombre (A^.hi,nombre) Or buscarNombre (A^.hd,nombre);
        End;
    End;
End;

Var 
  nombre: string;
Begin
  WriteLn('Ingrese nombre');
  Readln(nombre);
  WriteLn(buscarNombre(A,nombre));
End;

Function cantidadSocios(A:arbol): integer;
Begin
  If (A<>Nil)Then
    Begin
      cantidadSocios := cantidadSocios(A^.hi) +  cantidadSocios(A^.hd) + 1;
    End
  Else
    cantidadSocios := 0;
End;

Function edadTotal(A:arbol): real;
Begin
  If (A<>Nil)Then
    Begin
      edadTotal := A^.data.edad + edadTotal(A^.hi) + edadTotal(A^.hd);
    End
  Else
    edadTotal := 0;
End;

Procedure busquedaEnIntervalo (A:arbol);

Function cantSociosIntervalo (A:arbol; val1,val2: integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      If ((A^.data.nro >= val1) And (A^.data.nro <= val2)) Then
        Begin
          cantSociosIntervalo := cantSociosIntervalo(A^.hd,val1,val2) + cantSociosIntervalo(A^.hi,val1,val2) + 1;
        End
      Else If (A^.data.nro < val1) Then
             cantSociosIntervalo := cantSociosIntervalo (A^.hd,val1,val2)
      Else If (A^.data.nro > val2) Then
             cantSociosIntervalo := cantSociosIntervalo (A^.hi,val1,val2);
    End
  Else
    cantSociosIntervalo := 0;
End;


Var 
  val1, val2: integer;
Begin
  Writeln('Ingrese valores de busqueda');
  Writeln('Ingrese primer valor');
  read(val1);
  Writeln('Ingrese segundo valor');
  read(val2);
  WriteLn('La cantidad de socios entre ',val1,' y ',val2,' es: ',cantSociosIntervalo(A,val1,val2));
End;



Procedure impresionAscendente (A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      impresionAscendente(A^.hi);
      Writeln('-Num socio: ',A^.data.nro);
      impresionAscendente(A^.hd);
    End;
End;

Procedure impresionDescedente (A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      impresionDescedente(A^.hd);
      Writeln('-Num socio: ',A^.data.nro);
      impresionDescedente(A^.hi);
    End;
End;


Var 
  A: arbol;
  edadMax: Integer;
Begin
  A := Nil;
  edadMax := 0;
  cargarArbol(A);
  // writeln('El numero de socio maximo es: ',buscarNroMax(A));
  datosNroMinimo(A);
  aumentarEdad(A);
  busquedaPorNro(A);
  busquedaPorNombre(A);
  WriteLn('La cantidad de socios es: ',cantidadSocios(A));
  WriteLn('La edad promedio de los socios es: ',(edadTotal(A) / cantidadSocios(A)): 2: 1);
  busquedaEnIntervalo(A);
  impresionAscendente(A);
  WriteLn('----------------');
  impresionDescedente(A);
  WriteLn('----------------');
  writeln('El socio de mayor edad tiene el numero de socio: ',socioMayorEdad(A,edadMax));
End.
