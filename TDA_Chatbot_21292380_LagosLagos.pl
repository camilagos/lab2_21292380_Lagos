
%------------------PERTENENCIA--------------------

%existeCBIDinIDs/2
%Descripción: Regla que verifica la existencia de un ID en una
% lista de IDs.
%Dom: ChatbotID (Int) X ChatbotIDs (List)
%Meta Primaria: existeCBIDinIDs/2
%Meta Secundaria: member/2
existeCBIDinIDs(ChatbotID, ChatbotIDs) :-
    member(ChatbotID, ChatbotIDs).

%------------------SELECTORES--------------------

%getIdCB/2
%Descripción: Regla que extrae el código de una opción.
%Dom: Option (List) X Code (Int)
%Meta Primaria: getIdCB/2
%Meta Secundaria: No aplica
getIdCB(Chatbot, ChatbotID) :-
    Chatbot = [ChatbotID|_].


%getIdsCB/2
%Descripción: Regla recursiva que extrae el ID de cada chatbot en
% una lista de chatbots.
%Dom: Chatbots (List) X ChatbotIDs (List)
%Meta Primaria: getIdsCB/2
%Meta Secundaria: No aplica
getIdsCB([], []). %Caso base

%Meta Secundaria: getIdCB/2
getIdsCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs]) :- %Caso recursivo
    getIdCB(Chatbot, ChatbotID),
    getIdsCB(Chatbots, ChatbotIDs).



getNameCB(Chatbot, Name) :-
    Chatbot = [_, Name|_].

getMsgCB(Chatbot, WelcomeMessage) :-
    Chatbot = [_,_, WelcomeMessage|_].

getStartFlowIdCB(Chatbot, StartFlowId) :-
    Chatbot = [_,_,_, StartFlowId|_].

getFlowsCB(Chatbot, Flows) :-
    Chatbot = [_,_,_,_, Flows|_].

%-------------------MODIFICADORES--------------------

agregarCBFinal(NewCB, [], [NewCB]). %Caso base

agregarCBFinal(NewCB, [Chatbot|Chatbots], [Chatbot|ChatbotsFinal]) :- %Caso recursivo
    agregarCBFinal(NewCB, Chatbots, ChatbotsFinal).


agregarSinRepetirCB([], [], Acumulador, Acumulador). %Caso base


agregarSinRepetirCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs], Acumulador, ChatbotsFinal) :- %Caso recursivo
    \+ existeCBIDinIDs(ChatbotID,ChatbotIDs),
    agregarCBFinal(Chatbot, Acumulador, AcumuladorOut),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, AcumuladorOut, ChatbotsFinal).


agregarSinRepetirNewCB(Chatbots, ChatbotIDs, NewChatbot, ChatbotsFinal) :-
    getIdCB(NewChatbot, NewID),
    \+ existeCBIDinIDs(NewID, ChatbotIDs),
    agregarCBFinal(NewChatbot, Chatbots, ChatbotsFinal).
