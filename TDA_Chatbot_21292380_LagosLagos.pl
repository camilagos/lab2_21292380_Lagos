
getIdCB(Chatbot, ChatbotID) :-
    Chatbot = [ChatbotID|_].

getNameCB(Chatbot, Name) :-
    Chatbot = [_, Name|_].

getMsgCB(Chatbot, WelcomeMessage) :-
    Chatbot = [_,_, WelcomeMessage|_].

getStartFlowIdCB(Chatbot, StartFlowId) :-
    Chatbot = [_,_,_, StartFlowId|_].

getFlowsCB(Chatbot, Flows) :-
    Chatbot = [_,_,_,_, Flows|_].
