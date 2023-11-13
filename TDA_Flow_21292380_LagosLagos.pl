
%------------------PERTENENCIA--------------------

%existeIdinIds/2
%Descripción: Regla que verifica la existencia de un Id en una
% lista de Ids.
%Dom: Id (Int) X Ids (List)
%Meta Primaria: existeIdinIds/2
%Meta Secundaria: member/2

existeIdinIds(Id, Ids) :-
    member(Id, Ids).

%------------------SELECTORES--------------------

%getIdFlow/2
%Descripción: Regla que extrae el Id de un flujo.
%Dom: Flow (List) X Id (Int)
%Meta Primaria: getIdFlow/2
%Meta Secundaria: No aplica
getIdFlow(Flow, Id) :-
    Flow = [Id|_].


%getIdsFlow/2
%Descripción: Regla recursiva que extrae el Id de cada flujo en
% una lista de flujos.
%Dom: Flows (List) X Ids (List)
%Meta Primaria: getIdsFlow/2
%Meta Secundaria: No aplica
getIdsFlow([], []). %Caso base

%Meta Secundaria: getIdFlow/2, getIdsFlow/2
getIdsFlow([Flow|Flows], [Id|Ids]) :- %Caso recursivo
    getIdFlow(Flow, Id),
    getIdsFlow(Flows, Ids).


%getNameMsgFlow/2
%Descripción: Regla que extrae el nombre de un flujo.
%Dom: Flow (List) X NameMsg (String)
%Meta Primaria: getNameMsgFlow/2
%Meta Secundaria: No aplica
getNameMsgFlow(Flow, NameMsg) :-
    Flow = [_, NameMsg|_].


%getOptionsFlow/2
%Descripción: Regla que extrae la lista de opciones de un flujo.
%Dom: Flow (List) X Options (List)
%Meta Primaria: getOptionsFlow/2
%Meta Secundaria: No aplica
getOptionsFlow(Flow, Options) :-
    Flow = [_,_, Options|_].

%-------------------MODIFICADORES--------------------

%agregarFlowFinal/3
%Descripción: Regla que agrega una opción al final de una lista de
% opciones.
%Dom: NewFlow (List) X Flows (List) X FlowsFinal (List)
%Meta Primaria: agregarFlowFinal/3
%Meta Secundaria: No aplica.
agregarFlowFinal(NewFlow, [], [NewFlow]). %Caso base

%Meta Secundaria: agregarFlowFinal/3
agregarFlowFinal(NewFlow, [Flow|Flows], [Flow|FlowsFinal]) :- %Caso recursivo
    agregarFlowFinal(NewFlow, Flows, FlowsFinal).


%agregarSinRepetirFlow/4
%Descripción: Regla recursiva que revisa que en una lista de
% flujos no existan repetidos.
%Dom: Flows (List) X Ids (List) X Acumulador (List) X FlowsFinal (List)
%Meta Primaria: agregarSinRepetirFlow/4
%Meta Secundaria: No aplica.
agregarSinRepetirFlow([], [], Acumulador, Acumulador). %Caso base

%Meta Secundaria: existeIdinIds/2, agregarFlowFinal/3, agregarSinRepetirFlow/4
agregarSinRepetirFlow([Flow|Flows], [Id|Ids], Acumulador, FlowsFinal) :- %Caso recursivo
    \+ existeIdinIds(Id, Ids),
    agregarFlowFinal(Flow, Acumulador, AcumuladorOut),
    agregarSinRepetirFlow(Flows, Ids, AcumuladorOut, FlowsFinal).


%agregarSinRepetirNewFlow/4
%Descripción: Regla que agrega un nuevo flujo a una lista, solo si no
% existe previamente.
%Dom: Flows (List) X Ids (List) X NewFlow (List) X FlowsFinal (List)
%Meta Primaria: agregarSinRepetirNewFlow/4
%Meta Secundaria: getIdFlow/2, existeIdinIds/2,
% agregarFlowFinal/3
agregarSinRepetirNewFlow(Flows, Ids, NewFlow, FlowsFinal) :-
    getIdFlow(NewFlow, NewId),
    \+ existeIdinIds(NewId, Ids),
    agregarFlowFinal(NewFlow, Flows, FlowsFinal).

%-------------------OTROS--------------------

%buscarFlowinFlows/4
%Descripción: Regla recursiva que busca un flujo en una lista de
% flujos a partir de su código.
%Dom: StartFlow (Int) X FlowIds (List) X Flows (List) X
% Flow (List)
%Meta Primaria: buscarFlowinFlows/4
%Meta Secundaria: No aplica.
buscarFlowinFlows(StartFlow, [StartFlow|_], [Flow|_], Flow). %Caso base

%Meta Secundaria: buscarFlowinFlows/4
buscarFlowinFlows(StartFlow, [_|FlowIds], [_|Flows], Flow) :- %Caso recursivo
    buscarFlowinFlows(StartFlow, FlowIds, Flows, Flow).
