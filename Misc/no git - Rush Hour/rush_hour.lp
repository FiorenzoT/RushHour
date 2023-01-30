%%%%% clingo rush_hour.lp -c l=2 | grep -A1 Answer | tr ' ' '\n' 

tempo(1..l).
griglia(1..6,1..6).
numero(-2..2).

car(r).
car(b).
car(k).
car(g).
car(c).
car(m).



% Posizionamento come matrice: riga, colonna

% ATTENZIONE: 	inserire le posizioni iniziali in ordine, 
% 				sia per la macchina che per le coordinate (X,Y)!

iniziale(occupa(r,3,1)).
iniziale(occupa(r,3,2)).

iniziale(occupa(b,3,4)).
iniziale(occupa(b,4,4)).
iniziale(occupa(b,2,4)).

iniziale(occupa(k,5,2)).
iniziale(occupa(k,5,3)).
iniziale(occupa(k,5,4)).

iniziale(occupa(g,6,1)).
iniziale(occupa(g,6,2)).
iniziale(occupa(g,6,3)).

iniziale(occupa(c,3,6)).
iniziale(occupa(c,4,6)).

iniziale(occupa(m,4,3)).
iniziale(occupa(m,3,3)).


% Calcola la dimensione di ciascuna auto
dim(C,N) :- car(C), N = #count{ X,Y : iniziale(occupa(C,X,Y)) }.



% Calcola l'indice al quale, sommata la posizione X,Y del blocco + 1, 
% trovo un oggetto che non sia quello preso in considerazione.
% Utilizzato per la move.
indice(C,X,Y,I) :-	car(C), verso(C,o), numero(I),
					griglia(X,Y), griglia(X,Y1), Y!=Y1,
					fluente(occupa(C,X,Y)), fluente(occupa(C,X,Y1)),
					Y>Y1, I=0.

indice(C,X,Y,I) :- 	car(C), verso(C,o), numero(I),
					griglia(X,Y), griglia(X,Y1), Y!=Y1,
					fluente(occupa(C,X,Y)), fluente(occupa(C,X,Y1)),
					Y<Y1, I=Y1-Y.

% Ad esempio con b in (3,3),(4,3), questo calcola:
% 	indice(b,3,3,1)
% ovvero, l'indice più piccolo e di quanto dista da quello più grande(da aggiungere)
indice(C,X,Y,I) :-	car(C), verso(C,v), numero(I),
					griglia(X,Y), griglia(X1,Y), X!=X1,
					fluente(occupa(C,X,Y)), fluente(occupa(C,X1,Y)),
					X>X1, I=0.

indice(C,X,Y,I) :- 	car(C), verso(C,v), numero(I),
					griglia(X,Y), griglia(X1,Y), X!=X1,
					fluente(occupa(C,X,Y)), fluente(occupa(C,X1,Y)),
					X<X1, I=X1-X.





verso(C,o) :- car(C), iniziale(occupa(C,X,Y)), griglia(X,Y), iniziale(occupa(C,X,Y1)), Y!=Y1.
verso(C,v) :- car(C), iniziale(occupa(C,X,Y)), griglia(X,Y), iniziale(occupa(C,X1,Y)), X!=X1.


finale(occupa(r,3,5)).
% finale(occupa(r,3,6)).



fluente(not_libero(X,Y)	) 		:- griglia(X,Y), fluente(occupa(C,X,Y)), car(C).
fluente(libero(X,Y)		) 		:- griglia(X,Y), not fluente(not_libero(X,Y)), car(C).


fluente(occupa(C,X,Y)	) 		:- car(C), griglia(X,Y), verso(C,o), iniziale(occupa(C,X,Y)).
fluente(occupa(C,X,Y)	) 		:- car(C), griglia(X,Y), verso(C,v), iniziale(occupa(C,X,Y)).

% azione(move_right	(C,X,Y)	)	:- car(C), griglia(X,Y).
% azione(move_left	(C,X,Y)	)	:- car(C), griglia(X,Y).
% azione(move_up		(C,X,Y)	) 	:- car(C), griglia(X,Y).
% azione(move_down	(C,X,Y)	) 	:- car(C), griglia(X,Y).

%1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.

%N{ test(C) : car(C) }N :- dim(C,N).

