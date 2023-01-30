%103
% position(CARS, DIM, ORIENTATION).
car(block, 1, h).
car(block1, 1, h).

position(0..l-1,block,1,6).
busy(0..l-1,block,1,6).
not_free(0..l-1,1,6).

position(0..l-1,block1,6,6).
busy(0..l-1,block1,6,6).
not_free(0..l-1,6,6). 

car(r, 2, h).
car(b1, 2, h).
car(b2, 3, h).
car(b3, 2, v).
car(b4, 2, v).
car(b5, 2, h).
car(b6, 2, h).
car(b7, 2, v).
car(b8, 2, h).
car(b9, 2, v).
car(b10, 2, v).
car(b11, 2, v). 

% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 1).
position(0, b1, 1, 3).
position(0, b2, 2, 1).
position(0, b3, 5, 1).
position(0, b4, 3, 3).
position(0, b5, 5, 2).
position(0, b6, 6, 2).
position(0, b7, 2, 4).
position(0, b8, 4, 4).
position(0, b9, 5, 4).
position(0, b10, 1, 5).
position(0, b11, 3, 6).


