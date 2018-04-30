%Arithmetic function
add1(X,Des):-Des is X+1.
minus1(X,Des):-Des is X-1.

%called by main(), excute loop() function until get answer
find(X):-
CurrL is ceiling(X/2),
CurrR is X-CurrL,
loop(CurrL,CurrR).

%if both input numbers are prime, print answers
%otherwise, increse and decrese the first and the second number, do the loop again
loop(L,R):-
multiple(2,L,RetL),multiple(2,R,RetR),Cmp is RetL+RetR, Cmp\=0,
minus1(L,NewL),add1(R,NewR),
loop(NewL,NewR).
loop(L,R):-
multiple(2,L,RetL),multiple(2,R,RetR),Cmp is RetL+RetR, Cmp=:=0,  %may cause problem
write('result : '),write(L),write(' '),writeln(R).

%if the input number is multiple return 1; otherwise, return 0
multiple(I,X,Return):-X=:=2, Return is 0.
multiple(I,X,Return):-I<X, mod(X,I)=:=0, Return is 1.
multiple(I,X,Return):-I<X, mod(X,I)\=0, add1(I,NewI), multiple(NewI,X,NewReturn), Return is NewReturn.
multiple(I,X,Return):-I>=X, Return is 0.

main :-
writeln('1. should end with .'),
writeln('2. even integer greater than 2'),
write('input : '), 
read(Input),
find(Input),
halt.
:- initialization(main).
