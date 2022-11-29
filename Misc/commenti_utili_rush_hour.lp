%%%%% clingo rush_hour.lp -c l=2 | grep -A1 Answer | tr ' ' '\n' 
%%%%% -c l=2 è usato per settare la variabile l a 2. Utile per il tempo

% Quando tutto è insoddisfacibile, è colpa di un vincolo

tempo(1..l).
griglia(1..6,1..6).

car(r).
%car(k).
%car(b).
%car(g).
%car(c).
%car(m).

% Posizionamento come matrice: riga, colonna

iniziale(occupa(r,3,1)).
iniziale(occupa(r,3,2)).
%iniziale(occupa(b,4,1)).
%iniziale(occupa(b,5,1)).
%iniziale(occupa(k,5,2)).
%iniziale(occupa(k,5,3)).
%iniziale(occupa(g,6,1)).
%iniziale(occupa(g,6,3)).
%iniziale(occupa(c,3,6)).
%iniziale(occupa(c,4,6)).
%iniziale(occupa(m,4,4)).
%iniziale(occupa(m,5,4)).


finale(occupa(r,3,5)).



fluente(libero(X,Y)) 		:- griglia(X,Y).
fluente(occupa(C,X,Y)) 		:- car(C), griglia(X,Y).


azione(move_right(C,X,Y))	:- car(C), griglia(X,Y).
azione(move_left(C,X,Y))	:- car(C), griglia(X,Y).
azione(move_up(C,X,Y)) 		:- car(C), griglia(X,Y).
azione(move_down(C,X,Y)) 	:- car(C), griglia(X,Y).


exec(move_right(C,X,Y), libero(X,Y))	:- car(C), griglia(X,Y).
exec(move_left(C,X,Y), libero(X,Y)) 	:- car(C), griglia(X,Y).
exec(move_up(C,X,Y), libero(X,Y)) 		:- car(C), griglia(X,Y).
exec(move_down(C,X,Y), libero(X,Y)) 	:- car(C), griglia(X,Y).


causa(move_right(C,X,Y), neg(libero(X,Y))) 	:- car(C), griglia(X,Y).
causa(move_left(C,X,Y), neg(libero(X,Y))) 	:- car(C), griglia(X,Y).
causa(move_up(C,X,Y), neg(libero(X,Y))) 	:- car(C), griglia(X,Y).
causa(move_down(C,X,Y), neg(libero(X,Y))) 	:- car(C), griglia(X,Y).




% goal(T) :- finale(F), holds(F,T). % Questo conclude quando un goal è soddisfatto, non quando tutti 
									% sono soddisfatti quindi non è corretto. Serve la proprietà not_goal
									% per questo.

not_goal(T) :- tempo(T), finale(F), not holds(F,T). 
goal(T) :- tempo(T), not not_goal(T).

:- not goal(l).


holds(F,1) :- iniziale(F).
% 0{ holds(F,1) }1 :- not iniziale(F,1), fluente(F). % Se non sappiamo alcuni fluenti iniziali.


opposto(F,neg(F)) :- fluente(F).
opposto(neg(F),F) :- fluente(F).


not_eseguibile(A,T) :- tempo(T), exec(A,F), not holds(F,T). 
eseguibile(A,T) :- tempo(T), T < l, not not_eseguibile(A,T), azione(A).


holds(F,T+1) :- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).

holds(F,T+1) :- opposto(F,G), T < l, holds(F,T), not holds(G,T+1).



1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.

%occurs(A,T) :- azione(A), tempo(T), not 2(T), not not_occurs(A,T). 
%not_occurs(A,T) :- azione(A), azione(B), tempo(T), occurs(B,T), A!=B. 
%:- azione(A), tempo(T), occurs(A,T), not eseguibile(A,T).







