%%%%% clingo Esempio_1511.lp -c l=2 | grep -A1 Answer | tr ' ' '\n' %%%%%%
%% -c l=2 è usato per settare la variabile l a 2. Utile per il tempo



%% GRIGLIA

   % 0,0----->   Y
   %  |
   %  |   1,1  1,2  1,3  1,4  1,5  1,6
   %  V   2,1  2,2  2,3  2,4  2,5  2,6
   %      3,1  3,2  3,3  3,4  3,5  3,6 -> EXIT
   %  X   4,1  4,2  4,3  4,4  4,5  4,6
   %      5,1  5,2  5,3  5,4  5,5  5,6
   %      6,1  6,2  6,3  6,4  6,5  6,6




% La posizione X di una macchina indica il suo punto iniziale:
% Non possono esserci macchine in orizzontale sulla riga della macchina rossa


griglia(1..6,1..6).
exit(3,6).


% AUTO(X1,Y1,X2,Y2)
red(3,1,3,2).
car(3,3,4,3).

dx(C,X1,Y1,X2,Y2) :- move(C,X1+1,Y1,X2+1,Y2).

move(C,X1,Y1,X2,Y2) :- red(X3,Y3,X4,Y4), X3<X1, X4<X2

%occupato(X,Y) :- mapping(red,X,Y).
%1{ mapping(red,X,Y) : griglia(X,Y) }1 :- red(X,Y).

%occupato(X,Y) :- mapping(car,X,Y).
%1{ mapping(car,X,Y) : griglia(X,Y) }1 :- car(X,Y).


%left(red,Y) :- 









%red(3,X) :- griglia(3,X+2), X<0.















% 1 - Modellazione informazioni/input
% Script che prende un CSV, grafo e lo converte in fatti (per il progetto)+
% L'input è hhphhhph

%amminoacido(h,1).	%posizione di h all'indice 1
%amminoacido(h,2).
%amminoacido(p,3).
%amminoacido(h,4).
%amminoacido(h,5).
%amminoacido(h,6).
%amminoacido(p,7).
%amminoacido(h,8).




% Come collocare nello spazio i vari oggetti. Come modellare lo spazio.

% size(N) :- N = #count{amminoacido(X,Y)}.			% unsafe per X e Y

%size(N) :- N = #count{ X,Y : amminoacido(X,Y) }.	% safe
%griglia(1..N,1..N) :- size(N).





% Regole. Si deve fare il mapping degli amminoacidi in una posizione X,Y con la fase di generate

%occupato(X,Y) :- mapping(S,X,Y). 	% Un oggetto occupa quella posizione

%1{ mapping(S,X,Y) : griglia(X,Y) }1 :- amminoacido(A,S).			% Dato un certo elemento voglio assegnare una specifica posizione






% Vincoli
% Identificare due oggetti consecutivi, questi devono essere consecutivi nei 4 punti vicini nella griglia, quindi che siano a distanza 1

%:- amminoacido(A,S), amminoacido(B,S+1), mapping(S,X,Y), mapping(S+1,X1,Y1), |X-X1| + |Y-Y1| != 1.

% Non vogliamo più di un amminoacido nello stesso punto
%:- amminoacido(A,S), amminoacido(B,S1), mapping(S,X,Y), mapping(S1,X1,Y1), S != S1, X=X1, Y=Y1.





% Generate tutte le sequenze, pensiamo all'ottimizzazione e al costo riguardo la funzione di energie degli amminoacidi


% Ho due amminoacidi h, in posizioni diverse ma consecutivi.

%#minimize{ -1,X,Y,X1,Y1 : amminoacido(h,S), amminoacido(h,S1), mapping(S,X,Y), mapping(S1,X1,Y1),
%							S<S1, |X-X1| + |Y-Y1| != 1 }.






%#show mapping/3.

























