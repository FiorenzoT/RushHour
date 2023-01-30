%40
% position(CARS, DIM, ORIENTATION).
% TIME = 40

car(r, 2, h).
car(b1, 3, h).
car(b2, 3, v).
car(b3, 2, v).
car(b4, 2, h).
car(b5, 3, v).



% position(TIME, CARS, XMIN, YMIN).
position(0, r, 3, 4).
position(0, b1, 4, 1).
position(0, b2, 1, 3).
position(0, b3, 4, 4).
position(0, b4, 5, 5).
position(0, b5, 2, 6).















% gringo rush_hour.lp configuration/sample2.lp -c l=40 | clasp --stat

% senza "ottimizzazioni"





% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 7.954s (Solving: 7.79s 1st Model: 4.76s Unsat: 3.02s)
% CPU Time     : 7.815s

% Choices      : 237130  
% Conflicts    : 71504    (Analyzed: 71503)
% Restarts     : 227      (Average: 314.99 Last: 237)
% Model-Level  : 37.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 71503    (Deleted: 54119)
%   Binary     : 841      (Ratio:   1.18%)
%   Ternary    : 1765     (Ratio:   2.47%)
%   Conflict   : 71503    (Average Length:   67.4 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 71503    (Average:  3.18 Max: 389 Sum: 227612)
%   Executed   : 71503    (Average:  3.18 Max: 389 Sum: 227612 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 24126    (Original: 22192)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 13867    (Original: 13138 Auxiliary: 729)
% Bodies       : 20382    (Original: 19216)
%   Count      : 1        (Original: 80)
% Equivalences : 48205    (Atom=Atom: 1727 Body=Body: 583 Other: 45895)
% Tight        : Yes
% Variables    : 14443    (Eliminated:    0 Frozen:   38)
% Constraints  : 45259    (Binary:  68.9% Ternary:  25.8% Other:   5.3%)







% CON OTTIMIZZAZIONI

% Sostituisco grid(X+1..X+N-1,Y) con grid(X+N,Y) in executable

% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 8.301s (Solving: 8.13s 1st Model: 4.96s Unsat: 3.17s)
% CPU Time     : 7.999s

% Choices      : 237130  
% Conflicts    : 71504    (Analyzed: 71503)
% Restarts     : 227      (Average: 314.99 Last: 237)
% Model-Level  : 37.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 71503    (Deleted: 54119)
%   Binary     : 841      (Ratio:   1.18%)
%   Ternary    : 1765     (Ratio:   2.47%)
%   Conflict   : 71503    (Average Length:   67.4 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 71503    (Average:  3.18 Max: 389 Sum: 227612)
%   Executed   : 71503    (Average:  3.18 Max: 389 Sum: 227612 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 24126    (Original: 22192)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 13867    (Original: 13138 Auxiliary: 729)
% Bodies       : 20382    (Original: 19216)
%   Count      : 1        (Original: 80)
% Equivalences : 48205    (Atom=Atom: 1727 Body=Body: 583 Other: 45895)
% Tight        : Yes
% Variables    : 14443    (Eliminated:    0 Frozen:   38)
% Constraints  : 45259    (Binary:  68.9% Ternary:  25.8% Other:   5.3%)
















% sostituzioni di _ con fatti: ad esempio car(C,_,h) 	con 	car(C,N,h), cars(C)


% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 7.853s (Solving: 7.67s 1st Model: 4.59s Unsat: 3.09s)
% CPU Time     : 7.749s

% Choices      : 237130  
% Conflicts    : 71504    (Analyzed: 71503)
% Restarts     : 227      (Average: 314.99 Last: 237)
% Model-Level  : 37.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 71503    (Deleted: 54119)
%   Binary     : 841      (Ratio:   1.18%)
%   Ternary    : 1765     (Ratio:   2.47%)
%   Conflict   : 71503    (Average Length:   67.4 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 71503    (Average:  3.18 Max: 389 Sum: 227612)
%   Executed   : 71503    (Average:  3.18 Max: 389 Sum: 227612 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 24128    (Original: 22194)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 13869    (Original: 13140 Auxiliary: 729)
% Bodies       : 20382    (Original: 19216)
%   Count      : 1        (Original: 80)
% Equivalences : 48205    (Atom=Atom: 1727 Body=Body: 583 Other: 45895)
% Tight        : Yes
% Variables    : 14443    (Eliminated:    0 Frozen:   38)
% Constraints  : 45259    (Binary:  68.9% Ternary:  25.8% Other:   5.3%)





% gringo rush_hour.lp configuration/sample2.lp -c l=40 | wc          
%    31679  216029  805919



% dopo aggiunte nella position()


% ren@MacBook-Pro-di-Ren RushHour % gringo rush_hour.lp configuration/sample2.lp -c l=40 | wc
%    31673  215993  805805






% sostituzione not move(T-1, C, right), not move(T-1, C, left), not move(T-1, C, up), not move(T-1, C, down).

% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 5.528s (Solving: 5.35s 1st Model: 3.73s Unsat: 1.62s)
% CPU Time     : 5.449s

% Choices      : 175483  
% Conflicts    : 62469    (Analyzed: 62468)
% Restarts     : 190      (Average: 328.78 Last: 54)
% Model-Level  : 13.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 62468    (Deleted: 41654)
%   Binary     : 977      (Ratio:   1.56%)
%   Ternary    : 2031     (Ratio:   3.25%)
%   Conflict   : 62468    (Average Length:   62.5 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 62468    (Average:  2.74 Max: 223 Sum: 170852)
%   Executed   : 62468    (Average:  2.74 Max: 223 Sum: 170852 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 23633    (Original: 21699)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 14082    (Original: 13353 Auxiliary: 729)
% Bodies       : 19914    (Original: 18748)
%   Count      : 1        (Original: 80)
% Equivalences : 46595    (Atom=Atom: 1721 Body=Body: 579 Other: 44295)
% Tight        : Yes
% Variables    : 14214    (Eliminated:    0 Frozen:   38)
% Constraints  : 46269    (Binary:  70.1% Ternary:  21.1% Other:   8.8%)




% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 4.160s (Solving: 3.98s 1st Model: 2.92s Unsat: 1.06s)
% CPU Time     : 4.081s

% Choices      : 116361  
% Conflicts    : 48310    (Analyzed: 48309)
% Restarts     : 171      (Average: 282.51 Last: 39)
% Model-Level  : 22.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 48309    (Deleted: 27805)
%   Binary     : 1591     (Ratio:   3.29%)
%   Ternary    : 2837     (Ratio:   5.87%)
%   Conflict   : 48309    (Average Length:   40.7 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 48309    (Average:  2.36 Max: 112 Sum: 113919)
%   Executed   : 48309    (Average:  2.36 Max: 112 Sum: 113919 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 23633    (Original: 21699)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 14082    (Original: 13353 Auxiliary: 729)
% Bodies       : 19914    (Original: 18748)
%   Count      : 1        (Original: 80)
% Equivalences : 46379    (Atom=Atom: 1711 Body=Body: 551 Other: 44117)
% Tight        : Yes
% Variables    : 14230    (Eliminated:    0 Frozen:   38)
% Constraints  : 48909    (Binary:  71.7% Ternary:  14.7% Other:  13.7%)














% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 4.030s (Solving: 3.86s 1st Model: 3.36s Unsat: 0.50s)
% CPU Time     : 3.957s

% Choices      : 117063  
% Conflicts    : 47642    (Analyzed: 47641)
% Restarts     : 157      (Average: 303.45 Last: 394)
% Model-Level  : 24.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 47641    (Deleted: 28318)
%   Binary     : 1538     (Ratio:   3.23%)
%   Ternary    : 2620     (Ratio:   5.50%)
%   Conflict   : 47641    (Average Length:   49.8 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 47641    (Average:  2.40 Max: 122 Sum: 114389)
%   Executed   : 47641    (Average:  2.40 Max: 122 Sum: 114389 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 23633    (Original: 21699)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 14088    (Original: 13359 Auxiliary: 729)
% Bodies       : 19914    (Original: 18748)
%   Count      : 1        (Original: 80)
% Equivalences : 46379    (Atom=Atom: 1711 Body=Body: 551 Other: 44117)
% Tight        : Yes
% Variables    : 14230    (Eliminated:    0 Frozen:   38)
% Constraints  : 48909    (Binary:  71.7% Ternary:  14.7% Other:  13.7%)






% Optimization: 39
% OPTIMUM FOUND

% Models       : 1
%   Optimum    : yes
% Optimization : 39
% Calls        : 1
% Time         : 3.996s (Solving: 3.82s 1st Model: 3.32s Unsat: 0.50s)
% CPU Time     : 3.923s

% Choices      : 117063  
% Conflicts    : 47642    (Analyzed: 47641)
% Restarts     : 157      (Average: 303.45 Last: 394)
% Model-Level  : 24.0    
% Problems     : 1        (Average Length: 0.00 Splits: 0)
% Lemmas       : 47641    (Deleted: 28318)
%   Binary     : 1538     (Ratio:   3.23%)
%   Ternary    : 2620     (Ratio:   5.50%)
%   Conflict   : 47641    (Average Length:   49.8 Ratio: 100.00%) 
%   Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
%   Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
% Backjumps    : 47641    (Average:  2.40 Max: 122 Sum: 114389)
%   Executed   : 47641    (Average:  2.40 Max: 122 Sum: 114389 Ratio: 100.00%)
%   Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

% Rules        : 23633    (Original: 21699)
%   Choice     : 2385    
%   Minimize   : 1       
% Atoms        : 14088    (Original: 13359 Auxiliary: 729)
% Bodies       : 19914    (Original: 18748)
%   Count      : 1        (Original: 80)
% Equivalences : 46379    (Atom=Atom: 1711 Body=Body: 551 Other: 44117)
% Tight        : Yes
% Variables    : 14230    (Eliminated:    0 Frozen:   38)
% Constraints  : 48909    (Binary:  71.7% Ternary:  14.7% Other:  13.7%)







