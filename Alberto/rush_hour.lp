%clingo rush_hour_v4.txt -c t=<1> |  grep -A1 Answer | tr ' ' '\n' | cut -b 10- | sort -n | sed 's/))/)/g'

grid(1..6, 1..6).

n(1..5).

time(0..t).


no(0,0).


car(a).
car(b).
car(c).
car(d).
car(e).
car(f).
car(g).
car(h).
car(i).
car(j).
car(k).
car(l).
car(m).

dir(right).
dir(left).
dir(up).
dir(down).

orientation(v).
orientation(h).

% updates the position of the moved car
position(T+1, C, h, C1, C2, C3) :-
	cause(T, move(_, C, _), position(T+1, C, h, C1, C2, C3)),
	time(T), time(T+1), car(C),
	grid(C1, C2), grid(C1, C3).
position(T+1, C, v, C1, C2, C3) :-
	cause(T, move(_, C, _), position(T+1, C, v, C1, C2, C3)),
	time(T), time(T+1), car(C),
	grid(C2, C1), grid(C3, C1).

position(T+1, C, h, C1, C2, C3, C4) :-
	cause(T, move(_, C, _), position(T+1, C, h, C1, C2, C3, C4)),
	time(T), time(T+1), car(C),
	grid(C1, C2), grid(C1, C3), grid(C1, C4).
position(T+1, C, v, C1, C2, C3, C4) :-
	cause(T, move(_, C, _), position(T+1, C, v, C1, C2, C3, C4)),
	time(T), time(T+1), car(C),
	grid(C2, C1), grid(C3, C1), grid(C4, C1).

% keeps the position of the still cars
position(T+1, C, h, C1, C2, C3) :-
	not executed(T, move(_, C, _)),
	position(T, C, h, C1, C2, C3),
	time(T), car(C),
	grid(C1, C2), grid(C1, C3).
position(T+1, C, v, C1, C2, C3) :-
	not executed(T, move(_, C, _)),
	position(T, C, v, C1, C2, C3),
	time(T), car(C),
	grid(C2, C1), grid(C3, C1).

position(T+1, C, h, C1, C2, C3, C4) :-
	not executed(T, move(_, C, _)),
	position(T, C, h, C1, C2, C3, C4),
	time(T), car(C),
	grid(C1, C2), grid(C1, C3), grid(C1, C4).
position(T+1, C, v, C1, C2, C3, C4) :-
	not executed(T, move(_, C, _)),
	position(T, C, v, C1, C2, C3, C4),
	time(T), car(C),
	grid(C2, C1), grid(C3, C1), grid(C4, C1).

% a cell (X, Y) is not free if there is a car that occupies that position
not_free(T, X, Y) :-
	position(T, _, h, X, Y, _).
not_free(T, X, Y) :-
	position(T, _, h, X, _, Y).
not_free(T, X, Y) :-
	position(T, _, h, X, Y, _, _).
not_free(T, X, Y) :-
	position(T, _, h, X, _, Y, _).
not_free(T, X, Y) :-
	position(T, _, h, X, _, _, Y).
not_free(T, X, Y) :-
	position(T, _, v, Y, X, _).
not_free(T, X, Y) :-
	position(T, _, v, Y, _, X).
not_free(T, X, Y) :-
	position(T, _, v, Y, X, _, _).
not_free(T, X, Y) :-
	position(T, _, v, Y, _, X, _).
not_free(T, X, Y) :-
	position(T, _, v, Y, _, _, X).

% a cell (X, Y) is free if it's not occupied
free(T, X, Y) :-
	time(T), grid(X, Y),
	not not_free(T, X, Y).

% move right if the right neighbour cell it's free and if it is on the grid
action(T, move(right, C, 1)) :-
	car(C), time(T),
	position(T, C, h, X, Y1, Y2),
	free(T, X, Y2+1),
	not no(X, Y2+1),
	grid(X, Y2+1).

% move down if the lower neighbour cell it's free and if it is on the grid
action(T, move(down, C, 1)) :-
	car(C), time(T),
	position(T, C, v, Y, X1, X2),
	free(T, X2+1, Y),
	not no(X2+1, Y),
	grid(X2+1, Y).

% move left if the left neighbour cell it's free and if it is on the grid
action(T, move(left, C, 1)) :-
	car(C), time(T),
	position(T, C, h, X, Y1, Y2),
	free(T, X, Y1-1),
	not no(X, Y1-1),
	grid(X, Y1-1).

