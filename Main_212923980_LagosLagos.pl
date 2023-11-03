:-consult('tda_option_21292380_lagoslagos.pl').
:-consult('tda_flow_21292380_lagoslagos.pl').

%RF2-Constructor
%option/6
%Dom: Code (Number) X Message (String) x ChatbotCodeLink (Number) X
%InitialFlowCodeLink (Number) X Keyword (List) X option (List)
%Meta Primaria: option/6
%Meta Secundaria: allMayus/2
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[Code, Message, ChatbotCodeLink, InitialFlowCodeLink, KeywordMayus]) :-
    allMayus(Keyword, KeywordMayus).

%RF3-Constructor
%flow/4
%Dom: Id (Number) X NameMsg (String) X Options (List) X flow (List)
%Meta Primaria: flow/4
%Meta Secundaria: getCodesOption/2, eliminarOptionDuplicadas/4
flow(Id, NameMsg, Options, [Id, NameMsg, OptionsFinal]) :-
    getCodesOption(Options, Codes),
    eliminarOptionDuplicadas(Codes, Options, [], OptionsFinal).

%RF4- se queda en un bucle cuando no debe agregar la opcion
flowAddOption(Flow, NewOption, FlowOut) :-
    flow(Id, NameMsg, Options, Flow),
    getCodesOption(Options, Codes),
    getCodeOption(NewOption, NewCode),
    (\+ member(NewCode, Codes) ->
	OptionsFinal = [NewOption|Options]
    ;
	OptionsFinal = Options),
    flow(Id, NameMsg, OptionsFinal, FlowOut).

%RF5-Constructor
%chatbot/6
%Dom: ChatbotID (Number) X Name (String) X WelcomeMessage (String) X
%StartFlowId (Number) X Flows (List) X chatbot (List)
%Meta Primaria: chatbot/6
%Meta Secundaria: getIdsFlow/2, eliminarFlowDuplicados/4
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal]) :-
    getIdsFlow(Flows, Ids),
    eliminarFlowDuplicados(Ids, Flows, [], FlowsFinal).
