
Program ejercicio3;

Const 
  max = 1000;

Type 
  rango = 1..max;

  tabla = Record
    precio : real;
    stock: integer;
  End;

  vector = array [rango] Of tabla;

  detalle = Record
    // Registro detalle
    codP: integer;
    cant: integer;
    precioU: real;
  End;

  listaDetalle = ^nodo;
  // Lista de Registros
  nodo = Record
    data: detalle;
    sig: listaDetalle;
  End;

  ticket = Record
    // Ticket de la venta
    codV: integer;
    descripcionVenta: listaDetalle;
    // Lista de detalles de ventas
    montoTotal: real;
  End;

  listaTickets = ^nodo2;
  nodo2 = Record
    data: ticket;
    sig: listaTickets;
  End;

Procedure tablaStock(Var V:vector);

Var 
  i: rango;
Begin
  Randomize();
  For i:= 1 To max Do
    Begin;
      v[i].precio := i * 10;
      v[i].stock := 100 + random(100);
    End;
End;

Procedure leerProducto( Var P: detalle ; Var precio: real ; V:vector);
Begin
  write('Ingrese codigo de producto ');
  ReadLn(P.codP);
  write('Ingrese cantidad de unidades ');
  ReadLn(P.cant);
  If (P.cant<>0) Then
    Begin
      P.precioU := V[P.codP].precio;
      precio := (P.precioU*P.cant);
    End;
End;

Procedure agregarAListaDetalle(Var L:listaDetalle; P:detalle);

Var 
  nue: listaDetalle;
Begin
  new(nue);
  nue^.data := P;
  nue^.sig := L;
  L := nue;
End;

Procedure cargarProductos(Var L:listaDetalle; P:detalle; Var V:vector);
Begin
  If (V[P.codP].stock<>0) Then
    Begin
      If (P.cant<=V[P.codP].stock)Then
        Begin
          V[P.codP].stock := V[P.codP].stock - P.cant;
          agregarAListaDetalle(L,P)
        End
      Else If (P.cant>V[P.codP].stock) Then
             Begin
               P.cant := V[P.codP].stock;
               V[P.codP].stock := 0;
               agregarAListaDetalle(L,P)
             End;
    End
  Else
    WriteLn('No hay stock de este producto');
End;

Procedure agregarAListaTicket(Var LT:listaTickets ; T:ticket);

Var 
  nue: listaTickets;
Begin
  new(nue);
  nue^.data := T;
  nue^.sig := LT;
  LT := nue;
End;

Procedure cargarTicket(Var LT: listaDetalle; L: listaDetalle);

Var 
  nue: listaDetalle;
Begin
  new(nue);
  nue := L;
  nue^.sig := Nil;
  If (LT = Nil) Then
    LT := nue
  Else
    LT^.sig := nue;
End;

Procedure leerVentas (Var LT: listaTickets; V:vector);

Var 
  L: listaDetalle;
  T: ticket;
  total,precio: real;
  P: detalle;
Begin
  Write('Ingrese codigo de venta ');
  ReadLn(T.codV);
  While (T.codV<>-1) Do
    Begin
      T.descripcionVenta := Nil;
      leerProducto(P,precio,V);
      total := 0;
      While (P.cant<>0) Do
        Begin
          total := total + precio;
          cargarProductos(T.descripcionVenta,P,V);
          leerProducto(P,precio,V);
        End;
      T.montoTotal := total;
      agregarAListaTicket(LT,T);
      Write('Ingrese codigo de venta ');
      ReadLn(T.codV);
    End;
End;

Procedure imprimirTickets(LT:listaTickets);

Var 
  aux: listaTickets;
Begin
  aux := LT;
  While (aux<>Nil) Do
    Begin
      WriteLn('Codigo de venta: ',aux^.data.codV);
      WriteLn('Monto total de la venta: ',aux^.data.montoTotal:4:2);
      aux := aux^.sig;
    End;
End;

Procedure unidadesVendidas (codBuscar:integer; LT:listaTickets);

Var 
  cont: integer;
  aux: listaDetalle;
Begin
  cont := 0;
  While (LT<>Nil) Do
    Begin
      aux := LT^.data.descripcionVenta;
      While (aux<>Nil) Do
        Begin
          If (aux^.data.codP = codBuscar) Then
            Begin
              cont := cont + aux^.data.cant;
            End;
          aux := aux^.sig;
        End;
      LT := LT^.sig;
    End;
  WriteLn('Hay ',cont,' unidades vendidas para el producto con codigo: ',codBuscar);
End;

Var 
  LT: listaTickets;
  V: vector;
  codBuscar: integer;
Begin
  LT := Nil;
  tablaStock(V);
  leerVentas(LT,V);
  imprimirTickets(LT);
  Write('Ingrese codigo de producto a buscar: ');
  ReadLn(codBuscar);
  unidadesVendidas(codBuscar,LT);
End.
