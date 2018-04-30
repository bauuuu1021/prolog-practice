%Arithmetic function
decre(X,Des):-Des is X-1.
incre(X,Des):-Des is X+1.

%build
build(X,Y):-not(group(X,Num1)),not(group(Y,Num2)),nb_getval(index,Val),
            assert(group(X,Val)),assert(group(Y,Val)),
            incre(Val,NewIndex),nb_setval(index,NewIndex).
build(X,Y):-not(group(X,Num1)),group(Y,Num2),
            assert(group(X,Num2)).
build(X,Y):-group(X,Num1),not(group(Y,Num2)),
            assert(group(Y,Num1)).
build(X,Y):-group(X,Num1),group(Y,Num2),
assert(connect(Num1,Num2)),assert(connect(Num2,Num1)).
            %group(Z,Num2),assert(group(Z,Num1)).

%check
check(X,Y):-group(X,Num1),group(Y,Num2),Num1=:=Num2,writeln('yes').
check(X,Y):-group(X,Num1),group(Y,Num2),Num1\=Num2,connect(Num1,Num2),writeln('yes').
check(X,Y):-group(X,Num1),group(Y,Num2),Num1\=Num2,not(connect(Num1,Num2)),writeln('no').

%insert relation
insert(Time):-
Time>0,
write('relation : '),
read(X),read(Y),
build(X,Y),
build(Y,X),
group(X,Num1),
group(Y,Num2),
decre(Time,NewT),
insert(NewT).
insert(0).

%numbers of queries
query(Time):-
Time>0,
write('query :'),read(X),read(Y),
check(X,Y),
decre(Time,NewT),
query(NewT).
query(0).

main :-
assert(group(0,0)),
assert(connect(0,0)),
nb_setval(index,0),
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