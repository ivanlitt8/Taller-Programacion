//  Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
// información de los autos en venta. Implementar un programa que:

// a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
// modelo) y los almacene en dos estructuras de datos:

// i. Una estructura eficiente para la búsqueda por patente.

// ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
// almacenar todos juntos los autos pertenecientes a ella.

// b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
// cantidad de autos de dicha marca que posee la agencia.

// c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
// la cantidad de autos de dicha marca que posee la agencia.

// d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
// la información de los autos agrupados por año de fabricación.

// e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
// modelo del auto con dicha patente.

// f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
// modelo del auto con dicha patente.

Program ejercicio2;

Const 
  dimF = 2018;

Type 
  str10 = string[10];

  rango = 2010..dimF;

  auto = Record
    pat: str10;
    anio: rango;
    marca: str10;
    modelo: str10;
  End;

  arbolP = ^nodo1;
  nodo1 = Record
    data: auto;
    HI: arbolP;
    HD: arbolP;
  End;

  lista = ^nodo2;
  nodo2 = Record
    data: auto;
    sig: lista;
  End;

  arbolM = ^nodo3;
  nodo3 = Record
    data: lista;
    HI: arbolM;
    HD: arbolM;
  End;

  vectorAnios = array [rango] Of lista;

Procedure inicializarVect (Var V:vectorAnios);

Var 
  i: rango;
Begin
  For i:= 2010 To dimF Do
    V[i] := Nil;
End;

Procedure leerAuto(Var Au: auto);

Begin
  Write('Ingrese patente: ');
  ReadLn(Au.pat);
  If (Au.pat <> '0') Then
    Begin
      Write('Ingrese anio: ');
      ReadLn(Au.anio);
      Write('Ingrese marca: ');
      ReadLn(Au.marca);
      Write('Ingrese modelo: ');
      ReadLn(Au.modelo);
      WriteLn('  ++ AUTO LEIDO ++  ');
    End;
End;

Procedure cargarEnArbolPat(Var A:arbolP ; Au: auto);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := Au;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else
    Begin
      If (Au.pat <= A^.data.pat) Then
        cargarEnArbolPat(A^.HI, Au)
      Else
        cargarEnArbolPat(A^.HD, Au);
    End;
End;

Procedure agregarALista(Var L: lista; Au: auto);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := Au;
  nue^.sig := L;
  L := nue;
End;

Procedure cargarEnArbolMarca(Var A:arbolM; Au: auto);

Begin
  If (A = Nil)Then
    Begin
      new(A);
      A^.data := Nil;
      A^.HI := Nil;
      A^.HD := Nil;
      agregarALista(A^.data,Au);
    End
  Else
    Begin
      If (Au.marca = A^.data^.data.marca) Then
        agregarALista(A^.data,Au)
      Else If (Au.marca < A^.data^.data.marca) Then
             cargarEnArbolMarca(A^.HI, Au)
      Else
        cargarEnArbolMarca(A^.HD, Au);
    End;
End;

Procedure cargarEstructuras(Var AP: arbolP ; Var AM: arbolM);

Var 
  Au: auto;
Begin
  leerAuto(Au);
  While (Au.pat <> '0') Do
    Begin
      cargarEnArbolPat(AP,Au);
      cargarEnArbolMarca(AM,Au);
      leerAuto(Au);
    End;
End;

Procedure imprimirArbolPatentes(A: arbolP);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbolPatentes(A^.HI);
      WriteLn('Patente: ',A^.data.pat);
      WriteLn('Anio Fabricacion: ',A^.data.anio);
      WriteLn('Marca: ',A^.data.marca);
      WriteLn('Modelo: ',A^.data.modelo);
      WriteLn('---------------');
      imprimirArbolPatentes(A^.HD);
    End;
End;

Procedure imprimirLista(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      WriteLn('Patente: ',L^.data.pat);
      WriteLn('Anio Fabricacion: ',L^.data.anio);
      WriteLn('Marca: ',L^.data.marca);
      WriteLn('Modelo: ',L^.data.modelo);
      WriteLn('---------------');
      L := L^.sig;
    End;
End;

Procedure imprimirArbolMarcas(A: arbolM);
Begin
  If (A<>Nil)Then
    Begin
      imprimirArbolMarcas(A^.HI);
      imprimirLista(A^.data);
      imprimirArbolMarcas(A^.HD);
    End;
End;

Function cantidadMarca(A:arbolP; marca: String): integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.marca = marca) Then
        cantidadMarca := cantidadMarca(A^.HI,marca) + cantidadMarca(A^.HD,marca) + 1
      Else
        cantidadMarca := cantidadMarca(A^.HI,marca) + cantidadMarca(A^.HD,marca);
    End
  Else
    cantidadMarca := 0;
End;

Procedure cantidadDeAutosMarca(A: arbolP);

Var 
  marca: string;
Begin
  write('Ingrese marca a contar: ');
  readln(marca);
  writeln('La cantidad de autos de esta marca es: ',cantidadMarca(A,marca));
End;

Function contarLista(L:lista): integer;
Begin
  If (L<>Nil)Then
    contarLista := contarLista(L^.sig) + 1
  Else
    contarLista := 0;
End;

