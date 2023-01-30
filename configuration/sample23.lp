%76
% position(CARS, DIM, ORIENTATION).
car(block, 1, h).

position(0..l-1,block,6,3).
busy(0..l-1,block,6,3).
not_free(0..l-1,6,3). 

car(r, 2, h).
car(b1, 3, h).
car(b2, 2, v).
car(b3, 2, h).
car(b4, 3, v).
car(b5, 2, v).
car(b6, 2, h).
car(b7, 2, h).
car(b8, 2, v).
car(b9, 2, v).
car(b10, 2, h). 

% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 2).
position(0, b1, 1, 1).
position(0, b2, 2, 1).
position(0, b3, 5, 1).
position(0, b4, 1, 4).
position(0, b5, 4, 3).
position(0, b6, 4, 4).
position(0, b7, 1, 5).
position(0, b8, 2, 6).
position(0, b9, 4, 6).
position(0, b10, 6, 5).








% Optimization: 75
% OPTIMUM FOUND

% Models       : 2
%   Optimum    : yes
% Optimization : 75
% Calls        : 1
% Time         : 306.224s (Solving: 305.35s 1st Model: 299.19s Unsat: 0.36s)
% CPU Time     : 945.168s
% Threads      : 4        (Winner: 1)

