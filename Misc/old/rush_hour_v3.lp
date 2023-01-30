tempo(1..l).
griglia(1..6,1..6).

car(r).
% car(b).
% car(k).
% car(g).
% car(c).
% car(m).



position(r,3,5,0).
position(r,3,6,1).

% position(b,4,1,0).
% position(b,4,2,1).

% indice(C,X,Y,I) :- fluente(occupa(C,X,Y,I)).

initial(position(r,3,5,0)).
initial(position(r,3,6,1)).

% iniziale(occupa(b,3,4)).
% iniziale(occupa(b,4,4)).
% iniziale(occupa(b,2,4)).

% iniziale(occupa(k,5,2)).
% iniziale(occupa(k,5,3)).
% iniziale(occupa(k,5,4)).

% iniziale(occupa(g,6,1)).
% iniziale(occupa(g,6,2)).
% iniziale(occupa(g,6,3)).

% iniziale(occupa(c,3,6)).
% iniziale(occupa(c,4,6)).

% iniziale(occupa(m,4,3)).
% iniziale(occupa(m,3,3)).


% Calcola la dimensione di ciascuna auto
dim(C,N) :- car(C), N = #count{ X,Y : position(C,X,Y,I) }.

possible_positions(C,X,Y,I) :- griglia(X,Y), position(C,X,_,I), position(C,X,_,I), orientation(C,h).
possible_positions(C,X,Y,I) :- griglia(X,Y), position(C,_,Y,I), position(C,_,Y,I), orientation(C,v).


orientation(C,h) :- position(C,X,Y,I), position(C,X,Y1,I1), Y!=Y1, I!=I1.
orientation(C,v) :- position(C,X,Y,I), position(C,X1,Y,I1), X!=X1, I!=I1.


final(position(r,3,5,0)).
final(position(r,3,6,1)).


not_free(X,Y) 	:- position(_,X,Y,_).
free(X,Y)		:- griglia(X,Y), not not_free(X,Y).


fluent(possible_positions(C,X,Y,I)) :- possible_positions(C,X,Y,I).
fluent(not_free(X,Y)) :- not_free(X,Y).
fluent(free(X,Y)) :- free(X,Y).



action(move_right(C,X,Y+1,I)) :- possible_positions(C,X,Y,I), possible_positions(C,X,Y+1,I), orientation(C,h).


exec(move_right(C,X,Y+1,I), free(X,Y+1)) 	:- 	possible_positions(C,X,Y,I), free(X,Y+1), orientation(C,h).


cause(MOV, neg(free(X,Y))) 	:- 	exec(MOV,free(X,Y)), fluent(free(X,Y)), orientation(C,h).



holds(F,0) :- initial(F).

eseguibile(A,T) :- time(T), exec(A,F), T<l.



