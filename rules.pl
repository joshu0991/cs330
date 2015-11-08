/*
 * This succeeds if X is a prereq of Y, even indirectly.
 */
prereq_chain(X,Y) :- prereq(X,Y).
prereq_chain(X,Y) :- prereq(X,Z), prereq_chain(Z,Y).

/*
 * This succeeds if person X schedules a course Y which is not approved for their major.
 */
bad_course(X,Y) :- student(X,N,M), entry(N,Y,_), approved_list(O,L), M\==O, member(Y,L).

/*
 * This succeeds if person X is not taking any bad courses, that is, if bad_course(X,Y) always fails.
 */
no_bad_courses(X) :- student(X,N,C), approved_list(O,L), C==O, foreach(entry(N,Q,_), member(Q,L)) .

/*
 * This succeeds if person X is missing (does not have an entry for) a course Y which is a prereq of some course X is taking (or has taken).
 */
missing_course(X,Y) :- student(X,N,_), prereq_chain(Y,Q), entry(N,Q,_), \+ entry(N,Y,_).

/*
 * This succeeds if semester [S1,Y1] does not occur before semester [S2,Y2]. For example, [fall,2000] 
 * does not occur before [spring, 2000], and any semester does not occur before itself.
 */
notbefore([S1,Y1], [S2,Y2]) :- sesson_before(S2, S1), Y1>=Y2.
notbefore([_,Y1],[_,Y2]) :- Y1>Y2.

/*
 * Check to see if the sessons are before each other as determined by the given facts
 * spring -> summer -> fall
 */
sesson_before(X,Y) :- before(X,Y).
sesson_before(X,Y) :- before(X,Z), sesson_before(Z,Y).

/*
 * Check to see if a given element is a memeber of the list.
 * Used for checking the cs and geog lists 
 */
member(Element, [Element|_]).
member(Element,[_|Tail]) :-
    member(Element,Tail).
