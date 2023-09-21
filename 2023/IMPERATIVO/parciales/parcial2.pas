// 1. En un colegio secundario, cada alumno participa de un proyecto de ciencias. El proyecto de
// un alumno pertenece a un tópico (volcanes, vida marina, migración de las aves, etc.). Un
// mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos). En la
// última hora del evento las personas visitantes pueden votar el proyecto del alumno que más
// le gustó.
// a. Realice un programa para el sistema de votación. Un voto consiste en el nombre del
// alumno y el tópico en el cual pertenece el proyecto.
// b. Almacene esta información en una estructura óptima para la búsqueda, ordenada
// por nombre de alumno. Para cada alumno almacene todos sus proyectos ordenado
// por tópico.
// c. Al finalizar la carga (se lee el alumno ‘zzz’) se debe informar:
// i. Cual fue el proyecto ganador: nombre del alumno, tópico y cantidad de
// votos.
// ii. Número de votos totales, es decir la suma de los votos de todos los
// proyectos en los que participa un alumno, ordenados alfabéticamente por
// nombre de alumno.


Program parcial2;

Type 

  voto = Record
    nombre: string;
    topico: string;
  End;

  lista = ^nodo1;
  nodo1 = Record
    data: voto;
    sig: lista;
  End;

  alumno = Record
    votos: lista;
    nombre: string;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data: alumno;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerVoto(Var V: voto);
Begin
  write('Ingrese nombre de alumno: ');
  ReadLn(V.nombre);
  If (V.nombre<>'ZZZ')Then
    Begin
      write('Ingrese topico proyecto: ');
      ReadLn(V.topico);
      writeln('  ++ VOTO LEIDO ++  ');
    End;
End;

Procedure agregarAlista(Var L: lista; V:voto);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := V;
  act := L;
  ant := L;
  While (act<>Nil) And (V.topico < act^.data.topico ) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then
    L := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Procedure agregarVoto(Var A:arbol; V: voto);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data.votos := Nil;
      A^.data.nombre := V.nombre;
      agregarAlista(A^.data.votos,V);
    End
  Else
    Begin
      If (A^.data.nombre = V.nombre) Then
        agregarAlista(A^.data.votos,V)
      Else If (A^.data.nombre < V.nombre) Then
             agregarVoto(A^.HD,V)
      Else
        agregarVoto(A^.HI,V);
    End;
End;

Procedure cargarArbol(Var A:arbol);

Var 
  V: voto;
Begin
  leerVoto(V);
  While (V.nombre<>'ZZZ') Do
    Begin
      agregarVoto(A,V);
      leerVoto(V);
    End;
End;

Procedure imprimirListaVotos(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      writeLn('Nombre de alumno: ',L^.data.nombre);
      writeLn('Topico proyecto: ',L^.data.topico);
      writeln(' --------------- ');
      L := L^.sig;
    End;
End;

Procedure imprimirArbol(A:arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      imprimirListaVotos(A^.data.votos);
      imprimirArbol(A^.HD);
    End;
End;

Function contarVotos(L:lista): integer;
Begin
  If (L<>Nil)Then
    contarVotos := contarVotos(L^.sig) + 1
  Else
    contarVotos := 0;
End;

Procedure votosPorAlumno(A:arbol);
Begin
  If (A<>Nil) Then
    Begin
      votosPorAlumno(A^.HI);
      WriteLn('El total de votos para el alumno ', A^.data.nombre,'es: ',contarVotos(A^.data.votos));
      votosPorAlumno(A^.HD);
    End;
End;

Procedure buscarMaxProyecto(L:lista; Var proyecto: String; Var maxV: integer);

Var 
  temaAct: string;
  contadorVotos,max: integer;
Begin
  max := 0;
  While (L<>Nil) Do
    Begin
      temaAct := L^.data.topico;
      contadorVotos := 0;
      While (L<>Nil)And(temaAct = L^.data.topico) Do
        Begin
          contadorVotos := contadorVotos + 1;
          L := L^.sig;
        End;
      If (contadorVotos>max) Then
        Begin
          maxV := contadorVotos;
          proyecto := temaAct;
        End;
    End;
End;

Procedure verificarGanadores(nombre,proyecto:String; Var votosGan: integer ; Var temaGan:String; Var nombreGan: String;
                             maxV: integer);
Begin
  If (maxV>votosGan)Then
    Begin
      votosGan := maxV;
      temaGan := proyecto;
      nombreGan := nombre;
    End;
End;

Procedure proyectoGanador(A:arbol;Var nombreGan,temaGan: String; Var votosGan: integer );

Var 
  proyecto: string;
  maxV: integer;
Begin
  If (A<>Nil) Then
    Begin
      proyectoGanador(A^.HI,nombreGan,temaGan,votosGan);
      buscarMaxProyecto(A^.data.votos,proyecto,maxV);
      verificarGanadores(A^.data.nombre,proyecto,votosGan,temaGan,nombreGan,maxV);
      proyectoGanador(A^.HD,nombreGan,temaGan,votosGan);
    End;
End;

Var 
  A: arbol;
  topic,alum: string;
  votos: integer;
Begin
  A := Nil;
  votos := 0;
  cargarArbol(A);
  imprimirArbol(A);
  proyectoGanador(A,alum,topic,votos);
  WriteLn('El proyecto ganador fue del alumno ',alum,' con topico ',topic,' y ',votos,' votos');
  votosPorAlumno(A);
End.
