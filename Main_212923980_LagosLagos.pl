:-consult('tda_option_21292380_lagoslagos.pl').
:-consult('tda_flow_21292380_lagoslagos.pl').
:-consult('tda_chatbot_21292380_lagoslagos.pl').
:-consult('tda_system_21292380_lagoslagos.pl').
:-consult('tda_user_21292380_lagoslagos.pl').

%RF2-Constructor
%option/6
%Descrpción: Regla que construye una opción, despues de dejar todas las
% keywords en mayuscula.
%Dom: Code (Int) X Message (String) x ChatbotCodeLink (Int) X
% InitialFlowCodeLink (Int) X Keyword (List) X Option (List)
%Meta Primaria: option/6
%Meta Secundaria: allMayus/2
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword,[Code, Message, ChatbotCodeLink, InitialFlowCodeLink, KeywordMayus]) :-
    allMayus(Keyword, KeywordMayus).


%RF3-Constructor
%flow/4
%Descripción: Regla que construye un flujo, solo si no se ingresaron
% opciones duplicadas en el listado de las opciones del flujo.
%Dom: Id (Int) X NameMsg (String) X Options (List) X Flow (List)
%Meta Primaria: flow/4
%Meta Secundaria: getCodesOption/2, agregarSinRepetirOp/4
flow(Id, NameMsg, Options, [Id, NameMsg, OptionsFinal]) :-
    getCodesOption(Options, Codes),
    agregarSinRepetirOp(Options, Codes, [], OptionsFinal).


%RF4-Modificador
%flowAddOption/3
%Descripción: Regla que agrega una opcion a un flujo, únicamente si
% esta no era parte del flujo antes.
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
%Descripción: Regla que construye un chatbot, solo si la lista de
% flujos ingresada no tiene flujos repetidos.
%Dom: ChatbotID (Int) X Name (String) X WelcomeMessage (String) X
% StartFlowId (Int) X Flows (List) X Chatbot (List)
%Meta Primaria: chatbot/6
%Meta Secundaria: getIdsFlow/2, agregarSinRepetirFlow/4
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowId, FlowsFinal]) :-
    getIdsFlow(Flows, Ids),
    agregarSinRepetirFlow(Flows, Ids, [], FlowsFinal).


%RF6-Modificador
%chatbotAddFlow/3
%Descripción: Regla que agrega un flujo a un chatbot, únicamente si
% este no era parte del chatbot antes.
%Dom: Chatbot (List) X NewFlow (List) X ChatbotOut (List)
%Meta Primaria: chatbotAddFlow/3
%Meta Secundaria: getIdCB/2, getNameCB/2, getMsgCB/2,
% getStartFlowIdCB/2, getFlowsCB/2, getIdsFlow/2
% agregarSinRepetirNewFlow/4, chatbot/6
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
%system/4
%Descripción: Regla que construye un sistem, solo si la lista de
% chatbots ingresada no tiene chatbots repetidos.
%Dom: Name (String) X InitialChatbotCodeLink (Int) X Chatbots (List)
% X System (List)
%Meta Primaria: system/4
%Meta Secundaria: getIdsCB/2, agregarSinRepetirCB/4, get_time/1
system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, ChatbotsFinal, Time, [], [], "Sin interacciones válidas", []]) :-
    getIdsCB(Chatbots, ChatbotIDs),
    agregarSinRepetirCB(Chatbots, ChatbotIDs, [], ChatbotsFinal),
    get_time(Time).


%RF8-Modificador
%systemAddChatbot/3
%Descripción: Regla que agrega un chatbot a un sistem, únicamente si
% este no era parte del sistema antes.
%Dom: System (List) X NewChatbot (List) X SystemOut (List)
%Meta Primaria: systemAddChatbot/3
%Meta Secundaria: getNameSystem/2, getCBCodeSystem/2, getCBsSystem/2,
% getIdsCB/2, agregarSinRepetirNewCB/4, getTimeSystem/2,
% getUsersSystem/2, getUserLogueado/2, getEstadoSystem/2,
% getNewCodesSystem/2, systemAux/9
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


