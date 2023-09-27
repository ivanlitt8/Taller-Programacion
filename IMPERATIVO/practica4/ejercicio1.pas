// a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
// código de producto. De cada producto deben quedar almacenados la cantidad total de
// unidades vendidas y el monto total. De cada venta se lee código de venta, código del
// producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
// ventas finaliza cuando se lee el código de venta -1.

// b. Imprima el contenido del árbol ordenado por código de producto.

// c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
// código de producto con mayor cantidad de unidades vendidas.

// d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
// producto y retorne la cantidad de códigos menores que él que hay en la estructura.

// e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
// producto y retorne el monto total entre todos los códigos de productos comprendidos
// entre los dos valores recibidos (sin incluir).

Program ejercicio1;

Type 
  venta = Record
    codV: integer;
    codP: integer;
    cant: integer;
    precio: real;
  End;

  producto = Record
    cod: integer;
    cant: integer;
    montoTot: real;
  End;

  arbol = ^nodo;
  nodo = Record
    data: producto;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerVenta(Var V: venta);
Begin
  Write('Codigo de Venta: ');
  readln(V.codV);
  If (V.codV <> -1 ) Then
    Begin
      Write('Codigo de Producto: ');
      readln(V.codP);
      Write('Cantidad de Unidades: ');
      readln(V.cant);
      Write('Precio Unitario: ');
      readln(V.precio);
      WriteLn('  +++++ PRODUCTO CARGADO +++++  ');
    End;
End;

Procedure agregarProducto(Var A: arbol ; V: venta);
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data.cod := V.codP;
      A^.data.cant := V.cant;
      A^.data.montoTot := (V.cant * V.precio);
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (V.codP = A^.data.cod) Then
         Begin
           A^.data.cant := A^.data.cant + V.cant;
           A^.data.montoTot := A^.data.montoTot + (V.cant * V.precio);
         End
  Else If (V.codP < A^.data.cod) Then
         agregarProducto(A^.HI,V)
  Else
    agregarProducto(A^.HD,V);
End;

Procedure cargarArbol (Var A:arbol);

Var 
  V: venta;
Begin
  leerVenta(V);
  While (V.codV<>-1) Do
    Begin
      agregarProducto(A,V);
      leerVenta(V);
    End;
End;

Procedure imprimirProductos(A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirProductos(A^.HI);
      WriteLn('Producto codigo: ',A^.data.cod);
      WriteLn('Cantidad de unidades: ',A^.data.cant);
      WriteLn('Monto total: ',A^.data.montoTot:4:2);
      WriteLn('****************');
      imprimirProductos(A^.HD);
    End;
End;

Procedure codigoMaxProductos(A: arbol);

Procedure buscarMaximo(A: arbol; Var max: integer; Var codMax: integer);
Begin
  If (A<>Nil)Then
    Begin
      If (A^.data.cant>max)Then
        Begin
          max := A^.data.cant;
          codMax := A^.data.cod;
        End;
      buscarMaximo(A^.HI,max,codMax);
      buscarMaximo(A^.HD,max,codMax);
    End;
End;

Var 
  max,codMax: integer;
Begin
  max := -1;
  codMax := -1;
  buscarMaximo(A,max,codMax);
  WriteLn('El codigo de producto con mayor cantidad de unidades vendidas es: ',codMax);
End;

Procedure cantCodigosMenores(A: arbol);
Function contarMenoresACod(A: arbol; cod: integer): integer;
Begin
  If (A <> Nil) Then
    Begin
      If (A^.data.cod < cod) Then
        contarMenoresACod := contarMenoresACod(A^.HI,cod) + contarMenoresACod(A^.HD,cod) + 1
      Else If (A^.data.cod >= cod) Then
             contarMenoresACod := contarMenoresACod(A^.HI,cod);
    End
  Else
    contarMenoresACod := 0;
End;

Var 
  cant,cod: integer;
Begin
  cant := 0;
  Write('Ingrese codigo de producto: ');
  ReadLn(cod);
  WriteLn('La cantidad de codigos menores que el ingresado es: ',contarMenoresACod(A,cod));
End;

Function calcularMonto (A:arbol; cod1,cod2:integer): Real;
Begin
  If (A <> Nil ) Then
    Begin
      If (A^.data.cod > cod1) Then
        Begin
          If (A^.data.cod < cod2) Then
            calcularMonto := calcularMonto(A^.HD,cod1,cod2) + calcularMonto(A^.HI,cod1,cod2) + A^.data.montoTot
          Else
            calcularMonto := calcularMonto (A^.HI,cod1,cod2);
        End
      Else
        calcularMonto := calcularMonto (A^.HD,cod1,cod2)
    End
  Else
    calcularMonto := 0;
End;

Procedure montoTotal(A: arbol);

Var 
  aux,cod1,cod2: integer;
Begin
  Write('Ingrese codigo 1: ');
  ReadLn(cod1);
  Write('Ingrese codigo 2: ');
  ReadLn(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod1;
      cod1 := cod2;
      cod2 := aux;
    End;
  Write('El monto total entre estos dos codigos es: ',calcularMonto(A,cod1,cod2): 4: 2);
End;

Var 
  A: arbol;
Begin
  cargarArbol(A);
  imprimirProductos(A);
  // codigoMaxProductos(A);
  cantCodigosMenores(A);
  // montoTotal(A);
End.
