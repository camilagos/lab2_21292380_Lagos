
%------------------CONSTRUCTOR--------------------

%chatHistory/6
%Descripción: Regla que construye el historial (una interacción).
%Dom: Time (Int) X Message (String) X NameCB (String) X NameMsg
% (String) X Options (List) X ChatHistory (List)
%Meta Primaria: chatHistory/6
%Meta Secundaria: No aplica.
chatHistory(Time, Message, NameCB, NameMsg, Options, [Time, Message, NameCB, NameMsg, Options]).

%------------------SELECTORES--------------------

%getTimeCH/2
%Descripción: Regla que extrae la fecha de creación de una interaccion.
%Dom: ChatHistory (List) X Time (Int)
%Meta Primaria: getTimeCH/2
%Meta Secundaria: No aplica.
getTimeCH(ChatHistory, Time) :-
    ChatHistory = [Time|_].


%getMessageCH/2
%Descripción: Regla que extrae el mensaje de una interaccion.
%Dom: ChatHistory (List) X Message (String)
%Meta Primaria: getMessageCH/2
%Meta Secundaria: No aplica.
getMessageCH(ChatHistory, Message) :-
    ChatHistory = [_, Message|_].


%getNameCBCH/2
%Descripción: Regla que extrae el nombre del chatbot de una interaccion.
%Dom: ChatHistory (List) X NameCB (String)
%Meta Primaria: getNameCBCH/2
%Meta Secundaria: No aplica.
getNameCBCH(ChatHistory, NameCB) :-
    ChatHistory = [_, _, NameCB|_].


%getNameMsgCH/2
%Descripción: Regla que extrae el nombre del flujo de una interaccion.
%Dom: ChatHistory (List) X NameMsg (String)
%Meta Primaria: getNameMsgCH/2
%Meta Secundaria: No aplica.
getNameMsgCH(ChatHistory, NameMsg) :-
    ChatHistory = [_, _, _, NameMsg|_].


%getOptionsCH/2
%Descripción: Regla que extrae las opciones de una interaccion.
%Dom: ChatHistory (List) X Options (List)
%Meta Primaria: getOptionsCH/2
%Meta Secundaria: No aplica.
getOptionsCH(ChatHistory, Options) :-
    ChatHistory = [_, _, _, _, Options|_].

%-------------------OTROS--------------------

%sintetizarInteracciones/3
%Descripción: Regla recursiva que sintetiza el historial de un usuario.
% Dom: ChatHistory (List) X User (String) X InteraccionesOut (List)
%Meta Primaria: sintetizarInteracciones/3
%Meta Secundaria: No aplica.
sintetizarInteracciones([], _, []). %Caso base

% Meta Secundaria: getTimeCH/2, getMessageCH/2, getNameCBCH/2,
% getNameMsgCH/2, getOptionsCH/2, getMessageOps/2, atomic_list_concat/3,
% sintetizarInteracciones/3
sintetizarInteracciones([ChatHistory|Interacciones], User, [Str1|Resto]) :- %Caso recursivo
    getTimeCH(ChatHistory, Time),
    getMessageCH(ChatHistory, Message),
    getNameCBCH(ChatHistory, NameCB),
    getNameMsgCH(ChatHistory, NameMsg),
    getOptionsCH(ChatHistory, Options),
    getMessageOps(Options, MsgOps),
    atomic_list_concat([Time, User], ' - ', Acum1),
    atomic_list_concat([Acum1, Message], ':', Linea1),
    atomic_list_concat([Time, NameCB], ' - ', Acum2),
    atomic_list_concat([Acum2, NameMsg], ':', Linea2),
    atomic_list_concat([Linea1, Linea2], '\n', Acum),
    atomic_list_concat(MsgOps, '\n', Ops),
    atomic_list_concat([Acum, Ops], '\n', Str1),
    sintetizarInteracciones(Interacciones, User, Resto).
