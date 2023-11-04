
%------------------PERTENENCIA--------------------

existeIdinIds(Id,Ids) :-
    member(Id, Ids).

%------------------SELECTORES--------------------
getIdFlow(Flow, Id) :-
    Flow = [Id|_].


getIdsFlow([], []).

getIdsFlow([Flow|Flows], [Id|Ids]) :-
    getIdFlow(Flow, Id),
    getIdsFlow(Flows, Ids).


getNameMsgFlow(Flow, NameMsg) :-
    Flow = [_, NameMsg|_].

getOptionsFlow(Flow, Options) :-
    Flow = [_,_, Options|_].


agregarFlowFinal(NewFlow, [], [NewFlow]).

agregarFlowFinal(NewFlow, [Flow|Flows], [Flow|FlowsFinal]) :-
    agregarFlowFinal(NewFlow, Flows, FlowsFinal).


agregarSinRepetirFlow([], [], Acumulador, Acumulador).

agregarSinRepetirFlow([_|Flows], [Id|Ids], Acumulador, FlowsFinal) :-
    existeIdinIds(Id, Ids),
    agregarSinRepetirFlow(Flows, Ids, Acumulador, FlowsFinal).

agregarSinRepetirFlow([Flow|Flows], [Id|Ids], Acumulador, FlowsFinal) :-
    \+ existeIdinIds(Id, Ids),
    agregarFlowFinal(Flow, Acumulador, AcumuladorOut),
    agregarSinRepetirFlow(Flows, Ids, AcumuladorOut, FlowsFinal).


agregarSinRepetirNewFlow(Flows, Ids, NewFlow, FlowsFinal) :-
    getIdFlow(NewFlow, NewId),
    \+ existeCodeinCodes(NewId, Ids),
    agregarFlowFinal(NewFlow, Flows, FlowsFinal).

agregarSinRepetirNewFlow(Flows, Ids, NewFlow, FlowsFinal) :-
    getIdFlow(NewFlow, NewId),
    existeCodeinCodes(NewId, Ids),
    FlowsFinal = Flows.
