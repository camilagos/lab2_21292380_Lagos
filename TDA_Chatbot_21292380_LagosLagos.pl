
existeCBIDinIDs(ChatbotID,ChatbotIDs) :-
    member(ChatbotID,ChatbotIDs).

getIdCB(Chatbot, ChatbotID) :-
    Chatbot = [ChatbotID|_].

getIdsCB([], []).

getIdsCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs]) :-
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


agregarCBFinal(NewCB, [], [NewCB]).

agregarCBFinal(NewCB, [Chatbot|Chatbots], [Chatbot|ChatbotsFinal]) :-
    agregarCBFinal(NewCB, Chatbots, ChatbotsFinal).


agregarSinRepetirCB([], [], Acumulador, Acumulador).

agregarSinRepetirCB([_|Chatbots], [ChatbotID|ChatbotIDs], Acumulador, ChatbotsFinal) :-
    existeCBIDinIDs(ChatbotID,ChatbotIDs),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, Acumulador, ChatbotsFinal).

agregarSinRepetirCB([Chatbot|Chatbots], [ChatbotID|ChatbotIDs], Acumulador, ChatbotsFinal) :-
    \+ existeCBIDinIDs(ChatbotID,ChatbotIDs),
    agregarCBFinal(Chatbot, Acumulador, AcumuladorOut),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, AcumuladorOut, ChatbotsFinal).
