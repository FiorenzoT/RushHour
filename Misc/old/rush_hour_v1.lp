%%%%% clingo rush_hour.lp -c l=2 | grep -A1 Answer | tr ' ' '\n' 


%%%%%%%% AGGIUNTO IN INIZIALE(OCCUPA(...)) INDICE DEL BLOCCHETTO



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

% L'ultimo è l'indice del blocchetto
% location(occupa(r,3,1,0)).
% location(occupa(r,3,2,1)).

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
finale(occupa(r,3,6)).



fluente(not_libero(X,Y)	) 		:- griglia(X,Y), fluente(occupa(C,X,Y)), car(C).
fluente(libero(X,Y)		) 		:- griglia(X,Y), not fluente(not_libero(X,Y)), car(C).


fluente(occupa(C,X,Y)	) 		:- car(C), griglia(X,Y), verso(C,o), iniziale(occupa(C,X,Y)).
fluente(occupa(C,X,Y)	) 		:- car(C), griglia(X,Y), verso(C,v), iniziale(occupa(C,X,Y)).








% azione(move_right	(C,X,Y+1)) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I),
% 									griglia(X,Y), griglia(X,Y+1),
% 									fluente(occupa(C,X,Y)), fluente(libero(X,Y+I+1)), not fluente(occupa(O,X,Y+I+1)).

% azione(move_left	(C,X,Y-1)) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I), dim(C,N),
% 									griglia(X,Y), griglia(X,Y-1),
% 									fluente(occupa(C,X,Y)), fluente(libero(X,Y+I-N)), not fluente(occupa(O,X,Y+I-N)).

