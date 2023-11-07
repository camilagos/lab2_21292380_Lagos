user(Name, ChatHistory, [Name, ChatHistory]).

existeUserinUsers(NameUser, NamesUsers) :-
    member(NameUser, NamesUsers).

getNameUser(User, Name) :-
    User = [Name|_].

getNamesUser([], []).

getNamesUser([User|Users], [Name|Names]) :-
    getNameUser(User, Name),
    getNamesUser(Users, Names).

getChatHistoryUser(User, ChatHistory) :-
    User = [_, ChatHistory|_].

agregarNewUser(NewNameUser, Users, UsersFinal) :-
    getNamesUser(Users, Names),
    mayuscula(NewNameUser, NameUser),
    \+ existeUserinUsers(NameUser, Names),
    user(NameUser, [], NewUser),
    agregarUserFinal(NewUser, Users, UsersFinal).

agregarNewUser(NewNameUser, Users, UsersFinal) :-
    getNamesUser(Users, Names),
    mayuscula(NewNameUser, NameUser),
    existeUserinUsers(NameUser, Names),
    UsersFinal = Users.
