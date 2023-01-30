grid(1..5, 1..5).

time(1..t).

car(a).
car(b).
car(c).

position(a, h, 2, 3, 4).
position(b, v, 5, 1, 2).
position(c, v, 2, 1, 2).

initial(position(a, h, 2, 3, 4)).
initial(position(b, v, 5, 1, 2)).
initial(position(c, v, 2, 1, 2)).

initial(free(X, Y)) :-
	free(X, Y).

initial(neg(free(X, Y))) :-
	not_free(X, Y).




not_free(X, Y) :-
	grid(X, Y),
	position(_, h, X, Y, _).
not_free(X, Y) :-
	grid(X, Y),
	position(_, h, X, _, Y).

not_free(X, Y) :-
	grid(X, Y),
	position(_, v, Y, X, _).
not_free(X, Y) :-
	grid(X, Y),
	position(_, v, Y, _, X).

free(X, Y) :-
	grid(X, Y),
	not not_free(X, Y).


fluent(position(C, O, C1, C2, C3)) :-
	position(C, O, C1, C2, C3).
fluent(free(X, Y)) :-
	free(X, Y).
fluent(neg(free(X, Y))) :-
	not_free(X, Y).




action(move_right(C)) :-
	car(C), position(C, h, _, _, _).

action(move_left(C)) :-
	car(C), position(C, h, _, _, _).

action(move_down(C)) :-
	car(C),position(C, v, _, _, _).

action(move_up(C)) :-
	car(C), position(C, v, _, _, _).




executable(action(move_right(C)), free(X, Y2+1)) :-
	position(C, h, X, Y1, Y2), grid(X, Y2+1), free(X, Y2+1).

executable(action(move_left(C)), free(X, Y1-1)) :-
	position(C, h, X, Y1, Y2), grid(X, Y1-1), fluent(free(X, Y1-1)).

executable(action(move_down(C)), free(X2+1, Y)) :-
	position(C, v, Y, X1, X2), grid(X2+1, Y), fluent(free(X2+1, Y)).

executable(action(move_up(C)), free(X1-1, Y)) :-
	position(C, v, Y, X1, X2), grid(X1-1, Y), free(X1-1, Y).




cause(action(move_right(C)), free(X, Y-1)) :-
	executable(action(move_right(C)), free(X, Y+1)).

cause(action(move_right(C)), neg(free(X, Y+1))) :-
	executable(action(move_right(C)), free(X, Y+1)).

cause(action(move_right(C)), position(C, h, X, Y1+1, Y2+1)) :-
	position(C, h, X, Y1, Y2),
	executable(action(move_right(C)), free(X, Y2+1)).

cause(action(move_right(C)), neg(position(C, h, X, Y1, Y2))) :-
	position(C, h, X, Y1, Y2),
	executable(action(move_right(C)), free(X, Y2+1)).




cause(action(move_down(C)), free(X-1, Y)) :-
	executable(action(move_down(C)), free(X+1, Y)).

cause(action(move_down(C)), neg(free(X+1, Y))) :-
	executable(action(move_down(C)), free(X+1, Y)).

cause(action(move_down(C)), position(C, v, Y, X1+1, X2+1)) :-
	position(C, v, Y, X1, X2),
	executable(action(move_down(C)), free(X2+1, Y)).

cause(action(move_down(C)), neg(position(C, v, Y, X1, X2))) :-
	position(C, v, Y, X1, X2),
	executable(action(move_down(C)), free(X2+1, Y)).




cause(action(move_left(C)), free(X, Y+1)) :-
	executable(action(move_left(C)), free(X, Y-1)).

cause(action(move_left(C)), neg(free(X, Y-1))) :-
	executable(action(move_left(C)), free(X, Y-1)).

cause(action(move_left(C)), position(C, h, X, Y1-1, Y2-1)) :-
	position(C, h, X, Y1, Y2),
	executable(action(move_left(C)), free(X, Y1-1)).

cause(action(move_left(C)), neg(position(C, h, X, Y1, Y2))) :-
	position(C, h, X, Y1, Y2),
	executable(action(move_left(C)), free(X, Y1-1)).



cause(action(move_up(C)), free(X+1, Y)) :-
	executable(action(move_up(C)), free(X-1, Y)).

cause(action(move_up(C)), neg(free(X-1, Y))) :-
	executable(action(move_up(C)), free(X-1, Y)).

cause(action(move_up(C)), position(C, v, Y, X1-1, X2-1)) :-
	position(C, v, Y, X1, X2),
	executable(action(move_up(C)), free(X1-1, Y)).

cause(action(move_up(C)), neg(position(C, v, Y, X1, X2))) :-
	position(C, v, Y, X1, X2),
	executable(action(move_up(C)), free(X1-1, Y)).


final(position(a, h, 2, 4, 5)).


opposite(F,neg(F)) :-
	fluent(F).
opposite(neg(F),F) :-
	fluent(F).

holds(F,1) :-
	initial(F).

not_goal(T) :-
	time(T),
	final(F),
	not holds(F,T). 
goal(T) :-
	time(T),
	not not_goal(T).
:- not goal(t).

eseguibile(A,T) :-
	time(T),
	executable(A,F),
	not holds(F,T). 

1{not_eseguibile(A,T): action(A), not eseguibile(A,T)}1 :-
	time(T), T < t.

holds(F,T+1) :-
	T < t,
	fluent(F),
	not_eseguibile(A,T),
	occurs(A,T),
	cause(A,F).

% inerzia
holds(F,T+1) :-
	opposite(F,G),
	T < t, holds(F,T),
	not holds(G,T+1).

% applico esattamente una action che occorre al time T
1{occurs(A,T): action(A), not_eseguibile(A,T)}1 :- time(T), T < t.
	%T < t.



%   1 2 3 4 5
% 1   c     b
% 2   c a a b
% 3
% 4
% 5



%#show opposite/2.
%#show holds/2.
%#show goal/1.
%#show not_goal/1.
#show not_eseguibile/2.
#show eseguibile/2.
#show occurs/2.
%#show executable/2.

%#show cause/2.
%#show free/3.
%#show move_right/1.
%#show move_left/1.
%#show move_up/1.
%#show move_down/1.