% azione(move_up		(C,X-1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
% 									griglia(X,Y), griglia(X-1,Y),
% 									fluente(occupa(C,X,Y)), fluente(libero(X+I-N,Y)), not fluente(occupa(O,X+I-N,Y)).

% azione(move_down	(C,X+1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
% 									griglia(X,Y), griglia(X+1,Y),
% 									fluente(occupa(C,X,Y)), fluente(libero(X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)).





azione(C, move_right	(X,Y+1), I) 	:- 	car(C), car(O), verso(C,o), C!=O, location(occupa(C,X,Y,I)),
										griglia(X,Y), griglia(X,Y+1), fluente(occupa(C,X,_)).
									%fluente(occupa(C,X,Y)), fluente(libero(X,Y+I+1)), not fluente(occupa(O,X,Y+I+1)).

azione(C, move_left	(X,Y-1)) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I), dim(C,N),
									griglia(X,Y), griglia(X,Y-1),
									fluente(occupa(C,X,Y)), fluente(libero(X,Y+I-N)), not fluente(occupa(O,X,Y+I-N)).

azione(C, move_up		(X-1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
									griglia(X,Y), griglia(X-1,Y),
									fluente(occupa(C,X,Y)), fluente(libero(X+I-N,Y)), not fluente(occupa(O,X+I-N,Y)).

azione(C, move_down	(X+1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
									griglia(X,Y), griglia(X+1,Y),
									fluente(occupa(C,X,Y)), fluente(libero(X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)).






exec(move_right	(C,X,Y+1), 	libero(X,Y+1)) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I), dim(C,N),
												griglia(X,Y), griglia(X,Y+1),
												fluente(occupa(C,X,Y)), fluente(libero(X,Y+I+1)), not fluente(occupa(O,X,Y+I+1)).

exec(move_left	(C,X,Y-1), 	libero(X,Y-1)) 	:- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I), dim(C,N),
												griglia(X,Y), griglia(X,Y-1),
												fluente(occupa(C,X,Y)), fluente(libero(X,Y+I-N)), not fluente(occupa(O,X,Y+I-N)).

exec(move_up	(C,X-1,Y), 	libero(X-1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
												griglia(X,Y), griglia(X-1,Y),
												fluente(occupa(C,X,Y)), fluente(libero(X+I-N,Y)), not fluente(occupa(O,X+I-N,Y)).

exec(move_down	(C,X+1,Y), 	libero(X+1,Y)) 	:- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I), dim(C,N),
												griglia(X,Y), griglia(X+1,Y),
												fluente(occupa(C,X,Y)), fluente(libero(X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)).




causa(move_right(C,X,Y+1), 	neg(libero(X,Y+1))	) :- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I),
														griglia(X,Y), griglia(X,Y+1),
														fluente(occupa(C,X,Y)), not fluente(occupa(C,X,Y+I+1)), not fluente(occupa(O,X,Y+I+1)).

causa(move_left	(C,X,Y-1), 	neg(libero(X,Y-1))	) :- 	car(C), car(O), verso(C,o), C!=O, indice(C,X,Y,I),
														griglia(X,Y), griglia(X,Y-1),
														fluente(occupa(C,X,Y)), not fluente(occupa(C,X,Y+I-1)), not fluente(occupa(O,X,Y+I-1)).

causa(move_up	(C,X-1,Y), 	neg(libero(X-1,Y))	) :- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I),
														griglia(X,Y), griglia(X-1,Y),
														not fluente(occupa(C,X+I-1,Y)), not fluente(occupa(O,X+I-1,Y)), not fluente(occupa(O,X+I-1,Y)).
													
causa(move_down	(C,X+1,Y), 	neg(libero(X+1,Y))	) :- 	car(C), car(O), verso(C,v), C!=O, indice(C,X,Y,I),
														griglia(X,Y), griglia(X+1,Y),
														not fluente(occupa(C,X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)), not fluente(occupa(O,X+I+1,Y)).






not_goal(T) :- tempo(T), finale(F), not holds(F,T). 
goal(T) :- tempo(T), not not_goal(T).

% goal(T) :- tempo(T), finale(F), holds(F,T).

% :- not goal(l).


%eseguibile(C, move_right(X,Y), move_right(X1,Y1),T) :- tempo(T), T < l, car(C), .

%eseguibile(A,A1,T) 		:- tempo(T), T < l, azione(C,A), azione(C,A1), A!=A1, car(C), not not_eseguibile(A,A1,T).
%not_eseguibile(A,A1,T) 	:- tempo(T), exec(A,F), not holds(F,T), fluente(F), azione(C,A), azione(C,A1), car(C). 

%eseguibile(azione(move_right(C,X,Y)),T) :- car(C), griglia(X,Y), tempo(T), T < l.



% holds(F,0) 	:- iniziale(F).
% holds(F,T+1) :- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).



% possibilita(C,scelta(move_right(X,Y), move_right(X1,Y1))) 	:- 	dim(C,2), Y<Y1,
% 																azione(C, move_right(X,Y)),
% 																azione(C, move_right(X1,Y1)).


% % possibilita(C,scelta(MOV,MOV1)) 		:- 	azione(C,MOV), azione(C,MOV1), MOV!=MOV1, dim(C,2).
% % possibilita(C,scelta(MOV,MOV1,MOV2)) 	:- 	azione(C,MOV), azione(C,MOV1), azione(C,MOV2), MOV!=MOV1, MOV!=MOV2, MOV1!=MOV2, dim(C,3).

% 1{ occurs(C,A,T) : possibilita(C,A), car(C) }1 :- tempo(T), T < l.

		% mossa(move_right(C,X,Y),C) 	:- azione(move_right(C,X,Y)).%, fluente(occupa(C,X,Y)), griglia(X,Y).
		% mossa(move_left(C,X,Y),C) 	:- azione(move_left(C,X,Y)).
		% mossa(move_up(C,X,Y),C) 	:- azione(move_up(C,X,Y)).
		% mossa(move_down(C,X,Y),C) 	:- azione(move_down(C,X,Y)).


		% 1{ possibilita(scelta(A,A1)) 		: 	mossa(A,C), mossa(A1,C), 				A!=A1, dim(C,2) }1.
		% 1{ possibilita(scelta(A,A1,A2)) 	: 	mossa(A,C), mossa(A1,C), mossa(A2,C), 	A!=A1, A!=A2, A1!=A2, dim(C,3) }1.

		% 1{ occurs(A,T) : possibilita(A) }1 :- tempo(T), T < l.

%3{ occurs(A,T) : mossa(A,C), azione(A), car(C), dim(C,3) }3 :- tempo(T), T < l.



%N{ test(C) : car(C) }N :- dim(C,N).

% 1 {azione(move_right(C,X,Y+N)	)	: car(C), griglia(X,Y+N), griglia(X,Y), fluente(occupa(C,X,Y)), verso(C,o)}1 :- dim(C,N).

% 1 {azione(move_right(C,X,Y-N)	)	: car(C), griglia(X,Y-N), griglia(X,Y), fluente(occupa(C,X,Y)), verso(C,o)}1 :- dim(C,N).






% eseguibile(A,T) :- tempo(T), T < l, azione(A), exec(A,F), fluente(F).

% 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.



% opposto(F,neg(F)) :- fluente(F).
% opposto(neg(F),F) :- fluente(F).


% not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 
% eseguibile(A,T) 		:- tempo(T), T < l, not not_eseguibile(A,T), azione(A).
% not_eseguibile(A,T) 	:- tempo(T), exec(A,F), not holds(F,T). 


% holds(F,T+1) 	:- T < l, eseguibile(A,T), occurs(A,T), causa(A,F).
% holds(F,T+1) 	:- T < l, occurs(A,T), causa(A,F).


% % Inerzia
% % holds(F,T+1) 	:- opposto(F,G), T < l, holds(F,T), not holds(G,T+1).



% 1{ occurs(A,T) : azione(A), eseguibile(A,T) }1 :- tempo(T), T < l.
% 1{ occurs(A,T) : azione(A) }1 :- tempo(T), T < l.





% #show eseguibile/2.
% #show fluente/1.
% #show azione/1.
% #show occurs/2.
% #show holds/2.
% #show exec/2.
% #show causa/2.
% #show goal/1.





