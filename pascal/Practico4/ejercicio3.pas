// Implementar un programa que procese la información de las ventas de productos
// de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código
// del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas
// finaliza cuando se lee el código de sucursal 0. Implementar un programa que:

//     a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
//         en una estructura de datos adecuada.
//     b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
//         una estructura donde esté acumulada la cantidad total vendida para cada código
//         de producto.

Program ejercicio3;

Const 
  dimF = 4;

Type 
  rango = 1..dimF;
  venta = Record
    cod: integer;
    suc: rango;
    cant: integer;
  End;

  lista = ^nodo;

  nodo = Record
    data: venta;
    sig: lista;
  End;

  vectSuc = array[rango] Of lista;

Procedure leerVenta (Var X:venta);
Begin
  WriteLn('Ingrese Sucursal: ');
  ReadLn(X.suc);
  If (X.suc<>0)Then
    Begin
      WriteLn('Ingrese Codigo Producto: ');
      ReadLn(X.cod);
      WriteLn('Ingrese Cantidad: ');
      ReadLn(X.cant);
    End;
End;
Begin
End.
