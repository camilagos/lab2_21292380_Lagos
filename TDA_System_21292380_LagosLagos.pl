
getNameSystem(System, Name) :-
    System = [Name|_].

getCBCodeSystem(System, InitialChatbotCodeLink) :-
    System = [_, InitialChatbotCodeLink|_].

getCBsSystem(System, Chatbots) :-
    System = [_,_, Chatbots|_].
