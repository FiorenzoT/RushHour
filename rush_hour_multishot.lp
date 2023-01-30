#program base.
%time(0..l).

grid(1..6,1..6).

moveTo(right; left; up; down).

orientation(h;v).

cars(r;b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12).

dim(2;3).





#program check(l).
goal(l) :- position(l,r,3,5).
:- not goal(l), query(l).




#program step(l).
%%%%%% Posizioni occupate dalle auto e posizioni libere

busy(l, C, X, Y..Y+N-1) :- position(l, C, X, Y), car(C, N, h), cars(C), dim(N).

busy(l, C, X..X+N-1, Y) :- position(l, C, X, Y), car(C, N, v), cars(C), dim(N).

not_free(l,X,Y) 		:- grid(X,Y), car(C,N,O), busy(l,C,X,Y), cars(C), dim(N), orientation(O).

free(l, X, Y) 			:- grid(X,Y), car(C,N,O), cars(C), dim(N), orientation(O), 
                           not not_free(l,X,Y).



%%%%%% Mosse eseguibili al tempo l

executable(l, C, right, X, Y+1) :- grid(X,Y+N),%grid(X,Y+N),
                                   car(C, N, h), free(l, X, Y+N), cars(C), dim(N),
                                   position(l, C, X, Y).

executable(l, C, left,  X, Y-1) :- grid(X,Y-1), 
                                   car(C, N, h), free(l, X, Y-1), cars(C), dim(N),
                                   position(l, C, X, Y).

executable(l, C, up, 	X-1, Y) :- grid(X-1,Y), 
                                   car(C, N, v), free(l, X-1, Y), cars(C), dim(N),
                                   position(l, C, X, Y).

executable(l, C, down, 	X+1, Y) :- grid(X+N,Y), %grid(X+N,Y),  
                                   car(C, N, v), free(l, X+N, Y), cars(C), dim(N),
                                   position(l, C, X, Y).



%%%%%% Scelta di una tra le mosse eseguibili

1{move(l, C, MOV) : car(C,N,O), executable(l,C,MOV,X,Y), dim(N), orientation(O), moveTo(MOV)}1.



%%%%%% Aggiornamento posizioni

position(l,C,X,Y) :- position(l-1,C,X,Y), car(C,N,O), dim(N), orientation(O), 
                     not move(l-1, C, right), not move(l-1, C, left), not move(l-1, C, up), not move(l-1, C, down).

% Inserendo solo le 4 regole di sotto, non era possibile tenere traccia degli oggetti che non si spostavano. 
% Per questo è necessario inserire la regola di sopra.
% Attenzione: nel corpo della regola, le X e le Y sono relative al tempo precedente! Se ci si è spostati a destra, si era in Y-1

position(l,C,X,Y) :- moveTo(right),
                     grid(X,Y-1), position(l-1,C,X,Y-1), car(C,N,h), dim(N),
                     move(l-1,C,right), not move(l-1, C, left), not move(l-1, C, up), not move(l-1, C, down).

position(l,C,X,Y) :- moveTo(left),
                     grid(X,Y+1), position(l-1,C,X,Y+1), car(C,N,h), dim(N),
                     move(l-1,C,left), not move(l-1, C, right), not move(l-1, C, up), not move(l-1, C, down).

position(l,C,X,Y) :- moveTo(up), 
                     grid(X+1,Y), position(l-1,C,X+1,Y), car(C,N,v), dim(N),
                     move(l-1,C,up), not move(l-1, C, down), not move(l-1, C, left), not move(l-1, C, right).

position(l,C,X,Y) :- moveTo(down), 
                     grid(X-1,Y), position(l-1,C,X-1,Y), car(C,N,v), dim(N),
                     move(l-1,C,down), not move(l-1, C, up), not move(l-1, C, left), not move(l-1, C, right).






%#minimize {l: goal(l)}.








% #show position/4.
% #show busy/4.
% #show free/3.
% #show move/3.
% #show moved/3.
% #show parked/2.
% #show movable/2.
% #show executable/5.