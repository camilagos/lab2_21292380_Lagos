
systemAux(Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueado, Estado, NewCodes, [Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueado, Estado, NewCodes]).

%------------------SELECTORES--------------------

getNameSystem(System, Name) :-
    System = [Name|_].

getCBCodeSystem(System, InitialChatbotCodeLink) :-
    System = [_, InitialChatbotCodeLink|_].

getCBsSystem(System, Chatbots) :-
    System = [_,_, Chatbots|_].

getTimeSystem(System, Time) :-
    System = [_, _, _, Time|_].

getUsersSystem(System, Users) :-
    System = [_, _, _, _, Users|_].

getUserLogueadoSystem(System, UserLogueado) :-
    System = [_, _, _, _, _, UserLogueado|_].

getEstadoSystem(System, Estado) :-
    System = [_, _, _, _, _, _, Estado|_].

getNewCodesSystem(System, NewCodes) :-
    System = [_, _, _, _, _, _, _, NewCodes|_].
