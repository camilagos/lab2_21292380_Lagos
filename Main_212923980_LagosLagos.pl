:-consult('tda_option_21292380_lagoslagos.pl').
:-consult('tda_flow_21292380_lagoslagos.pl').
:-consult('tda_chatbot_21292380_lagoslagos.pl').
:-consult('tda_system_21292380_lagoslagos.pl').
:-consult('tda_user_21292380_lagoslagos.pl').

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
% getCodesOption/2, agregarSinRepetirNewOp/4, flow/4
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
%getStartFlowIdCB/2, getFlowsCB/2, getIdsFlow/2
%agregarSinRepetirNewFlow/4, chatbot/6
chatbotAddFlow(Chatbot, NewFlow, ChatbotOut) :-
    getIdCB(Chatbot, ChatbotID),
    getNameCB(Chatbot, Name),
    getMsgCB(Chatbot, WelcomeMessage),
    getStartFlowIdCB(Chatbot, StartFlowId),
    getFlowsCB(Chatbot, Flows),
    getIdsFlow(Flows, Ids),
    agregarSinRepetirNewFlow(Flows, Ids, NewFlow, FlowsFinal),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal, ChatbotOut).


%RF7-Constructor
%system/3
%Dom: Name (String) X InitialChatbotCodeLink (Number) X Chatbots (List)
%X system (List)
%Meta Primaria: system/3
%Meta Secundaria: getIdsCB/2, agregarSinRepetirCB/4
system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, ChatbotsFinal, Time, [], [], "Sin interacciones válidas", []]) :-
    getIdsCB(Chatbots, ChatbotIDs),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, [], ChatbotsFinal),
    get_time(Time).


%RF8-Modificador
%systemAddChatbot/3
%Dom: System (List) X NewChatbot (List) X SystemOut (List)
%Meta Primaria: systemAddChatbot/3
%Meta Secundaria: getNameSystem/2, getCBCodeSystem/2, getCBsSystem/2,
%getIdsCB/2, agregarSinRepetirNewCB/4, system/4
systemAddChatbot(System, NewChatbot, SystemOut) :-
    getNameSystem(System, Name),
    getCBCodeSystem(System, InitialChatbotCodeLink),
    getCBsSystem(System, Chatbots),
    getIdsCB(Chatbots, ChatbotIDs),
    agregarSinRepetirNewCB(Chatbots, ChatbotIDs, NewChatbot, ChatbotsFinal),
    getTimeSystem(System, Time),
    getUsersSystem(System, Users),
    getUserLogueadoSystem(System, UserLogueado),
    getEstadoSystem(System, Estado),
    getNewCodesSystem(System, NewCodes),
    systemAux(Name, InitialChatbotCodeLink, ChatbotsFinal, Time, Users, UserLogueado, Estado, NewCodes, SystemOut).
