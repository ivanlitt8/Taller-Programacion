// a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
// código de producto. De cada producto deben quedar almacenados la cantidad total de
// unidades vendidas y el monto total. De cada venta se lee código de venta, código del
// producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
// ventas finaliza cuando se lee el código de venta -1.

// b. Imprima el contenido del árbol ordenado por código de producto.}

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
  Write('Codigo de venta: ');
  readln(v.codV);
  If (v.codV <> -1 ) Then
    Begin
      v.codP := random (99) +1;
      v.cant := random (99) +1;
      v.precio := random (99) +1;
    End;
End;

Procedure agregarItem (Var a:arbol; v:venta);
Begin
  If (a = Nil) Then
    Begin
      a^.data := v;
      a^.HI := Nil;
      a^.hd := Nil;
    End
  Else If (a^.data.codV > v.codV) Then
         agregarItem()
End;
End;


Begin

End.
