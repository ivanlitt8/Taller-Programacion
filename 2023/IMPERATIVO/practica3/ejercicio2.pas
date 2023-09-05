// 2. Escribir un programa que:
// a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
// código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
// producto 0. Un producto puede estar en más de una venta. Se pide:

//     i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
//     producto.

//     ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
//     código de producto. Cada nodo del árbol debe contener el código de producto y la
//     cantidad total de unidades vendida.
//         Nota: El módulo debe retornar los dos árboles.

// b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
// la cantidad total de unidades vendidas de ese producto.

// c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
// la cantidad total de unidades vendidas de ese producto.

Program ejercicio2;

Type 

  venta = Record
    cod: integer;
    fecha: string;
    cant: integer;
  End;

  prod = Record
    cod: integer;
    cant: integer;
  End;

  arbolV = ^nodo1;
  nodo1 = Record
    data: venta;
    HI: arbolV;
    HD: arbolV;
  End;

  arbolP = ^nodo2;
  nodo2 = Record
    data: prod;
    HI: arbolP;
    HD: arbolP;
  End;

Procedure leerVenta (Var V: venta);
Begin
  write('Ingrese codigo de producto: ');
  ReadLn(V.cod);
  If (V.cod<>0) Then
    Begin
      write('Ingrese fecha de venta: ');
      ReadLn(V.fecha);
      write('Ingrese cantidad de venta: ');
      ReadLn(V.cant);
    End;
End;

Procedure agregarVenta(Var A: arbolV; V:venta);
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data := V;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (V.cod <= A^.data.cod) Then
         agregarVenta(A^.HI,V)
  Else
    agregarVenta(A^.HD,V)
End;

Procedure agregarProducto(Var A: arbolP; cod,cant: integer);
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data.cod := cod;
      A^.data.cant := cant;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (cod = A^.data.cod) Then
         A^.data.cant := A^.data.cant + cant
  Else If (cod < A^.data.cod) Then
         agregarProducto(A^.HI,cod,cant)
  Else
    agregarProducto(A^.HD,cod,cant)
End;

Procedure cargarArboles(Var AV:arbolV ; Var AP:arbolP);

Var 
  V: venta;
Begin
  leerVenta(V);
  While (V.cod<>0) Do
    Begin
      agregarVenta(AV,V);
      agregarProducto(AP,V.cod,V.cant);
      leerVenta(V);
    End;
End;

Procedure imprimirVentas(A:arbolV);
Begin
  If (A<>Nil)Then
    Begin
      imprimirVentas(A^.HI);
      WriteLn('***********************');
      WriteLn('Codigo de producto: ',A^.data.cod);
      WriteLn('Cantidad de unidades: ',A^.data.cant);
      WriteLn('Fecha de venta: ',A^.data.fecha);
      imprimirVentas(A^.HD);
    End;
End;

Procedure imprimirProductos(A:arbolP);
Begin
  If (A<>Nil)Then
    Begin
      imprimirProductos(A^.HI);
      WriteLn('***********************');
      WriteLn('Codigo de producto: ',A^.data.cod);
      WriteLn('Cantidad de unidades: ',A^.data.cant);
      imprimirProductos(A^.HD);
    End;
End;

Procedure busquedaEnArbolVentas(A: arbolV);

Function cantidadProd(A:arbolV; cod: integer): integer;
Begin
  If (A=Nil) Then
    cantidadProd := 0
  Else
    Begin
      If (A^.data.cod = cod) Then
        cantidadProd := A^.data.cant + cantidadProd(A^.HI, cod) + cantidadProd(A^.HD, cod)
      Else If (A^.data.cod > cod) Then
             cantidadProd := cantidadProd(A^.HI,cod)
      Else
        cantidadProd := cantidadProd(A^.HD,cod)
    End;
End;

Var 
  cod: integer;
Begin
  write('Ingrese codigo de producto a buscar en Arbol de Ventas: ');
  ReadLn(cod);
  Writeln('El codigo ',cod,' tiene ',cantidadProd(A,cod),' productos vendidos.')
End;

Procedure busquedaEnArbolProductos(A: arbolP);

Function cantidadProd(A:arbolP; cod: integer): integer;
Begin
  If (A=Nil) Then
    cantidadProd := 0
  Else If (A^.data.cod = cod) Then
         cantidadProd := A^.data.cant
  Else If (A^.data.cod > cod) Then
         cantidadProd := cantidadProd(A^.HI,cod)
  Else
    cantidadProd := cantidadProd(A^.HD,cod)
End;

Var 
  cod: integer;
Begin
  write('Ingrese codigo de producto a buscar en Arbol de Productos: ');
  ReadLn(cod);
  Writeln('El codigo ',cod,' tiene ',cantidadProd(A,cod),' productos vendidos.')
End;

Var 
  AV: arbolV;
  AP: arbolP;
Begin
  cargarArboles(AV,AP);
  //   imprimirVentas(AV); // No requeridos, modulos de supervicion de carga
  //   imprimirProductos(AP);
  busquedaEnArbolVentas(AV);
  busquedaEnArbolProductos(AP);
End.