%RF9-Modificador
%systemAddUser/3
%Descripción: Regla que agrega un usuario a un sistem, únicamente si
% este no existia en el sistema previamente.
%Dom: System (List) X NameUser (String) X SystemOut (List)
%Meta Primaria: systemAddUser/3
%Meta Secundaria: getNameSystem/2, getCBCodeSystem/2, getCBsSystem/2,
% getTimeSystem/2, getUsersSystem/2, agregarNewUser/3,
% getUserLogueadoSystem/2, getEstadoSystem/2, getNewCodesSystem/2,
% systemAux/9
systemAddUser(System, NameUser, SystemOut) :-
    getNameSystem(System, Name),
    getCBCodeSystem(System, InitialChatbotCodeLink),
    getCBsSystem(System, Chatbots),
    getTimeSystem(System, Time),
    getUsersSystem(System, Users),
    agregarNewUser(NameUser, Users, UsersFinal),
    getUserLogueadoSystem(System, UserLogueado),
    getEstadoSystem(System, Estado),
    getNewCodesSystem(System, NewCodes),
    systemAux(Name, InitialChatbotCodeLink, Chatbots, Time, UsersFinal, UserLogueado, Estado, NewCodes, SystemOut).


%RF10
%systemLogin/3
%Descripción: Regla que inicia la sesión de un ususario en el sistema,
% solo si el usuario ya esta registrado en el sistema previamente, y si
% no hay otra sesión iniciada.
%Dom: System (List) X User (String) X SystemOut (List)
%Meta Primaria: systemLogin/3
%Meta Secundaria: mayuscula/2, getUsersSystem/2, getNamesUser/2,
% getUserLogueadoSystem/2, login/4, getNameSystem/2, getCBCodeSystem/2,
% getCBsSystem/2, getTimeSystem/2, getUsersSystem/2, getEstadoSystem/2,
% getNewCodesSystem/2, systemAux/9
systemLogin(System, User, SystemOut) :-
    mayuscula(User, NameUser),
    getUsersSystem(System, Users),
    getNamesUser(Users, NamesUsers),
    getUserLogueadoSystem(System, UserLogueado),
    login(NameUser, NamesUsers, UserLogueado, UserLogueadoOut),
    getNameSystem(System, Name),
    getCBCodeSystem(System, InitialChatbotCodeLink),
    getCBsSystem(System, Chatbots),
    getTimeSystem(System, Time),
    getUsersSystem(System, Users),
    getEstadoSystem(System, Estado),
    getNewCodesSystem(System, NewCodes),
    systemAux(Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueadoOut, Estado, NewCodes, SystemOut).


%RF11
%systemLogout/2
%Descripción: Regla que cierra la sesión iniciada en el sistema.
%Dom: System (List) X SystemOut (List)
%Meta Primaria: systemLogout/2
%Meta Secundaria: getUserLogueadoSystem/2, logout/2, getNameSystem/2,
% getCBCodeSystem/2, getCBsSystem/2, getTimeSystem/2,
% getUsersSystem/2, getNewCodesSystem/2, systemAux/9
systemLogout(System, SystemOut) :-
    getUserLogueadoSystem(System, UserLogueado),
    logout(UserLogueado, UserLogueadoOut),
    getNameSystem(System, Name),
    getCBCodeSystem(System, InitialChatbotCodeLink),
    getCBsSystem(System, Chatbots),
    getTimeSystem(System, Time),
    getUsersSystem(System, Users),
    Estado = "Sin interacciones válidas",
    getNewCodesSystem(System, NewCodes),
    systemAux(Name, InitialChatbotCodeLink, Chatbots, Time, Users, UserLogueadoOut, Estado, NewCodes, SystemOut).
