
%------------------PERTENENCIA--------------------

%existeCodeinCodes/2
%Descripci�n: Regla que verifica la existencia de un c�digo en una
% lista de c�digos.
%Dom: Code (Int) X Codes (List)
%Meta Primaria: existeCodeinCodes/2
%Meta Secundaria: member/2
existeCodeinCodes(Code, Codes) :-
    member(Code, Codes).

%-------------------SELECTORES--------------------

%getCodeOption/2
%Descripci�n: Regla que extrae el c�digo de una opci�n.
%Dom: Option (List) X Code (Int)
%Meta Primaria: getCodeOption/2
%Meta Secundaria: No aplica
getCodeOption(Option, Code) :-
    Option = [Code|_].


%getCodesOption/2
%Descripci�n: Regla recursiva que extrae el c�digo de cada opci�n en
% una lista de opciones.
%Dom: Options (List) X Codes (List)
%Meta Primaria: getCodesOption/2
%Meta Secundaria: No aplica
getCodesOption([], []). %Caso base

%Meta Secundaria: getCodeOption/2, getCodesOption/2
getCodesOption([Option|Options], [Code|Codes]) :-  %Caso recursivo
    getCodeOption(Option, Code),
    getCodesOption(Options, Codes).


%getMessageOption/2
%Descripci�n: Regla que extrae el mensaje de una opci�n.
%Dom: Option (List) X MessageOp (String)
%Meta Primaria: getMessageOption/2
%Meta Secundaria: No aplica
getMessageOption(Option, MessageOp) :-
    Option = [_, MessageOp|_].


%getMessageOps/2
%Descripci�n: Regla recursiva que extrae el mensaje de cada opci�n en
% una lista de opciones.
%Dom: Options (List) X MessageOps (List)
%Meta Primaria: getMessageOps/2
%Meta Secundaria: No aplica
getMessageOps([],[]). %Caso base

%Meta Secundaria: getMessageOption/2, getMessageOps/2
getMessageOps([Option|Options], [MsgOp|MsgOps]) :- %Caso recursivo
    getMessageOption(Option, MsgOp),
    getMessageOps(Options, MsgOps).


%getCBCodeOption/2
%Descripci�n: Regla que extrae el c�digo del chatbot de una opci�n.
%Dom: Option (List) X ChatbotID (Int)
%Meta Primaria: getCBCodeOption/2
%Meta Secundaria: No aplica
getCBCodeOption(Option, ChatbotID) :-
    Option = [_, _, ChatbotID|_].


%getCodeFlowOption/2
%Descripci�n: Regla que extrae el c�digo del flujo de una opci�n.
%Dom: Option (List) X FlowID (Int)
%Meta Primaria: getCodeFlowOption/2
%Meta Secundaria: No aplica
getCodeFlowOption(Option, FlowID) :-
    Option = [_, _, _, FlowID|_].


%getKeywordOption/2
%Descripci�n: Regla que extrae las palabras clave de una opci�n.
%Dom: Option (List) X Keywords (List)
%Meta Primaria: getKeywordOption/2
%Meta Secundaria: No aplica
getKeywordOption(Option, Keywords) :-
    Option = [_, _, _, _, Keywords].

%-------------------MODIFICADORES--------------------

%agregarOptionFinal/3
%Descripci�n: Regla que agrega una opci�n al final de una lista de
% opciones.
%Dom: NewOption (List) X Options (List) X OptionsOut (List)
%Meta Primaria: agregarOptionFinal/3
%Meta Secundaria: append/2
agregarOptionFinal(NewOption, Options, OptionsOut) :-
    append(Options, [NewOption], OptionsOut).


%agregarSinRepetirOp/4
%Descripci�n: Regla recursiva que revisa que en una lista de
% opciones no existan repetidos.
%Dom: Options (List) X Codes (List) X Acumulador (List) X OptionsFinal(List)
%Meta Primaria: agregarSinRepetirOp/4
%Meta Secundaria: No aplica
agregarSinRepetirOp([], [], Acumulador, Acumulador). %Caso base

%Meta Secundaria: existeCodeinCodes/2, agregarOptionFinal/3,
% agregarSinRepetirOp/4
agregarSinRepetirOp([Option|Options], [Code|Codes], Acumulador, OptionsFinal) :- %Caso recursivo
    \+ existeCodeinCodes(Code, Codes),
    agregarOptionFinal(Option, Acumulador, AcumuladorOut),
    agregarSinRepetirOp(Options, Codes, AcumuladorOut, OptionsFinal).


%agregarSinRepetirNewOp/4
%Descripci�n: Regla que agrega una nueva opci�n a una lista, solo si no
% existe previamente.
%Dom: Options (List) X Codes (List) X NewOption (List) X
% OptionsFinal(List)
%Meta Primaria: agregarSinRepetirNewOp/4
%Meta Secundaria: getCodeOption/2, existeCodeinCodes/2,
% agregarOptionFinal/3
agregarSinRepetirNewOp(Options, Codes, NewOption, OptionsFinal) :-
    getCodeOption(NewOption, NewCode),
    \+ existeCodeinCodes(NewCode, Codes),
    agregarOptionFinal(NewOption, Options, OptionsFinal).

%-------------------OTROS--------------------

%mayuscula/2
%Descripci�n: Regla que deja en mayuscula una palabra.
%Dom: Keyword (String) X KeywordMayus (Atom)
%Meta Primaria: mayuscula/2
%Meta Secundaria: upcase_atom/2
mayuscula(Keyword, KeywordMayus) :-
    upcase_atom(Keyword, KeywordMayus).


%allMayus/2
%Descripci�n: Regla recursiva que deja en mayuscula las palabras de una
% lista.
%Dom: Keywords (List) X KeywordsMayus (List)
%Meta Primaria: allMayus/2
%Meta Secundaria: No aplica.
allMayus([],[]). %Caso base

%Meta Secundaria: mayuscula/2, allMayus/2
allMayus([Keyword|Keywords], [KeywordMayus|KeywordsMayus]) :- %Caso recursivo
    mayuscula(Keyword, KeywordMayus),
    allMayus(Keywords, KeywordsMayus).
