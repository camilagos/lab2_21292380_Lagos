
%------------------SELECTORES--------------------
getIdFlow(Flow, Id):-
    flow(Id,_,_, Flow).


getIdsFlow([], []).

getIdsFlow([Flow|Flows], [Id|Ids]):-
    getIdFlow(Flow, Id),
    getIdsFlow(Flows, Ids).


eliminarFlowDuplicados([], [], Acumulador, Acumulador).

eliminarFlowDuplicados([Id|Ids], [Flow|Flows], Acumulador, FlowsFinal):-
    \+ member(Id, Ids),
    eliminarFlowDuplicados(Ids, Flows, [Flow|Acumulador], FlowsFinal).

eliminarFlowDuplicados([Id|Ids], [_|Flows], Acumulador, FlowsFinal):-
    member(Id, Ids),
    eliminarFlowDuplicados(Ids, Flows, Acumulador, FlowsFinal).
