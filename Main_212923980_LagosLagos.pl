
%RF2-Constructor
%option/6
%Dom: Code (Number) X Message (String) x ChatbotCodeLink (Number) X
%InitialFlowCodeLink (Number) X Keyword (List) X option (List)
%Meta Primaria: option/6
%Meta Secundaria: No aplica
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%RF3-falta implementar "eliminarduplicados"
flow(Id, NameMsg, Options, [Id, NameMsg, OptionsFinal]) :-
    eliminarduplicados(Options, OptionsFinal).
