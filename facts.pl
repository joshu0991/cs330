approved_list(cs,[cs211,cs330,cs450,cs480,phys211,phys212]).
approved_list(geog,[geol101,geog309,eos310,eos312,math113]).

before(spring,summer).
before(summer,fall).

prereq(cs211,cs330).
prereq(cs330,cs450).
prereq(cs450,cs480).

prereq(phys211,phys212).

prereq(geol101,geol309).
prereq(eos310,eos312).

student(bob,12345,cs).
student(sally,14511,cs).
student(john,54321,geog).
    entry(12345,cs330,[fall,2008]).
    entry(12345,cs211,[summer,2008]).
    entry(12345,geol101,[summer,2008]).

    entry(54321,geog101,[spring,2008]).
    entry(54321,cs330,[spring,2008]).
    
    entry(14511,cs330,[fall,2008]).
    entry(14511,cs211,[fall,2008]).
    entry(14511,phys211,[fall,2008]).
    entry(14511,phys212,[fall,2009]).