% 1 {azione(move_right(C,X,Y+N)	)	: car(C), griglia(X,Y+N), griglia(X,Y), fluente(occupa(C,X,Y)), verso(C,o)}1 :- dim(C,N).

% 1 {azione(move_right(C,X,Y-N)	)	: car(C), griglia(X,Y-N), griglia(X,Y), fluente(occupa(C,X,Y)), verso(C,o)}1 :- dim(C,N).














% azione(move_right(C,X,Y+1)	)	:- car(C), griglia(X,Y+1), griglia(X,Y), griglia(X,Z), griglia(X,Z+1), fluente(occupa(C,X,Z)), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o), Y != Z.
% % azione(move_right(C,X,Y+1)	)	:- car(C), griglia(X,Y+1), griglia(X,Y), griglia(X,Z), griglia(X,Z+1), fluente(occupa(C,X,Z)), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

% % azione(move_right(C, X1, Y1+1, X2, Y2+1)) :- car(C), griglia(X1, Y1+1), griglia(X2, Y2+1), 

% azione(move_left(C,X,Y-1)	)	:- car(C), griglia(X,Y-1), griglia(X,Y), griglia(X,Z), griglia(X,Z-1), fluente(occupa(C,X,Z)), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o), Y != Z.

% azione(move_up(C,X-1,Y)		)	:- car(C), griglia(X-1,Y), griglia(X,Y), griglia(X,Z), griglia(Z-1,Y), fluente(occupa(C,Z,Y)), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v), X != Z.

% azione(move_down(C,X+1,Y)	)	:- car(C), griglia(X+1,Y), griglia(X,Y), griglia(X,Z), griglia(Z+1,Y), fluente(occupa(C,Z,Y)), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v), X != Z.




%azione(move_left (C,X,Y-1)	)	:- car(C), griglia(X,Y-1), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

%azione(move_up	 (C,X-1,Y)	) 	:- car(C), griglia(X-1,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).

%azione(move_down (C,X+1,Y)	) 	:- car(C), griglia(X+1,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).





%exec(move_right	(C,X,Y+1), 	libero(X,Y+1)	) 	:- car(C), car(O), griglia(X,Y+1), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), not fluente(occupa(O,X,Y+1)), verso(C,o), C!=O,
%													griglia(X,Z), griglia(X,Z+1), fluente(occupa(C,X,Z)), Z=Y+1, not fluente(occupa(O,X,Z+1)).
%car(r).




exec(move_right	(C,X,Y+1), 	libero(X,Y+1)	) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I),
													griglia(X,Y), griglia(X,Y+1),
													fluente(occupa(C,X,Y)), fluente(libero(X,Y+I+1)), not fluente(occupa(O,X,Y+I+1)).

exec(move_left	(C,X,Y-1), 	libero(X,Y-1)	) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I), dim(C,N),
													griglia(X,Y), griglia(X,Y-1),
													fluente(occupa(C,X,Y)), fluente(libero(X,Y+I-N)), not fluente(occupa(O,X,Y+I-N)).

exec(move_up	(C,X-1,Y), 	libero(X-1,Y)	) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
													griglia(X,Y), griglia(X-1,Y),
													fluente(occupa(C,X,Y)), fluente(libero(X+I-N,Y)), not fluente(occupa(O,X+I-N,Y)).

exec(move_down	(C,X+1,Y), 	libero(X+1,Y)	) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
													griglia(X,Y), griglia(X+1,Y),
													fluente(occupa(C,X,Y)), fluente(libero(X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)).

% exec(move_left	(C,X,Y-1), 	libero(X,Y-1)	) 	:- car(C), car(O), griglia(X,Y-1), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), fluente(occupa(O,X,Y-1)), verso(C,o), C!=O.

% exec(move_up	(C,X-1,Y), 	libero(X-1,Y)	) 	:- car(C), car(O), griglia(X-1,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), fluente(occupa(O,X-1,Y)), verso(C,v), C!=O.

% exec(move_down	(C,X+1,Y), 	libero(X+1,Y)	) 	:- car(C), car(O), griglia(X+1,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), fluente(occupa(O,X+1,Y)), verso(C,v), C!=O.

