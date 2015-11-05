prereq_chain(X,Y) :- prereq(X,Y).
prereq_chain(X, Y) :- prereq(X,_).
/* 
bad_course(X,Y) :- student(X,N,M), entry(N,Y,_), approved_list(M,L), member(Y,L), !,fail.
bad_course(X,Y) :- student(X,N,M), entry(N,Y,_).
*/

bad_course(X,Y) :- student(X,N,M), entry(N,Y,_), approved_list(O,L), not(M = O), member(Y,L).

no_bad_courses(X) :- bad_course(X,_), !, fail.
no_bad_courses(_).

/*
missing_course(X,Y) :- student(X,N,M), entry(N,C,_), not(Y = C), prereq_chain(Y,C).
*/
missing_course(X,Y) :- student(X,N,M), prereq_chain(Y,Q), entry(N,Z,_), entry(N,Y,_), !, fail.
missing_course(X,Y) :- prereq_chain(Y,Z).

notbefore([S1,Y1], [S2,Y2]).

member(Element, [Element|_]).
member(Element,[_|Tail]) :-
    member(Element,Tail).