% move up if the upper neighbour cell it's free and if it is on the grid
action(T, move(up, C, 1)) :-
	car(C), time(T),
	position(T, C, v, Y, X1, X2),
	free(T, X1-1, Y),
	not no(X1-1, Y),
	grid(X1-1, Y).




action(T, move(right, C, 1)) :-
	car(C), time(T),
	position(T, C, h, X, Y1, Y2, Y3),
	free(T, X, Y3+1),
	not no(X, Y3+1),
	grid(X, Y3+1).

% move down if the lower neighbour cell it's free and if it is on the grid
action(T, move(down, C, 1)) :-
	car(C), time(T),
	position(T, C, v, Y, X1, X2, X3),
	free(T, X3+1, Y),
	not no(X3+1, Y),
	grid(X3+1, Y).

% move left if the left neighbour cell it's free and if it is on the grid
action(T, move(left, C, 1)) :-
	car(C), time(T),
	position(T, C, h, X, Y1, Y2, Y3),
	free(T, X, Y1-1),
	not no(X, Y1-1),
	grid(X, Y1-1).

% move up if the upper neighbour cell it's free and if it is on the grid
action(T, move(up, C, 1)) :-
	car(C), time(T),
	position(T, C, v, Y, X1, X2, X3),
	free(T, X1-1, Y),
	not no(X1-1, Y),
	grid(X1-1, Y).




% execute only one action at the time
1 {executed(T, move(Dir, C, 1)): action(T, move(Dir, C, 1))} 1 :-
	time(T), T < t.

% move right updates the position of the car C
cause(T, move(right, C, 1), position(T+1, C, h, X, Y1+1, Y2+1)) :-
	executed(T, move(right, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, h, X, Y1, Y2),
	free(T, X, Y2+1),
	not no(X, Y2+1),
	grid(X, Y2+1).

% move down updates the position of the car C
cause(T, move(down, C, 1), position(T+1, C, v, Y, X1+1, X2+1)) :-
	executed(T, move(down, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, v, Y, X1, X2),
	free(T, X2+1, Y),
	not no(X2+1, Y),
	grid(X2+1, Y).

% move left updates the position of the car C
cause(T, move(left, C, 1), position(T+1, C, h, X, Y1-1, Y2-1)) :-
	executed(T, move(left, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, h, X, Y1, Y2),
	free(T, X, Y1-1),
	not no(X, Y1-1),
	grid(X, Y1-1).

% move up updates the position of the car C
cause(T, move(up, C, 1), position(T+1, C, v, Y, X1-1, X2-1)) :-
	executed(T, move(up, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, v, Y, X1, X2),
	free(T, X1-1, Y),
	not no(X1-1, Y),
	grid(X1-1, Y).





% move right updates the position of the car C
cause(T, move(right, C, 1), position(T+1, C, h, X, Y1+1, Y2+1, Y3+1)) :-
	executed(T, move(right, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, h, X, Y1, Y2, Y3),
	free(T, X, Y3+1),
	not no(X, Y3+1),
	grid(X, Y3+1).

% move down updates the position of the car C
cause(T, move(down, C, 1), position(T+1, C, v, Y, X1+1, X2+1, X3+1)) :-
	executed(T, move(down, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, v, Y, X1, X2, X3),
	free(T, X3+1, Y),
	not no(X3+1, Y),
	grid(X3+1, Y).

% move left updates the position of the car C
cause(T, move(left, C, 1), position(T+1, C, h, X, Y1-1, Y2-1, Y3-1)) :-
	executed(T, move(left, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, h, X, Y1, Y2, Y3),
	free(T, X, Y1-1),
	not no(X, Y1-1),
	grid(X, Y1-1).

% move up updates the position of the car C
cause(T, move(up, C, 1), position(T+1, C, v, Y, X1-1, X2-1, X3-1)) :-
	executed(T, move(up, C, 1)),
	car(C), time(T+1), time(T),
	position(T, C, v, Y, X1, X2, X3),
	free(T, X1-1, Y),
	not no(X1-1, Y),
	grid(X1-1, Y).



goal(T) :-
	position(T, a, h, 3, 5, 6),
	time(T).

:- not goal(t).

#minimize {T: goal(T)}.

