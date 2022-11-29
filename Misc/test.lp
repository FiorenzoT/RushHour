griglia(1..6,1..6).
exit(3,6).

% CARS
car_name(r).
car_name(b).

car(r,3,2,ho).
car(r,3,3,ho).

car(b,3,4,ve).
car(b,4,4,ve).



% POSITIONS
horizontal(Z) :- car(Z,X,Y,ho).
vertical(Z) :- car(Z,X,Y,ve).


free(X,Y) :- griglia(X,Y), not occupated(A,X,Y,ho), car_name(A).
free(X,Y) :- griglia(X,Y), not occupated(A,X,Y,ve), car_name(A).


% 2{ new_position(Z,X,Y,ho) : griglia(X,Y), griglia(X,Y1), horizontal(Z), |Y1-Y|!=1 }2.
% 2{ new_position(Z,X,Y,ve) : griglia(X,Y), griglia(X1,Y), vertical(Z), |X1-X|!=1 }2.

occupated(Z,X,Y,DIR) :- car(Z,X,Y,DIR).

%2{ car(Z,X,Y,ho) : griglia(X,Y), griglia(X,Y1), |Y1-Y|!=1 }2.



% MOVES
right(Z,X,Y) :- horizontal(Z), free(X,Y-1), occupated(Z,X,Y-1,ho). 
left(Z,X,Y) :- horizontal(Z), free(X,Y+1), occupated(Z,X,Y+1,ho). 
%up(Z,X,Y) :- vertical(Z), occupated(Z,X-1,Y,ve).
%down(Z,X,Y) :- vertical(Z), occupated(Z,X+1,Y,ve).

