%#program base.
time(0..l).

grid(1..6,1..6).

moveTo(right; left; up; down).

orientation(h;v).

cars(r;b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12).

dim(2;3).




%#program step(l).
%%%%%% Posizioni occupate dalle auto e posizioni libere

busy(T, C, X, Y..Y+N-1) :- time(T), T<l, 
                           position(T, C, X, Y), car(C, N, h), cars(C), dim(N).

busy(T, C, X..X+N-1, Y) :- time(T), T<l, 
                           position(T, C, X, Y), car(C, N, v), cars(C), dim(N).

not_free(T,X,Y) 		:- time(T), T<l, 
                           grid(X,Y), car(C,N,O), busy(T,C,X,Y), cars(C), dim(N), orientation(O).

free(T, X, Y) 			:- time(T), T<l, 
                           grid(X,Y), car(C,N,O), cars(C), dim(N), orientation(O), 
                           not not_free(T,X,Y).



%%%%%% Mosse eseguibili al tempo T

executable(T, C, right, X, Y+1) :- time(T), grid(X,Y+N),%grid(X,Y+N),
                                   car(C, N, h), free(T, X, Y+N), cars(C), dim(N),
                                   position(T, C, X, Y).

executable(T, C, left,  X, Y-1) :- time(T), grid(X,Y-1), 
                                   car(C, N, h), free(T, X, Y-1), cars(C), dim(N),
                                   position(T, C, X, Y).

executable(T, C, up, 	X-1, Y) :- time(T), grid(X-1,Y), 
                                   car(C, N, v), free(T, X-1, Y), cars(C), dim(N),
                                   position(T, C, X, Y).

executable(T, C, down, 	X+1, Y) :- time(T), grid(X+N,Y), %grid(X+N,Y),  
                                   car(C, N, v), free(T, X+N, Y), cars(C), dim(N),
                                   position(T, C, X, Y).



%%%%%% Scelta di una tra le mosse eseguibili

1{move(T, C, MOV) : car(C,N,O), executable(T,C,MOV,X,Y), dim(N), orientation(O), moveTo(MOV)}1 :- time(T), T<l.



%%%%%% Aggiornamento posizioni

position(T,C,X,Y) :- time(T), time(T-1), T<l, 
                     position(T-1,C,X,Y), car(C,N,O), dim(N), orientation(O), 
                     not move(T-1, C, right), not move(T-1, C, left), not move(T-1, C, up), not move(T-1, C, down).

% Inserendo solo le 4 regole di sotto, non era possibile tenere traccia degli oggetti che non si spostavano. 
% Per questo è necessario inserire la regola di sopra.
% Attenzione: nel corpo della regola, le X e le Y sono relative al tempo precedente! Se ci si è spostati a destra, si era in Y-1

position(T,C,X,Y) :- moveTo(right), time(T), time(T-1), T<=l, 
                     grid(X,Y-1), position(T-1,C,X,Y-1), car(C,N,h), dim(N),
                     move(T-1,C,right), not move(T-1, C, left), not move(T-1, C, up), not move(T-1, C, down).

position(T,C,X,Y) :- moveTo(left), time(T), time(T-1), T<l, 
                     grid(X,Y+1), position(T-1,C,X,Y+1), car(C,N,h), dim(N),
                     move(T-1,C,left), not move(T-1, C, right), not move(T-1, C, up), not move(T-1, C, down).

position(T,C,X,Y) :- moveTo(up), time(T), time(T-1), T<l, 
                     grid(X+1,Y), position(T-1,C,X+1,Y), car(C,N,v), dim(N),
                     move(T-1,C,up), not move(T-1, C, down), not move(T-1, C, left), not move(T-1, C, right).

position(T,C,X,Y) :- moveTo(down), time(T), time(T-1), T<l, 
                     grid(X-1,Y), position(T-1,C,X-1,Y), car(C,N,v), dim(N),
                     move(T-1,C,down), not move(T-1, C, up), not move(T-1, C, left), not move(T-1, C, right).



goal(T) :- time(T), position(T,r,3,5).


%#minimize {T: goal(T)}.


%#program check(l).
:- not goal(l).





% #show position/4.
% #show busy/4.
% #show free/3.
% #show move/3.
% #show moved/3.
% #show parked/2.
% #show movable/2.
% #show executable/5.