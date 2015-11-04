prereq_chain(X,Y) :- prereq(X,Y).
prereq_chain(X, Y) :- prereq(X,Z).
 
bad_course(X,Y) :- student(X,N,M), entry(N,Y,_), approved_list(M,L), member(Y,L), !,fail.
bad_course(X,Y) :- student(X,N,M), entry(N,Y,_).

no_bad_courses(X).

missing_course(X,Y).

notbefore([S1,Y1], [S2,Y2]).

member(Element, [Element|_]).
member(Element,[_|Tail]) :-
    member(Element,Tail).
