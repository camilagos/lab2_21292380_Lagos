
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
%Descripción: Regla que extrae el ID de un chatbot.
%Dom: Chatbot (List) X ChatbotID (Int)
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

%Meta Secundaria: getIdCB/2, getIdsCB/2
getIdsCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs]) :- %Caso recursivo
    getIdCB(Chatbot, ChatbotID),
    getIdsCB(Chatbots, ChatbotIDs).


%getNameCB/2
%Descripción: Regla que extrae el nombre de un chatbot.
%Dom: Chatbot (List) X Name (String)
%Meta Primaria: getNameCB/2
%Meta Secundaria: No aplica
getNameCB(Chatbot, Name) :-
    Chatbot = [_, Name|_].


%getMsgCB/2
%Descripción: Regla que extrae el mensaje de un chatbot.
%Dom: Chatbot (List) X WelcomeMessage (String)
%Meta Primaria: getMsgCB/2
%Meta Secundaria: No aplica
getMsgCB(Chatbot, WelcomeMessage) :-
    Chatbot = [_,_, WelcomeMessage|_].


%getStartFlowIdCB/2
%Descripción: Regla que extrae el ID del flujo inicial de un chatbot.
%Dom: Chatbot (List) X StartFlowId (Int)
%Meta Primaria: getStartFlowIdCB/2
%Meta Secundaria: No aplica
getStartFlowIdCB(Chatbot, StartFlowId) :-
    Chatbot = [_,_,_, StartFlowId|_].


%getFlowsCB/2
%Descripción: Regla que extrae los flujos de un chatbot.
%Dom: Chatbot (List) X Flows (List)
%Meta Primaria: getFlowsCB/2
%Meta Secundaria: No aplica
getFlowsCB(Chatbot, Flows) :-
    Chatbot = [_,_,_,_, Flows|_].

%-------------------MODIFICADORES--------------------

%agregarCBFinal/3
%Descripción: Regla que agrega un chatbot al final de una lista de
% chatbots.
%Dom: NewCB (List) X Chatbots (List) X ChatbotsFinal (List)
%Meta Primaria: agregarCBFinal/3
%Meta Secundaria: No aplica.
agregarCBFinal(NewCB, [], [NewCB]). %Caso base

%Meta Secundaria: agregarCBFinal/3
agregarCBFinal(NewCB, [Chatbot|Chatbots], [Chatbot|ChatbotsFinal]) :- %Caso recursivo
    agregarCBFinal(NewCB, Chatbots, ChatbotsFinal).


%agregarSinRepetirCB/4
%Descripción: Regla recursiva que revisa que en una lista de
% chatbots no existan repetidos.
%Dom: Chatbots (List) X ChatbotsIDs (List) X Acumulador (List) X
% ChatbotsFinal (List)
%Meta Primaria: agregarSinRepetirCB/4
%Meta Secundaria: No aplica.
agregarSinRepetirCB([], [], Acumulador, Acumulador). %Caso base

% Meta Secundaria: existeCBIDinIDs2, agregarCBFinal/3, agregarSinRepetirCB/4
agregarSinRepetirCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs], Acumulador, ChatbotsFinal) :- %Caso recursivo
    \+ existeCBIDinIDs(ChatbotID,ChatbotIDs),
    agregarCBFinal(Chatbot, Acumulador, AcumuladorOut),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, AcumuladorOut, ChatbotsFinal).


%agregarSinRepetirNewCB/4
%Descripción: Regla que agrega un nuevo chatbot a una lista, solo si no
% existe previamente.
%Dom: Chatbots (List) X ChatbotIDs (List) X NewChatbot (List) X
% ChatbotsFinal (List)
%Meta Primaria: agregarSinRepetirNewCB/4
%Meta Secundaria: getIdCB/2, existeCBIDinIDs/2, agregarCBFinal/3
agregarSinRepetirNewCB(Chatbots, ChatbotIDs, NewChatbot, ChatbotsFinal) :-
    getIdCB(NewChatbot, NewID),
    \+ existeCBIDinIDs(NewID, ChatbotIDs),
    agregarCBFinal(NewChatbot, Chatbots, ChatbotsFinal).


%-------------------OTROS--------------------

%buscarCBinCBs/4
%Descripción: Regla recursiva que busca un chatbot en una lista de
% chatbots a partir de su código.
%Dom: InitialChatbotCodeLink (Int) X ChatbotIDs (List) X Chatbots
% (List) X Chatbot (List)
%Meta Primaria: buscarCBinCBs/4
%Meta Secundaria: No aplica.
buscarCBinCBs(InitialChatbotCodeLink, [InitialChatbotCodeLink|_], [Chatbot|_], Chatbot). %Caso base

%Meta Secundaria: buscarCBinCBs/4
buscarCBinCBs(InitialChatbotCodeLink, [_|ChatbotIDs], [_|Chatbots], Chatbot) :- %Caso recursivo
    buscarCBinCBs(InitialChatbotCodeLink, ChatbotIDs, Chatbots, Chatbot).
