
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


eliminarFlowDuplicados([], [], Acumulador, Acumulador).

eliminarFlowDuplicados([Id|Ids], [Flow|Flows], Acumulador, FlowsFinal) :-
    \+ existeIdinIds(Id, Ids),
    eliminarFlowDuplicados(Ids, Flows, [Flow|Acumulador], FlowsFinal).

eliminarFlowDuplicados([Id|Ids], [_|Flows], Acumulador, FlowsFinal) :-
    existeIdinIds(Id, Ids),
    eliminarFlowDuplicados(Ids, Flows, Acumulador, FlowsFinal).