% exec(move_right	(C,X,Y), 	libero(X,Y)	)	:- car(C), griglia(X,Y). %, occupa(C,X,Y).
% exec(move_left	(C,X,Y), 	libero(X,Y)	) 	:- car(C), griglia(X,Y).
% exec(move_up	(C,X,Y), 	libero(X,Y)	) 	:- car(C), griglia(X,Y).
% exec(move_down	(C,X,Y), 	libero(X,Y)	) 	:- car(C), griglia(X,Y).





% causa(move_right(C,X,Y+N), 	neg(libero(X,Y+N))	) 	:- car(C), griglia(X,Y+N), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

% causa(move_left	(C,X,Y-N), 	neg(libero(X,Y-N))	) 	:- car(C), griglia(X,Y-N), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,o).

% causa(move_up	(C,X-N,Y), 	neg(libero(X-N,Y))	) 	:- car(C), griglia(X-N,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).

% causa(move_down	(C,X+N,Y), 	neg(libero(X+N,Y))	) 	:- car(C), griglia(X+N,Y), griglia(X,Y), dim(C,N), fluente(occupa(C,X,Y)), verso(C,v).



% causa(move_right(C,X,Y+N), 	neg(libero(X,Y+N))	) :- car(C), griglia(X,Y+N), griglia(X,Y), dim(C,N), verso(C,o),
% 													iniziale(occupa(C,X1,Y)), X=X1.

% causa(move_left	(C,X,Y-N), 	neg(libero(X,Y-N))	) 	:- car(C), griglia(X,Y-N), griglia(X,Y), dim(C,N), verso(C,o),
% 													iniziale(occupa(C,X1,Y)), X=X1.

% causa(move_up	(C,X-N,Y), 	neg(libero(X-N,Y))	) 	:- car(C), griglia(X-N,Y), griglia(X,Y), dim(C,N), verso(C,v),
% 													iniziale(occupa(C,X,Y1)), Y=Y1.
													
% causa(move_down	(C,X+N,Y), 	neg(libero(X+N,Y))	) 	:- car(C), griglia(X+N,Y), griglia(X,Y), dim(C,N), verso(C,v),
% 													iniziale(occupa(C,X,Y1)), Y=Y1.


%%%% fluente(occupa(C,X,Y)).



% causa(move_right(C,X,Y), 	neg(libero(X,Y))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_left	(C,X,Y), 	neg(libero(X,Y))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_up	(C,X,Y), 	neg(libero(X,Y))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_down	(C,X,Y), 	neg(libero(X,Y))	)	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).

% causa(move_right(C,X,Y), 	neg(libero(X,Y+1))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_left	(C,X,Y), 	neg(libero(X,Y-1))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_up	(C,X,Y), 	neg(libero(X-1,Y))	) 	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).
% causa(move_down	(C,X,Y), 	neg(libero(X+1,Y))	)	:- car(C), griglia(X,Y), fluente(occupa(C,X,Y)).




% not_goal(T) :- tempo(T), finale(F), not holds(F,T). 
% goal(T) :- tempo(T), not not_goal(T).

% goal(T) :- tempo(T), finale(F), holds(F,T).

% :- not goal(l).


% holds(F,0) :- iniziale(F).

% holds(F,T+1) 	:- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).


% eseguibile(A,T) :- tempo(T), T < l, azione(A), exec(A,F), fluente(F).

% 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.



% opposto(F,neg(F)) :- fluente(F).
% opposto(neg(F),F) :- fluente(F).


% not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 
% eseguibile(A,T) 		:- tempo(T), T < l, not not_eseguibile(A,T), azione(A).
% not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 
%eseguibile(A,T) 		:- tempo(T), T < l, azione(A).


% holds(F,T+1) 	:- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).
% holds(F,T+1) 	:- T < l, occurs(A,T), causa(A,F).


% % Inerzia
% % holds(F,T+1) 	:- opposto(F,G), T < l, holds(F,T), not holds(G,T+1).



% 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.
% 1{ occurs(A,T) : azione(A) }1 :- tempo(T), T < l.

% #hide tempo/1.
% #hide griglia/2.
% #hide fluente/1.





% #show eseguibile/2.
% #show fluente/1.
 % #show azione/1.
 % #show occurs/2.
 % #show holds/2.
% #show exec/2.
% #show causa/2.
% #show goal/1.





