// Escribir un programa que:
// a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
//     código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el 
//     código de producto 0. Un producto puede estar en más de una venta. Se pide:

//         i. Generar y retornar un árbol binario de búsqueda de ventas ordenado
//             por código de producto.

//         ii. Generar y retornar otro árbol binario de búsqueda de productos 
//             vendidos ordenado por código de producto. Cada nodo del árbol 
//             debe contener el código de producto y la cantidad total vendida.
//                 Nota: El módulo debe retornar los dos árboles.

//         b. Implemente un módulo que reciba el árbol generado en i. y un código
//             de producto y retorne la cantidad total de unidades vendidas de
//             ese producto.

//         c. Implemente un módulo que reciba el árbol generado en ii. y un
//             código de producto y retorne la cantidad total de unidades 
//             vendidas de ese producto.

Program ejercicio2;

Const 

Type 

  venta1 = Record
    cod: Integer;
    fecha: Integer;
    cant: Integer;
  End;

  venta2 = Record
    cod: Integer;
    cant: Integer;
  End;

  arbol1 = ^nodo;
  nodo1 = Record
    data: venta;
    hi: arbol1;
    hd: arbol1;
  End;

  arbol2 = ^nodo;
  nodo2 = Record
    data: venta;
    hi: arbol2;
    hd: arbol2;
  End;

Procedure 