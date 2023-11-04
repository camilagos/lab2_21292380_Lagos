
%------------------PERTENENCIA--------------------

existeCodeinCodes(Code,Codes) :-
    member(Code, Codes).

%-------------------SELECTORES--------------------

getCodeOption(Option, Code) :-
    Option = [Code|_].

getCodesOption([], []).

getCodesOption([Option|Options], [Code|Codes]) :-
    getCodeOption(Option, Code),
    getCodesOption(Options, Codes).


agregarOptionFinal(NewOption, Options, OptionsOut) :-
    append(Options, [NewOption], OptionsOut).


agregarSinRepetirOp([], [], Acumulador, Acumulador).

agregarSinRepetirOp([_|Options], [Code|Codes], Acumulador, OptionsFinal) :-
    existeCodeinCodes(Code, Codes),
    agregarSinRepetirOp(Options, Codes, Acumulador, OptionsFinal).

agregarSinRepetirOp([Option|Options], [Code|Codes], Acumulador, OptionsFinal) :-
    \+ existeCodeinCodes(Code, Codes),
    agregarOptionFinal(Option, Acumulador, AcumuladorOut),
    agregarSinRepetirOp(Options, Codes, AcumuladorOut, OptionsFinal).


agregarSinRepetirNewOp(Options, Codes, NewOption, OptionsFinal) :-
    getCodeOption(NewOption, NewCode),
    \+ existeCodeinCodes(NewCode, Codes),
    agregarOptionFinal(NewOption, Options, OptionsFinal).

agregarSinRepetirNewOp(Options, Codes, NewOption, OptionsFinal) :-
    getCodeOption(NewOption, NewCode),
    existeCodeinCodes(NewCode, Codes),
    OptionsFinal = Options.


mayuscula(Keyword, KeywordMayus) :-
    upcase_atom(Keyword, KeywordMayus).

allMayus([],[]).

allMayus([Keyword|Keywords], [KeywordMayus|KeywordsMayus]) :-
    mayuscula(Keyword, KeywordMayus),
    allMayus(Keywords, KeywordsMayus).
