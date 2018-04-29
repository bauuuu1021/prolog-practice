%Arithmetic function
decre(X,Des):-Des is X-1.

%insert relation
insert(Time):-
Time>1,
write('relation :'),read(X),read(Y),
assert(parent(X,Y)),
decre(Time,NewT),
insert(NewT).
insert(Time):-Time=:=1.

%numbers of queries
query(Time):-
Time>0,
write('query :'),read(X),read(Y),
lca(X,Y,Y),
decre(Time,NewT),
query(NewT).
query(Time):-Time=:=0.

%find lca
lca(X,Y,InitY):-X=:=Y, writeln(X).
lca(X,Y,InitY):-X\=Y, parent(NewY,Y), lca(X,NewY,InitY).
lca(X,Y,InitY):-X\=Y, not(parent(NewY,Y)), parent(NewX,X), lca(NewX, InitY, InitY).

main :-
%relation
write('Number of nodes : '),
read(Time),
insert(Time),
%queries
write('Numbers of queries : '),
read(Num),
query(Num),
halt.
:- initialization(main).