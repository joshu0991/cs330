#Joshua Lilly G00561467
#CS 332 AWK assignment
# Tested on zeus

# Start by building the key (index)
# This is case 1 where the first and last name are in some configuration in $1 and $2
$1 ~ /[A-Za-z]/ && $2 ~ /[A-Za-z]/ && $3 ~ /\.[0-9][0-9]$/{

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

# This is the second case where the persons name is in some configuration in $3 and $2
$3 ~ /[A-Za-z]/ && $2 ~ /[A-Za-z]/ && $1 ~ /\.[0-9][0-9]$/{
    if($2 ~ /,$/)
    {
        # Remove the comma from the last name
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

END {
    for (var in array)
    {
        split(var, name, "-")
        printf(name[1]" "name[2]" $%.2f\n", array[var])
    }
}
