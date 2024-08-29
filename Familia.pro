% Pedro e Antonia e seus filhos
progenitor(pedro,joao).
progenitor(pedro,ana).
progenitor(pedro,clara).
progenitor(pedro,francisco).

progenitor(antonia,joao).
progenitor(antonia,ana).
progenitor(antonia,clara).
progenitor(antonia,francisco).

% Filhas de Ana
progenitor(ana,helena).
progenitor(ana,joana).

% Filho de João
progenitor(joao,mario).

% Filho de Helena com Mario
progenitor(helena,carlos).
progenitor(mario,carlos).

% Filhos de Clara
progenitor(clara,pietro).
progenitor(clara,enzo).

% Definindo sexo feminino
sexo(antonia,feminino).
sexo(clara,feminino).
sexo(ana,feminino).
sexo(helena,feminino).
sexo(joana,feminino).
sexo(milene, feminino).
sexo(francisca, feminino).

% Definindo sexo masculino
sexo(mario,masculino).
sexo(pedro,masculino).
sexo(joao,masculino).
sexo(pietro, masculino).
sexo(enzo, masculino).
sexo(francisco, masculino).
sexo(carlos, masculino).

% Busca os irmãos
irmaos(X, Y) :-
    progenitor(A, X),
    progenitor(A, Y),
    X \= Y.

% Busca irmã
irma(X,Y):-
    irmaos(X, Y), 
    sexo(X, feminino).

% Busca irmão
irmao(X,Y):-
    irmaos(X, Y),
    sexo(X, masculino).

% Busca o descendente
descendente(X,Y):-
    progenitor(Y,X).
descendente(X,Y):-
    progenitor(Y,A),
    descendente(X,A).

% Busca o Avô
avô(X,Y):-
    progenitor(X,A),
    progenitor(A,Y),
    sexo(X,masculino).

% Busca avó
avó(X,Y):-
    progenitor(X,A),
    progenitor(A,Y),
    sexo(X,feminino).

% Busca o tio
tio(X,Y):-
    progenitor(A,Y), 
    irmao(X,A).

% Busca a tia
tia(X,Y):-
    progenitor(A,Y),
    irma(X,A).

% Busca o primo
primo(X, Y) :- 
    progenitor(A, X), 
    (irmao(A, B) ; irma(A, B)), 
    progenitor(B, Y), 
    sexo(X, masculino).


% Busca a prima
prima(X, Y) :- 
    progenitor(A, X), 
    (irmao(A, B) ; irma(A, B)), 
    progenitor(B, Y), 
    sexo(X, feminino).

% Busca o ascendente
ascendente(X,Y):-
    progenitor(X,Y).
ascendente(X,Y):-
    progenitor(X,A),
    ascendente(A,Y).