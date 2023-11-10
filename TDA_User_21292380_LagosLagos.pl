user(Name, ChatHistory, [Name, ChatHistory]).

%------------------PERTENENCIA--------------------

existeUserinUsers(NameUser, NamesUsers) :-
    member(NameUser, NamesUsers).

%------------------SELECTORES--------------------

getNameUser(User, Name) :-
    User = [Name|_].

getNamesUser([], []).

getNamesUser([User|Users], [Name|Names]) :-
    getNameUser(User, Name),
    getNamesUser(Users, Names).

getChatHistoryUser(User, ChatHistory) :-
    User = [_, ChatHistory|_].

%-------------------MODIFICADORES--------------------

agregarUserFinal(NewUser, [], [NewUser]).

agregarUserFinal(NewUser, [User|Users], [User|UsersFinal]) :-
    agregarUserFinal(NewUser, Users, UsersFinal).

agregarNewUser(NewNameUser, Users, UsersFinal) :-
    getNamesUser(Users, Names),
    mayuscula(NewNameUser, NameUser),
    \+ existeUserinUsers(NameUser, Names),
    user(NameUser, [], NewUser),
    agregarUserFinal(NewUser, Users, UsersFinal).

%-------------------OTROS--------------------

noExisteUserLogueado([]).


login(User, NamesUsers, UserLogueado, UserLogueadoOut) :-
    existeUserinUsers(User, NamesUsers),
    noExisteUserLogueado(UserLogueado),
    UserLogueadoOut = User.


logout(User, []) :-
    User \== [].
