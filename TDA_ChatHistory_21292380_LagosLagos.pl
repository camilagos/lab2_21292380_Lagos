
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
