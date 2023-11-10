
%------------------PERTENENCIA--------------------

%existeCodeinCodes/2
%Descripci�n: Regla que verifica la existencia de un c�digo en una
% lista de c�digos.
%Dom: Code (Int) X Codes (List)
%Meta Primaria: existeCodeinCodes/2
%Meta Secundaria: member/2
existeCodeinCodes(Code,Codes) :-
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
%Descripci�n: Regla que extrae el c�digo de cada opci�n en una lista de
% opciones.
%Dom: Option (List) X Code (Int)
%Meta Primaria: getCodesOption/2
%Meta Secundaria: No aplica
getCodesOption([], []). %Caso base

%getCodesOption/2
%Descripci�n: Regla que extrae el c�digo de cada opci�n en una lista de
% opciones.
%Dom: Options (List) X Code (Int)
%Meta Primaria: getCodesOption/2
%Meta Secundaria: getCodeOption/2
getCodesOption([Option|Options], [Code|Codes]) :-
    getCodeOption(Option, Code),
    getCodesOption(Options, Codes).


agregarOptionFinal(NewOption, Options, OptionsOut) :-
    append(Options, [NewOption], OptionsOut).


agregarSinRepetirOp([], [], Acumulador, Acumulador).


agregarSinRepetirOp([Option|Options], [Code|Codes], Acumulador, OptionsFinal) :-
    \+ existeCodeinCodes(Code, Codes),
    agregarOptionFinal(Option, Acumulador, AcumuladorOut),
    agregarSinRepetirOp(Options, Codes, AcumuladorOut, OptionsFinal).


agregarSinRepetirNewOp(Options, Codes, NewOption, OptionsFinal) :-
    getCodeOption(NewOption, NewCode),
    \+ existeCodeinCodes(NewCode, Codes),
    agregarOptionFinal(NewOption, Options, OptionsFinal).


mayuscula(Keyword, KeywordMayus) :-
    upcase_atom(Keyword, KeywordMayus).

allMayus([],[]).

allMayus([Keyword|Keywords], [KeywordMayus|KeywordsMayus]) :-
    mayuscula(Keyword, KeywordMayus),
    allMayus(Keywords, KeywordsMayus).
