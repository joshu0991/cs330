/*
 * The lists of approved classes for a major
 */
approved_list(cs,[cs211,cs330,cs450,cs480,phys211,phys212]).
approved_list(geog,[geol101,geog309,eos310,eos312,math113]).

/*
 * Def. which sessons are before and after
 */
before(spring,summer).
before(summer,fall).

/*
 * Define some prerequisites.
 */
prereq(cs211,cs330).
prereq(cs330,cs450).
prereq(cs450,cs480).

prereq(phys211,phys212).

prereq(geol101,geol309).
prereq(eos310,eos312).

/*
 * Three students bob and sally are cs majors
 * john is a geography major
 * bob is registered for cs 480 which he doesn't have a prereq for.
 * john is registered for cs 330 which isn't a class he can take since
 * he isn't a cs major and he doesn't have the prereq for it anyway...
 * sally doesn't have any conflicts.
 */
student(bob,12345,cs).
student(sally,14511,cs).
student(john,54321,geog).

    entry(12345,cs480,[fall,2008]).
    entry(12345,cs211,[summer,2008]).
    entry(12345,geol101,[summer,2008]).

    entry(54321,geog101,[spring,2008]).
    entry(54321,cs330,[spring,2008]).
    entry(54321,eos312,[spring,2008]).
    
    entry(14511,cs330,[fall,2008]).
    entry(14511,cs211,[fall,2008]).
    entry(14511,phys211,[fall,2008]).
    entry(14511,phys212,[fall,2009]).
