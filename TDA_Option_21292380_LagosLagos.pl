
%------------------SELECTORES--------------------

getCodeOption(Option, Code):-
    option(Code,_,_,_,_, Option).

getCodesOption([], []).

getCodesOption([Option|Options], [Code|Codes]):-
    getCodeOption(Option, Code),
    getCodesOption(Options, Codes).


eliminarOptionDuplicadas([], [], Acumulador, Acumulador).

eliminarOptionDuplicadas([Code|Codes], [Option|Options], Acumulador, OptionsFinal):-
    \+ member(Code, Codes),
    eliminarOptionDuplicadas(Codes, Options, [Option|Acumulador], OptionsFinal).

eliminarOptionDuplicadas([Code|Codes], [_|Options], Acumulador, OptionsFinal):-
    member(Code, Codes),
    eliminarOptionDuplicadas(Codes, Options, Acumulador, OptionsFinal).
