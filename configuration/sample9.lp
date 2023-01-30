%86
% position(CARS, DIM, ORIENTATION).
car(block, 1, h).
car(block1, 1, h).

position(0..l-1,block,2,4).
busy(0..l-1,block,2,4).
not_free(0..l-1,2,4).

position(0..l-1,block1,6,1).
busy(0..l-1,block1,6,1).
not_free(0..l-1,6,1). 

car(r, 2, h).
car(b1, 3, h).
car(b2, 2, h).
car(b3, 2, v).
car(b4, 2, h).
car(b5, 2, h).
car(b6, 2, h).
car(b7, 2, v).
car(b8, 2, h).
car(b9, 2, v).
car(b10, 2, v).
car(b11, 2, v). 
car(b12, 2, v). 

% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 2).
position(0, b1, 1, 1).
position(0, b2, 2, 1).
position(0, b3, 3, 1).
position(0, b4, 5, 1).
position(0, b5, 6, 2).
position(0, b6, 1, 4).
position(0, b7, 2, 5).
position(0, b8, 4, 4).
position(0, b9, 5, 4).
position(0, b10, 1, 6).
position(0, b11, 3, 6).
position(0, b12, 4, 3).


% Optimization: 85
% Progression : [ 7;85] (Error: 11.1429)
% OPTIMUM FOUND

% Models       : 11
%   Optimum    : yes
% Optimization : 85
% Calls        : 1
% Time         : 359.321s (Solving: 357.09s 1st Model: 337.88s Unsat: 14.33s)
% CPU Time     : 1179.418s
% Threads      : 4        (Winner: 3)
