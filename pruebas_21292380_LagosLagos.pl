:-consult('main_21292380_lagoslagos.pl').

/*-----------------Scrip de pruebas N°1-----------------

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10),
% systemTalkRec(S10, "hola", S11), % si se descomenta, daría false por que “hola” no es un option o keyword
systemTalkRec(S110, "1", S12),
systemTalkRec(S12, "1", S13),
systemTalkRec(S13, "Museo", S14),
systemTalkRec(S14, "1", S15),
systemTalkRec(S15, "3", S16),
systemTalkRec(S16, "5", S17),
systemSynthesis(S17, "user2", Str1).
%systemSimulate(S3, 5, 32131, S99). %Esta consulta esta comentada ya que el predicado "systemSimulate" no fue implementado

*/



/*-----------------Scrip de pruebas N°2-----------------

%CHATBOT 0
option(1, "1) Hacer deporte", 1, 1, ["deporte", "ejercitarse"], O1),
option(2, "2) Trabajar", 0, 1, [], O2),
option(3, "3) Salir a comer", 0, 1, ["comer"], O3),
%flow(1, "Flujo principal Chatbot 1: ¿Que te gustaria hacer?", [O1, O2, O1], F10), %Al descomentar da false
flow(1, "Flujo principal Chatbot 1: ¿Que te gustaria hacer?", [O1, O2], F1),
flowAddOption(F1, O3, F11),
%flowAddOption(F11, O1, F12), %Al descomentar da false
chatbot(0, "Inicial", "Bienvenido: ¿Qué te gustaría hacer?", 1, [F11], CB0),
%chatbotAddFlow(CB0, F11, CB01), %Al descomentar da false

%CHATBOT 1, PRIMER FLUJO
option(1, "1) En equipo", 1, 2, ["equipo"], O4),
option(2, "2) En solitario", 1, 1, ["solitario", "solo"], O5),
option(3, "3) Vover", 0, 1, ["atras"], O6),
flow(1, "Flujo 1 Chatbot 1: ¿Cómo te gusta hacer deporte", [O4, O5], F2),
%flowAddOption(F2, O4, F20), %Al descomentar da false
flowAddOption(F2, O6, F21),

%CHATBOT 1, SEGUNDO FLUJO
option(1, "1) Fútbol", 1, 2, [], O7),
option(2, "2) Baloncesto", 1, 2, [], O8),
flow(2, "Flujo 2 Chatbot 1: ¿Qué deporte prefieres?", [O7], F3),
flowAddOption(F3, O8, F31),
%chatbot(1, "Coach Deportivo", "Bienvenido: ¿Qué deporte quieres practicar?", 1, [F21, F21], CB10), %Al descomentar da false
chatbot(1, "Coach Deportivo", "Bienvenido: ¿Qué deporte quieres practicar?", 1, [], CB1),
chatbotAddFlow(CB1, F21, CB11),
chatbotAddFlow(CB11, F31, CB12),

%SISTEMA
system("Chatbots de Prueba", 0, [CB0], S1),
systemAddChatbot(S1, CB12, S2),
systemAddUser(S2, "user1", S3),
%systemAddUser(S3, "user1", S30), %Al descomentar da false
systemAddUser(S3, "UsEr2", S4),
systemAddUser(S4, "USER3", S5),
systemLogin(S5, "user1", S6),
%systemLogin(S6, "user2", S60), %Al descomentar da false
systemLogout(S6, S7),
%systemLogout(S7, S70), %Al descomentar da false
systemLogin(S7, "user1", S8),
systemTalkRec(S8, "1", S9),
%systemTalkRec(S9, "10", S90), %Al descomentar da false
systemTalkRec(S9, "Equipo", S10),
systemTalkRec(S10, "2", S11),
systemLogout(S11, S12),
systemSynthesis(S12, "user1", S13).

*/
