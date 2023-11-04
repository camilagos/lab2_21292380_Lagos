:-consult('tda_option_21292380_lagoslagos.pl').
:-consult('tda_flow_21292380_lagoslagos.pl').
:-consult('tda_chatbot_21292380_lagoslagos.pl').

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
%Meta Secundaria: getCodesOption/2, agregarSinRepetirOp/4
flow(Id, NameMsg, Options, [Id, NameMsg, OptionsFinal]) :-
    getCodesOption(Options, Codes),
    agregarSinRepetirOp(Options, Codes, [], OptionsFinal).

%RF4-Modificador
%flowAddOption/3
%Dom: Flow (List) X NewOption (List) X FlowOut (List)
%Meta Primaria: flowAddOption/3
%Meta Secundaria: getIdFlow/2, getNameMsgFlow/2, getOptionsFlow/2,
% getCodesOption/2, agregarSinRepetirNewOp/4
flowAddOption(Flow, NewOption, FlowOut) :-
    getIdFlow(Flow, Id),
    getNameMsgFlow(Flow, NameMsg),
    getOptionsFlow(Flow, Options),
    getCodesOption(Options, Codes),
    agregarSinRepetirNewOp(Options, Codes, NewOption, OptionsFinal),
    flow(Id, NameMsg, OptionsFinal, FlowOut).

%RF5-Constructor
%chatbot/6
%Dom: ChatbotID (Number) X Name (String) X WelcomeMessage (String) X
%StartFlowId (Number) X Flows (List) X chatbot (List)
%Meta Primaria: chatbot/6
%Meta Secundaria: getIdsFlow/2, agregarSinRepetirFlow/4
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal]) :-
    getIdsFlow(Flows, Ids),
    agregarSinRepetirFlow(Flows, Ids, [], FlowsFinal).

%RF6-Modificador
%chatbotAddFlow/3
%Dom: Chatbot (List) X NewFlow (List) X ChatbotOut (List)
%Meta Primaria: chatbotAddFlow/3
%Meta Secundaria: getIdCB/2, getNameCB/2, getMsgCB/2,
% getStartFlowIdCB/2, getFlowsCB/2, getIdsFlow/2
% agregarSinRepetirNewFlow/4
chatbotAddFlow(Chatbot, NewFlow, ChatbotOut) :-
    getIdCB(Chatbot, ChatbotID),
    getNameCB(Chatbot, Name),
    getMsgCB(Chatbot, WelcomeMessage),
    getStartFlowIdCB(Chatbot, StartFlowId),
    getFlowsCB(Chatbot, Flows),
    getIdsFlow(Flows, Ids),
    agregarSinRepetirNewFlow(Flows, Ids, NewFlow, FlowsFinal),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal, ChatbotOut).
