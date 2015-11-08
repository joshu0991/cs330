prereq_chain(X,Y) :- prereq(X,Y).
prereq_chain(X,Y) :- prereq(X,Z), prereq_chain(Z,Y).

bad_course(X,Y) :- student(X,N,M), entry(N,Y,_), approved_list(O,L), M\==O, member(Y,L).

no_bad_courses(X) :- student(X,N,C), approved_list(O,L), C==O, foreach(entry(N,Q,_), member(Q,L)) .

missing_course(X,Y) :- student(X,N,M), prereq_chain(Y,Q), entry(N,Z,_), entry(N,Y,_), !, fail.
missing_course(X,Y) :- prereq_chain(Y,Z).

missing_course1(X,Y) :- student(X,N,M), prereq_chain(Y,Q), entry(N,Q,_), \+ entry(N,Y,_).

notbefore([S1,Y1], [S2,Y2]) :- sesson_before(S2, S1), Y1>=Y2.
notbefore([_,Y1],[_,Y2]) :- Y1>Y2.

sesson_before(X,Y) :- before(X,Y).
sesson_before(X,Y) :- before(X,Z), sesson_before(Z,Y).

member(Element, [Element|_]).
member(Element,[_|Tail]) :-
    member(Element,Tail).
