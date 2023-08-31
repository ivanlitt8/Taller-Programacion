// 1. Escribir un programa que:
// a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
// binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
// con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
// b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
// parámetro y que :
// i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
// retorne dicho valor.
// ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
// recursivo que retorne dicho socio.
// iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
// retorne dicho valor.
// iv. Aumente en 1 la edad de todos los socios.
// v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
// un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
// vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
// un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
// vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
// cantidad.
// viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
// vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
// ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
// número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
// recursivo que reciba los dos valores leídos y retorne dicha cantidad.
// x. Informe los números de socio en orden creciente.
// xi. Informe los números de socio pares en orden decreciente.

Program ejercicio1;

Type 
  socio = Record
    num: integer;
    nombre: string;
    edad: integer;
  End;

  arbol = ^nodo;
  nodo = Record
    data: socio;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerSocio (Var S: socio);
Begin
  Write('Ingrese numero de socio: ');
  ReadLn(S.num);
  If (S.num<>0) Then
    Begin
      // Write('Ingrese nombre de socio: ');
      // ReadLn(S.nombre);
      Write('Ingrese edad de socio: ');
      ReadLn(S.edad);
    End;
End;

Procedure agregarAlArbol(Var A: arbol ; S: socio );
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data := S;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else
    If (S.num <= A^.data.num) Then
      agregarAlArbol(A^.HI,S)
  Else
    agregarAlArbol (A^.HD,S)
End;

Procedure cargarArbol(Var A: arbol);

Var 
  S: socio;
Begin
  leerSocio(S);
  While (S.num<>0) Do
    Begin
      agregarAlArbol(A,S);
      leerSocio(S);
    End;
End;

Procedure imprimirArbol(A: arbol);
Begin
  If (A<>Nil)Then
    Begin
      imprimirArbol(A^.HI);
      writeln(A^.data.edad);
      imprimirArbol(A^.HD);
    End;
End;

Procedure numeroDeSocioMayor(A: arbol);

Function numeroSocioMayor(A: arbol): integer;
Begin
  If (A^.HD <>Nil) Then
    numeroSocioMayor := numeroSocioMayor(A^.HD)
  Else
    numeroSocioMayor := A^.data.num;
End;

Begin
  writeln('El numero de socio maximo es: ',numeroSocioMayor(A));
End;

Procedure numeroDeSocioMenor(A: arbol);

Function numeroSocioMenor(A: arbol): integer;
Begin
  If (A^.HI <>Nil) Then
    numeroSocioMenor := numeroSocioMenor(A^.HI)
  Else
    numeroSocioMenor := A^.data.num;
End;

Begin
  writeln('El numero de socio minimo es: ',numeroSocioMenor(A));
End;

Procedure socioMayorEdad(A: arbol; Var edadMax: integer; Var numSocio: integer);
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.edad>edadMax) Then
        Begin
          edadMax := A^.data.edad;
          numSocio := A^.data.num;
        End;
      socioMayorEdad(A^.HI,edadMax,numSocio);
      socioMayorEdad(A^.HD,edadMax,numSocio);
    End;
End;


Procedure aumentarEdadSocios(Var A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      A^.data.edad := A^.data.edad + 1;
      aumentarEdadSocios(A^.HI);
      aumentarEdadSocios(A^.HD);
    End;
End;

Procedure buscarSocioPorNumero(A:arbol);

Function buscar(A:arbol; valor: integer): boolean;

Begin
  If (A=Nil) Then
    buscar := false
  Else If (valor = A^.data.num) Then
         buscar := true
  Else
    Begin
      If (valor<A^.data.num) Then
        buscar := buscar (A^.hi,valor)
      Else
        buscar := buscar (A^.hd,valor)
    End;
End;

Var 
  valor: integer;
Begin
  Write('Ingrese numero de socio a buscar ');
  ReadLn(valor);
  WriteLn(buscar(A,valor));
End;

Var 
  A: arbol;
  numSocio,edadMax: integer;
Begin
  A := Nil;
  edadMax := 0;
  cargarArbol(A);
  //   numeroDeSocioMayor(A);
  //   numeroDeSocioMenor(A);
  //   socioMayorEdad(A,edadMax,numSocio);
  //   writeln('El numero de socio ',numSocio,' es el que tiene la mayor edad con ',edadMax,' anios');
  aumentarEdadSocios(A);
  imprimirArbol(A);
  buscarSocioPorNumero(A);
End.

// v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
// un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
// vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
// un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
// vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
// cantidad.
