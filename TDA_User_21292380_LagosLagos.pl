
%------------------CONSTRUCTOR--------------------

%user/3
%Descripción: Regla que construye a un usuario.
%Dom: Name (String) X ChatHistory (List) X User (List)
%Meta Primaria: user/3
%Meta Secundaria: No aplica.
user(Name, ChatHistory, [Name, ChatHistory]).

%------------------PERTENENCIA--------------------

%existeUserinUsers/2
%Descripción: Regla que verifica la existencia de un usuario en una
% lista de usuarios.
%Dom: NameUser (String) X NameUsers (List)
%Meta Primaria: existeUserinUsers/2
%Meta Secundaria: member/2
existeUserinUsers(NameUser, NamesUsers) :-
    member(NameUser, NamesUsers).

%noExisteUserLogueado/1
%Descripción: Regla que verifica si hay o no un usuario logueado.
%Dom: UserLogueado (String)
%Meta Primaria: noExisteUserLogueado/1
%Meta Secundaria: No aplica.
noExisteUserLogueado([]).

%------------------SELECTORES--------------------

%getNameUser/2
%Descripción: Regla que extrae el nombre de un usuario.
%Dom: User (List) X Name (String)
%Meta Primaria: getNameUser/2
%Meta Secundaria: No aplica.
getNameUser(User, Name) :-
    User = [Name|_].


%getNamesUser/2
%Descripción: Regla que extrae el nombre de cada usuario en una lista
% de usuarios.
%Dom: Users (List) X Names (List)
%Meta Primaria: getNamesUser/2
%Meta Secundaria: No aplica.
getNamesUser([], []). %Caso base

%Meta Secundaria: getNameUser/2, getNamesUser/2
getNamesUser([User|Users], [Name|Names]) :- %Caso recursivo
    getNameUser(User, Name),
    getNamesUser(Users, Names).


%getChatHistoryUser/2
%Descripción: Regla que extrae el historial de un usuario.
%Dom: Users (List) X ChatHistory (List)
%Meta Primaria: getChatHistoryUser/2
%Meta Secundaria: No aplica.
getChatHistoryUser(User, ChatHistory) :-
    User = [_, ChatHistory|_].

%-------------------MODIFICADORES--------------------

%agregarUserFinal/3
%Descripción: Regla que agrega un opción al final de una lista de
% opciones.
%Dom: NewUser (List) X Users (List) X UsersFinal (List)
%Meta Primaria: agregarUserFinal/3
%Meta Secundaria: No aplica.
agregarUserFinal(NewUser, [], [NewUser]). %Caso base

%Meta Secundaria: agregarUserFinal/3
agregarUserFinal(NewUser, [User|Users], [User|UsersFinal]) :- %Caso recursivo
    agregarUserFinal(NewUser, Users, UsersFinal).


%agregarNewUser/3
%Descripción: Regla que agrega un nuevo usuario a una lista, solo si no
% existe previamente.
%Dom: NewNameUser (String) X Users (List) X UsersFinal (List)
%Meta Primaria: agregarNewUser/3
% Meta Secundaria: getNamesUser/2, mayuscula/2, existeUserinUsers/2,
% user/3, agregarUserFinal/3
agregarNewUser(NewNameUser, Users, UsersFinal) :-
    getNamesUser(Users, Names),
    mayuscula(NewNameUser, NameUser),
    \+ existeUserinUsers(NameUser, Names),
    user(NameUser, [], NewUser),
    agregarUserFinal(NewUser, Users, UsersFinal).

%-------------------OTROS--------------------

%login/4
%Descripción: Regla que verifica si el usuario que quiere iniciar
% sesión se registro previamente y si no hay una sesión abierta
% previamente
%Dom: User (String) X NamesUsers (List) X UserLogueado (String) X
% UserLogueadoOut (String)
%Meta Primaria: login/4
% Meta Secundaria: existeUserinUsers/2, noExisteUserLogueado/1
login(User, NamesUsers, UserLogueado, UserLogueadoOut) :-
    existeUserinUsers(User, NamesUsers),
    noExisteUserLogueado(UserLogueado),
    UserLogueadoOut = User.


%logout/2
%Descripción: Regla que verifica que hay una sesión abierta y la cierra
%Dom: User (String) X [] (List)
%Meta Primaria: logout/2
%Meta Secundaria: No aplica
logout(User, []) :-
    User \== [].


%buscarUserinUsers/4
%Descripción: Regla recursiva que busca un usuario en una lista de
% usuarios.
%Dom: NameUser (String) X NameUsers (List) X Users (List) X Users (List)
%Meta Primaria: buscarUserinUsers/4
%Meta Secundaria: No aplica.
buscarUserinUsers(NameUser, [NameUser|_], [User|_], User). %Caso base

%Meta Secundaria: buscarUserinUsers/4
buscarUserinUsers(NameUser, [_|NameUsers], [_|Users], User) :- %Caso recursivo
    buscarUserinUsers(NameUser, NameUsers, Users, User).
