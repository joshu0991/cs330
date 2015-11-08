/* Is bob registered for cs450, which is a course he isn't allowed to take? AND is bob missing a prerequisit for that course? will fail since bob is a cs major*/
bad_course(bob,cs450), missing_course(bob,cs450). 

/* Is bob allowed to take geol101 and is geol101 a prereq of geol 309? should return true*/
bad_course(bob, geol101), prereq_chain(geol101,geol309).

/* does sally have any bad courses and is fall 2010 before spring 2009 does the class cs 211 have a prereq that is cs 330 and is phys 211 a prereq of phys 212?*/
no_bad_courses(sally), notbefore([fall, 2010], [spring, 2009]), prereq_chain(cs211,cs330), prereq_chain(phys211, phys212). 

/* does john have a bad course? should return true since john does have a bad course*/
bad_course(john, _).

/* is there a seasson that is before fall 2010 in the same year? Should return true since fall is the last seasson.*/
notbefore([fall,2010], [_,2010]).

/* Is there a person that has scedhuled a course that is not approved for their major?*/
bad_course(_,cs330).

/* Does there exist a person that has not registered for a bad course and who is that persons should be true and sally?*/
no_bad_courses(X), no_bad_courses(_).

/* Is there a person missing cs 450? Should return true bob is registered for cs 480 which has cs 450 as a prerequisite  and doesn't have an entry for cs 450*/
missing_course(_,cs450).

/* 
 * is bob missing cs450 and is john missing cs 211 (note john is not a cs major will still succeed since thar doesn't matter for missing course is is cs 330 a 
 * bad course for john and there exists someone that doesn't have any bad courses and cs211 is a prerequsit of cs 480 and the semester summer 2015 is after summer 2010
 * this will return true
 */
missing_course(bob,cs450), missing_course(john,cs211), bad_course(john,cs330), no_bad_courses(_), prereq_chain(cs211,cs480), notbefore([summer,2015],[summer,2010]). 
