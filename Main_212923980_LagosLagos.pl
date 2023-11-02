:-consult('tda_option_21292380_lagoslagos.pl').
:-consult('tda_flow_21292380_lagoslagos.pl').

%RF2-Constructor
%option/6
%Dom: Code (Number) X Message (String) x ChatbotCodeLink (Number) X
%InitialFlowCodeLink (Number) X Keyword (List) X option (List)
%Meta Primaria: option/6
%Meta Secundaria: No aplica
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%RF3-
flow(Id, NameMsg, Options, [Id, NameMsg, OptionsFinal]):-
    getCodesOption(Options, Codes),
    eliminarOptionDuplicadas(Codes, Options, [], OptionsFinal).

%RF4- se queda en un bucle cuando no debe agregar la opcion
flowAddOption(Flow, NewOption, NewFlow):-
    flow(Id, NameMsg, Options, Flow),
    getCodesOption(Options, Codes),
    getCodeOption(NewOption, NewCode),
    (\+ member(NewCode, Codes) ->
	OptionsFinal = [NewOption|Options]
    ;
	OptionsFinal = Options),
    flow(Id, NameMsg, OptionsFinal, NewFlow).

%RF5-
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal]):-
    getIdsFlow(Flows, Ids),
    eliminarFlowDuplicados(Ids, Flows, [], FlowsFinal).
