%104
% position(CARS, DIM, ORIENTATION).
car(block, 1, h).
position(0..l-1,block,1,4).
busy(0..l-1,block,1,4).
not_free(0..l-1,1,4).

car(r, 2, h).
car(b1, 2, v).
car(b2, 2, v).
car(b3, 2, h).
car(b4, 2, h).
car(b5, 2, h).
car(b6, 2, v).
car(b7, 3, h).
car(b8, 2, v).
car(b9, 2, h).
car(b10, 2, h).
car(b11, 3, v).

% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 2).
position(0, b1, 1, 1).
position(0, b2, 3, 1).
position(0, b3, 5, 1).
position(0, b4, 6, 1).
position(0, b5, 1, 2).
position(0, b6, 4, 3).
position(0, b7, 6, 3).
position(0, b8, 2, 4).
position(0, b9, 4, 4).
position(0, b10, 2, 5).
position(0, b11, 4, 6).


