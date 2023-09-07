Function verificarCantidad(L: listaFinales; cant: integer): boolean;

Var 
  cont: integer;
Begin
  cont := 0;
  While (L<>Nil) Do
    Begin
      cont := cont + 1;
      L := L^.sig;
    End;
  verificarCantidad := (cont = cant);
End;

Function contarCantidad(A:arbol; cod1,cod2,num: integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.codA >= cod1) Then
        Begin
          If (A^.data.codA <= cod2) Then
            If (verificarCantidad(A^.data.finales,num)) Then
              contarCantidad := contarCantidad(A^.HD,cod1,cod2,num) + contarCantidad(A^.HI,cod1,cod2,num) + 1
          Else
            contarCantidad := contarCantidad (A^.HI,cod1,cod2,num);
        End
      Else
        contarCantidad := contarCantidad (A^.HD,cod1,cod2,num)
    End
  Else
    contarCantidad := 0;
End;

Procedure contarEntreCodigos(A:arbol);

Var 
  aux,cant,cod1,cod2,num: integer;
Begin
  cant := 0;
  Write('Ingrese codigo uno: ');
  ReadLn(cod1);
  Write('Ingrese codigo dos: ');
  ReadLn(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod2;
      cod2 := cod1;
      cod1 := aux;
    End;
  Write('Ingrese numero de finales: ');
  ReadLn(num);
  WriteLn('Hay ',contarCantidad(A,cod1,cod2,num),
  ' alumnos con ',num,' finales aprobados entre los codigos ingresados.');
End;

Var 
  A: arbol;
  V: vectorFinales;
Begin
  inicializVectFinales(V);
  cargarEstructuras(A,V);
  imprimirArbol(A);
  //   imprimirVector(V);
  //   imprimirCodSuperiores(A);
  contarEntreCodigos(A);
End.