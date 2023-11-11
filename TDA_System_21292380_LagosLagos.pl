
%------------------CONSTRUCTOR--------------------

%systemAux/9
%Descripción: Regla auxiliar que construye un sistema.
%Dom: Name (String) X InitialChatbotCodeLink (Int) X Chatbots (List) X
% Time (Int) X Users(List) X UserLogueado (String) X Estado (String) X
% NewCodes (List) X System (List)
%Meta Primaria: systemAux/9
%Meta Secundaria: No aplica.
systemAux(Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueado, Estado, NewCodes, [Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueado, Estado, NewCodes]).

%------------------SELECTORES--------------------

%getNameSystem/2
%Descripción: Regla que extrae el nombre de un sistema.
%Dom: System (List) X Name (String)
%Meta Primaria: getNameSystem/2
%Meta Secundaria: No aplica.
getNameSystem(System, Name) :-
    System = [Name|_].


%getCBCodeSystem/2
%Descripción: Regla que extrae el código de un chatbot de un sistema.
%Dom: System (List) X InitialChatbotCodeLink (Int)
%Meta Primaria: getCBCodeSystem/2
%Meta Secundaria: No aplica.
getCBCodeSystem(System, InitialChatbotCodeLink) :-
    System = [_, InitialChatbotCodeLink|_].


%getCBsSystem/2
%Descripción: Regla que extrae los chatbots de un sistema.
%Dom: System (List) X Chatbots (List)
%Meta Primaria: getCBsSystem/2
%Meta Secundaria: No aplica.
getCBsSystem(System, Chatbots) :-
    System = [_,_, Chatbots|_].


%getTimeSystem/2
%Descripción: Regla que extrae la fecha de creación de un sistema.
%Dom: System (List) X Time (Int)
%Meta Primaria: getTimeSystem/2
%Meta Secundaria: No aplica.
getTimeSystem(System, Time) :-
    System = [_, _, _, Time|_].


%getUsersSystem/2
%Descripción: Regla que extrae los usuarios de un sistema.
%Dom: System (List) X Users (List)
%Meta Primaria: getUsersSystem/2
%Meta Secundaria: No aplica.
getUsersSystem(System, Users) :-
    System = [_, _, _, _, Users|_].


%getUserLogueadoSystem/2
%Descripción: Regla que extrae el usuario logueado de un sistema.
%Dom: System (List) X UserLogueado (String)
%Meta Primaria: getUserLogueadoSystem/2
%Meta Secundaria: No aplica.
getUserLogueadoSystem(System, UserLogueado) :-
    System = [_, _, _, _, _, UserLogueado|_].


%getEstadoSystem/2
%Descripción: Regla que extrae el estado de un sistema.
%Dom: System (List) X Estado (String)
%Meta Primaria: getEstadoSystem/2
%Meta Secundaria: No aplica.
getEstadoSystem(System, Estado) :-
    System = [_, _, _, _, _, _, Estado|_].


%getNewCodesSystem/2
%Descripción: Regla que extrae los nuevos códigos de un sistema.
%Dom: System (List) X NewCodes (List)
%Meta Primaria: getNewCodesSystem/2
%Meta Secundaria: No aplica.
getNewCodesSystem(System, NewCodes) :-
    System = [_, _, _, _, _, _, _, NewCodes|_].
