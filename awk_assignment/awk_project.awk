#Joshua Lilly G00561467
#CS 332 AWK assignment
# Tested on zeus

#Start by building the key (index)
# Check to see if the persons name is the first part of the record
{
if($1 ~ /[A-Za-z]/ && $3 ~ /\.[0-9][0-9]$/){
    # If the name was the first part determine if first or last name comes first.
    if($1 ~ /,$/)
    {
        # Remove the comma from the last name
        last = substr($1, 0, length($1)-1)
        first = $2
        key = first"-"last
    }
    else
    {
        key = $1"-"$2
    }
    array[key] += $3
}
#else the names must be at the end of the record
else if ($3 ~ /[A-Za-z]/ && $1 ~ /\.[0-9][0-9]$/)
{
    # is the third record the last name?
    if($2 ~ /,$/)
    {
        last = substr($2, 0, length($2)-1)
        first = $3
        key = first"-"last
    }
    else
    {
        key = $2"-"$3
    }
    array[key] += $1
}

}
END {
    for (var in array)
    {
        split(var, name, "-")
        printf(name[1]" "name[2]" $%.2f\n", array[var])
    }
}
