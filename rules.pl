prereq_chain(X,Y):- prereq(X,Y).
prereq_chain(X, Y):- prereq(X,Z).
 
bad_course(X,Y).

no_bad_courses(X).

missing_course(X,Y).

notbefore([S1,Y1], [S2,Y2]).
