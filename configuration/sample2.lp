%111
% position(CARS, DIM, ORIENTATION).
car(block, 1, h).
car(block1, 1, h).

position(0..l-1,block,1,6).
busy(0..l-1,block,1,6).
not_free(0..l-1,1,6).

position(0..l-1,block1,6,5).
busy(0..l-1,block1,6,5).
not_free(0..l-1,6,5). 

car(r, 2, h).
car(b1, 2, h).
car(b2, 3, h).
car(b3, 2, v).
car(b4, 2, v).
car(b5, 2, h).
car(b6, 2, v).
car(b7, 2, v).
car(b8, 2, h).
car(b9, 2, v).
car(b10, 2, h).
car(b11, 2, v). 

% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 2).
position(0, b1, 1, 1).
position(0, b2, 2, 1).
position(0, b3, 3, 1).
position(0, b4, 4, 3).
position(0, b5, 6, 2).
position(0, b6, 1, 4).
position(0, b7, 3, 4).
position(0, b8, 5, 4).
position(0, b9, 1, 5).
position(0, b10, 4, 5).
position(0, b11, 5, 6).





% Optimization: 110
% Progression : [104;110] (Error: 0.0576923)
% Progression : [105;110] (Error: 0.047619)
% Progression : [106;110] (Error: 0.0377358)
% Progression : [107;110] (Error: 0.0280374)
% Progression : [108;110] (Error: 0.0185185)
% Progression : [109;110] (Error: 0.00917431)
% OPTIMUM FOUND

% Models       : 26
%   Optimum    : yes
% Optimization : 110
% Calls        : 1
% Time         : 1597.359s (Solving: 1596.20s 1st Model: 673.19s Unsat: 760.12s)
% CPU Time     : 5820.536s
% Threads      : 4        (Winner: 1)

% sh 1-go
% 314.499s

