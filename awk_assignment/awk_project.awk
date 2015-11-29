#Start by building the key (index)
# Check to see if the persons name is the first part of the record
{
if($1 ~ /[A-Za-z]/){
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
    print key
}
#else the names must be at the end of the record
else if ($3 ~ /[A-Za-z]/)
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
    print key
}
}