Function cantidadMarca2(A: arbolM; marca: String): integer;
Begin
  If (A <> Nil) Then
    Begin
      If (A^.data^.data.marca <> marca) Then
        Begin
          If (A^.data^.data.marca < marca) Then
            cantidadMarca2 := cantidadMarca2(A^.HD, marca)
          Else If (A^.data^.data.marca > marca) Then
                 cantidadMarca2 := cantidadMarca2(a^.HI, marca);
        End
      Else
        cantidadMarca2 := contarLista(A^.data);
    End
  Else
    cantidadMarca2 := 0;
End;

Procedure cantidadDeAutosMarca2(A: arbolM);

Var 
  marca: string;
Begin
  write('Ingrese marca a contar: ');
  readln(marca);
  writeln('La cantidad de autos de esta marca es: ',cantidadMarca2(A,marca));
End;

Procedure cargarVectorAnios(A: arbolP; Var V: vectorAnios);
Begin
  If (A<>Nil)Then
    Begin
      cargarVectorAnios(A^.HI,V);
      agregarALista(V[A^.data.anio],A^.data);
      cargarVectorAnios(A^.HD,V);
    End
End;

Procedure imprimirVector (V:vectorAnios);

Var 
  i: rango;
Begin
  For i:=2010 To dimF Do
    If (V[i] <> Nil) Then
      Begin
        WriteLn('////////////////');
        WriteLn('Autos de anio: ',i);
        WriteLn('////////////////');
        imprimirLista(V[i]);
      End;
End;

Function buscarModelo(A:arbolP; pat: String): string;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.pat<>pat)Then
        Begin
          If (A^.data.pat<pat) Then
            buscarModelo := buscarModelo(A^.HD,pat)
          Else If (A^.data.pat>pat) Then
                 buscarModelo := buscarModelo(A^.HI,pat);
        End
      Else
        buscarModelo := A^.data.modelo;
    End
  Else
    buscarModelo := 'NO EXISTE MODELO CON ESA PATENTE';
End;

Procedure buscarPatente(A:arbolP);

Var 
  pat: str10;
Begin
  WriteLn('Ingrese patente de modelo a buscar: ');
  ReadLn(pat);
  WriteLn('El modelo del auto con esa patente es: ',buscarModelo(A,pat));
End;

// Function buscarEnLista(L:lista; pat,modelo: String): boolean;

// Var 
//   encontre: Boolean;
// Begin
//   encontre := false;
//   While (L<>Nil) Do
//     Begin
//       If (L^.data.pat = pat) Then
//         encontre := true;
//       L := L^.sig;
//     End;
//   buscarEnLista := encontre;
// End;

// Procedure buscarModelo2 (A:arbolM; pat:String; Var modelo: String);

// Var 
//   aux: boolean;
// Begin
//   If (A<>Nil) Then
//     Begin
//       aux := encontrar(a,num);
//       If (aux = true) Then
//         buscarEnLista (a,num,modelo)
//       Else
//         Begin
//           buscarModelo2(a^.hi,pat,modelo);
//           buscarModelo2(a^.hd,pat, modelo);
//         End;
//     End;
// End;

// Procedure buscarPatente2(A:arbolM);

// Var 
//   pat,modelo: str10;
// Begin
//   modelo := 'NO EXISTE MODELO CON ESA PATENTE';
//   WriteLn('Ingrese patente de modelo a buscar: ');
//   ReadLn(pat);
//   buscarModelo2(A,pat,modelo);
//   WriteLn('El modelo del auto con esa patente es: ',modelo);
// End;

Var 
  V: vectorAnios;
  AP: arbolP;
  AM: arbolM;
Begin
  AP := Nil;
  AM := Nil;
  inicializarVect(V);
  cargarEstructuras(AP,AM);
  //   WriteLn(' *** Arbol Patentes *** ');
  //   imprimirArbolPatentes(AP);
  WriteLn(' *** Arbol Marcas *** ');
  imprimirArbolMarcas(AM);
  //   cantidadDeAutosMarca(AP);
  //   cantidadDeAutosMarca2(AM);
  //   cargarVectorAnios(AP,V);
  //   imprimirVector(V);
  //   buscarPatente(AP);
  //   buscarPatente2(AM);    ESTE MODULO FALTA PUNTO F
End.

// Function recorrerLista (l:lista;num:integer): string;
// Begin
//   If ( l <> Nil ) Then
//     Begin
//       If (l^.data.patente = num) Then
//         recorrerLista := l^.data.modelo
//       Else
//         recorrerLista := recorrerLista (l^.sig,num);
//     End;
// End;

// Function encontrar (l:lista;num:integer): boolean;
// Begin
//   If ( l <> Nil ) Then
//     Begin
//       If (l^.data.patente = num) Then
//         encontrar := true
//       Else
//         encontrar := encontrar (l^.sig,num);
//     End
//   Else
//     encontrar := false;
// End;

// Procedure devolverModelo (am:arbolM; Var modelo:str; num:integer);

// Var 
//   aux: boolean;
// Begin
//   If (am <> Nil) Then
//     Begin
//       aux := encontrar(am^.data,num);
//       If (aux = true) Then
//         modelo := recorrerLista(am^.data,num)````
//       Else
//         Begin
//           devolverModelo (am^.hi,modelo,num);
//           devolverModelo(am^.hd,modelo,num);
//         End;
//     End;
// End;
