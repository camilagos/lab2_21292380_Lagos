
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


eliminarOptionDuplicadas([], [], Acumulador, Acumulador).

eliminarOptionDuplicadas([Code|Codes], [Option|Options], Acumulador, OptionsFinal) :-
    \+ existeCodeinCodes(Code, Codes),
    eliminarOptionDuplicadas(Codes, Options, [Option|Acumulador], OptionsFinal).

eliminarOptionDuplicadas([Code|Codes], [_|Options], Acumulador, OptionsFinal) :-
    existeCodeinCodes(Code, Codes),
    eliminarOptionDuplicadas(Codes, Options, Acumulador, OptionsFinal).


mayuscula(Keyword, KeywordMayus) :-
    upcase_atom(Keyword, KeywordMayus).

allMayus([],[]).

allMayus([Keyword|Keywords], [KeywordMayus|KeywordsMayus]) :-
    mayuscula(Keyword, KeywordMayus),
    allMayus(Keywords, KeywordsMayus).
