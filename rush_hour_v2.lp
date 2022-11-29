%%%%% clingo rush_hour.lp -c l=2 | grep -A1 Answer | tr ' ' '\n' 

tempo(1..l).
griglia(1..6,1..6).

car(r).
car(b).
% car(k).
% car(g).
% car(c).
% car(m).

posizione(r, x, 3).
posizione(r, y, 1, 2).
posizione(b, y, 3).
posizione(b, x, 2, 3).

iniziale(posizione(r, x, 3)).
iniziale(posizione(r, y, 1, 2)).
iniziale(posizione(b, y, 3)).
iniziale(posizione(b, x, 2, 3)).


finale(occupa(r,3,5)).
% finale(occupa(r,3,6)).

dir(x).
dir(y).


fluente(not_libero(X,Y)	) 		:- griglia(X,Y), posizione(P), fluente(occupa(C,P,Z)), car(C).
fluente(not_libero(X,Y)	) 		:- griglia(X,Y), posizione(P), fluente(occupa(C,P,Z1,Z2)), car(C).
fluente(libero(X,Y)		) 		:- griglia(X,Y), not fluente(not_libero(X,Y)), car(C).


test(occupa(C,P,X1,X2)) 		:- dir(P), car(C), iniziale(posizione(C,P,Y)), griglia(X1,Y), griglia(X2,Y), iniziale(posizione(C,P, X1, X2)).
fluente(occupa(C,x,X1,X2)) 		:- car(C), iniziale(posizione(C,y,Y)), griglia(X1,Y), griglia(X2,Y), iniziale(posizione(C,x, X1, X2)).
fluente(occupa(C,y,Y1,Y2)) 		:- car(C), iniziale(posizione(C,x,X)), griglia(X, Y1), griglia(X, Y2), iniziale(posizione(C,y, Y1, Y2)).
fluente(occupa(C,x,X1)) 		:- car(C), iniziale(posizione(C,y,Y1, Y2)), griglia(X1, Y1), griglia(X1, Y2), iniziale(posizione(C,x, X1)).
fluente(occupa(C,y,Y1)) 		:- car(C), iniziale(posizione(C,x,X1, X2)), griglia(X1, Y1), griglia(X2, Y1), iniziale(posizione(C,y, Y1)).










% fluente(occupa(C,X,Y)	) 		:- car(C), griglia(X,Y), iniziale(posizione(C,y,Y)).





% azione(move_sx(C, Y1+1, Y2+1)) :- car(C),
% 								  griglia(X,Y1), griglia(X,Y2),
% 								  posizione(C, x, X), posizione(C, y, Y1, Y2).

% azione(move_dx(C, Y1-1, Y2-1)) :- car(C), car(O),
% 								  griglia(X, Y1), griglia(X, Y2),
% 								  posizione(C, x, X), posizione(C, y, Y1, Y2).

% azione(move_up(C, X1-1, X2-1)) :- car(C), car(O),
% 								  griglia(X1, Y), griglia(X2, Y),
% 								  posizione(C, y, Y), posizione(C, x, X1, X2).

% azione(move_down(C, X1+1, X2+1)) :- car(C), car(O),
% 								    griglia(X1, Y), griglia(X2, Y),
% 								    posizione(C, y, Y), posizione(C, x, X1, X2).





% %test a cazzo
% exec(move_dx(C, Y1+1, Y2+1), libero(X, Y2+1)) :- car(C), car(O),
% 												 griglia(X, Y1), griglia(X, Y2),
% 												 griglia(X, Y1+1), griglia(X, Y2+1),
% 												 posizione(C, x, X), posizione(C, y, Y1, Y2),
% 												 fluente(libero(X, Y2+1)).

% % exec(move_sx(C, Y1-1, Y2-1), libero(X, Y1-1)) :- car(C), car(O),
% % 												 griglia(X, Y1), griglia(X, Y2),
% % 												 posizione(C, x, X), posizione(C, y, Y1, Y2),
% % 												 not fluente(occupa(O, X, Y1-1)), C!=O.

% % exec(move_up(C, X1-1, X2-1), libero(X1-1, Y)) :- car(C), car(O),
% % 												 griglia(X1, Y), griglia(X2, Y),
% % 												 posizione(C, y, Y), posizione(C, x, X1, X2),
% % 												 not fluente(occupa(O, X1-1, Y)), C!=O.

% % exec(move_down(C, X1+1, X2+1), libero(X1+1, Y)) :- car(C), car(O),
% % 												   griglia(X1, Y), griglia(X2, Y),
% % 												   posizione(C, y, Y), posizione(C, x, X1, X2),
% % 												   not fluente(occupa(O, X1+1, Y)), C!=O.



% % causa(move_right(C,X,Y+N), 	neg(libero(X,Y+N))	) 	:- car(C), griglia(X,Y+N), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

% % causa(move_left	(C,X,Y-N), 	neg(libero(X,Y-N))	) 	:- car(C), griglia(X,Y-N), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

% % causa(move_up	(C,X-N,Y), 	neg(libero(X-N,Y))	) 	:- car(C), griglia(X-N,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).

% % causa(move_down	(C,X+N,Y), 	neg(libero(X+N,Y))	) 	:- car(C), griglia(X+N,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).






% % not_goal(T) :- tempo(T), finale(F), not holds(F,T). 
% % goal(T) :- tempo(T), not not_goal(T).

% % goal(T) :- tempo(T), finale(F), holds(F,T).

% % :- not goal(l).


% % holds(F,0) :- iniziale(F).

% % holds(F,T+1) 	:- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).


% eseguibile(A,T) :- tempo(T), T < l, azione(A), exec(A,F), fluente(F).

% 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.



% % opposto(F,neg(F)) :- fluente(F).
% % opposto(neg(F),F) :- fluente(F).


% % not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 
% % eseguibile(A,T) 		:- tempo(T), T < l, not not_eseguibile(A,T), azione(A).
% % not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 
% %eseguibile(A,T) 		:- tempo(T), T < l, azione(A).


% % holds(F,T+1) 	:- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).
% % holds(F,T+1) 	:- T < l, occurs(A,T), causa(A,F).


% % % Inerzia
% % % holds(F,T+1) 	:- opposto(F,G), T < l, holds(F,T), not holds(G,T+1).



% % 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.
% % 1{ occurs(A,T) : azione(A) }1 :- tempo(T), T < l.

% % #hide tempo/1.
% % #hide griglia/2.
% % #hide fluente/1.





% % #show eseguibile/2.
% % #show fluente/1.
%  % #show azione/1.
%  % #show occurs/2.
%  % #show holds/2.
% % #show exec/2.
% % #show causa/2.
% % #show goal/1.





