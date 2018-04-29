%Arithmetic function
decre(X,Des):-Des is X-1.


%check
check(X,Y):-connect(X,Y),writeln('yes').
check(X,Y):-connect(X,Z),connect(Z,Y),writeln('yes').
check(X,Y):-not(connect(X,Y)),writeln('no').

%insert relation
insert(Time):-
Time>0,
write('relation :'),read(X),read(Y),
assert(connect(X,Y)),
assert(connect(Y,X)),
decre(Time,NewT),
insert(NewT).
insert(Time):-Time=:=0.

%numbers of queries
query(Time):-
Time>0,
write('query :'),read(X),read(Y),
check(X,Y),
decre(Time,NewT),
query(NewT).
query(Time):-Time=:=0.


main :-
%relation
write('Number of nodes and edges: '),
read(Node),read(Edge),
insert(Edge),
%queries
write('Numbers of queries : '),
read(Num),
query(Num),
halt.
:- initialization(main).