// Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
// información de los autos en venta.
// Implementar un programa que:

// 1. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta.
//     Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el 
//     modelo.
// 2. Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de
//     autos de dicha marca que posee la agencia. Mostrar el resultado.
// 3. Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la
//     información de los autos agrupados por año de fabricación.
// 4. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de
//     fabricación del auto con dicha patente. Mostrar el resultado.


Program ejercicio2;

Type 
  rango = 2010..2018;

  auto = Record
    pat: string;
    fab: rango;
    marca: string;
    modelo: string;
  End;

  arbol = ^nodoA;
  nodoA = Record
    data: auto;
    hi: arbol;
    hd: arbol;
  End;

  listaMerge = ^nodoM;
  nodoM = Record
    data: auto;
    sig: listaMerge;
  End;

Procedure cargarArbol(Var A:arbol);

Procedure leerAuto (Var A:auto);
Begin
  writeLn('Ingrese Patente de Auto: ');
  Readln(A.pat);
  If (A.pat<>'0') Then
    Begin
      WriteLn('Ingrese Anio de Fabricacion: ');
      Readln(A.fab);
      WriteLn('Ingrese Marca de Auto: ');
      Readln(A.marca);
      WriteLn('Ingrese Modelo de Auto: ');
      ReadLn(A.modelo);
    End;
End;

Procedure cargarAuto ( Var A:arbol; Au:auto);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := Au;
      A^.hi := Nil;
      A^.hd := Nil;
    End
  Else
    Begin
      If (Au.pat<A^.data.pat) Then
        cargarAuto(A^.hi,Au)
      Else
        cargarAuto(A^.hd,Au);
    End;
End;


Var 
  Au: auto;
Begin
  A := Nil;
  leerAuto(Au);
  While (Au.pat<>'0') Do
    Begin
      cargarAuto(A,Au);
      leerAuto(Au);
    End;
End;

Procedure contarMarca(A:arbol);

Function buscarMarca(A:arbol; marca:String): integer;
Begin
  If (A<>Nil)Then
    Begin
      If (A^.data.marca = marca) Then
        buscarMarca := buscarMarca(A^.hi,marca) + buscarMarca(A^.hd,marca) + 1
      Else
        buscarMarca := buscarMarca(A^.hi,marca) + buscarMarca(A^.hd,marca);
    End
  Else
    buscarMarca := 0;
End;

Var 
  marca: string;
Begin
  Writeln('Ingrese Marca...');
  readln(marca);
  writeln(buscarMarca(A,marca));
End;

Procedure imprimirBusqueda(A:arbol);

Procedure buscarPatente(A:arbol ; patente:String);

Begin
  If (A<>Nil)Then
    Begin
      If (A^.data.pat = patente)Then
        Begin
          writeln('Patente: ',A^.data.pat,' - modelo: ',A^.data.modelo,' - marca: ',A^.data.marca,
                  ' - fabricacion: ',A^.
                  data.fab);
        End
      Else
        Begin
          buscarPatente(A^.hi,patente);
          buscarPatente(A^.hd,patente);
        End;
    End
End;


Var 
  patente: string;
Begin
  WriteLn('Ingrese patente');
  readln(patente);
  buscarPatente(A,patente);
End;

Procedure merge(A:arbol;Var L:listaMerge);

Procedure agregarAdelante(Var L:listaMerge; Au:auto);

Var 
  nue: listaMerge;
Begin
  new(nue);
  nue^.data := Au;
  nue^.sig := L;
  L := nue;
End;

Begin
  If (A<>Nil)Then
    Begin
      merge(A^.hi,L);
      agregarAdelante(L,A^.data);
      merge(A^.hd,L);
    End
End;

Procedure imprimirListaMerge(L:listaMerge);
Begin
  If (L<>Nil)Then
    Begin
      writeln('--------------');
      writeln('Patente: ',L^.data.pat,' - modelo: ',L^.data.modelo,' - marca: ',L^.data.marca,
              ' - fabricacion: ',L^.
              data.fab);
      writeln('--------------');
      imprimirListaMerge(L^.sig);
    End;
End;

Var 
  A: arbol;
  L: listaMerge;
Begin
  L := Nil;
  cargarArbol(A);
  contarMarca(A);
  imprimirBusqueda(A);
  merge(A,L);
  imprimirListaMerge(L);
End.
