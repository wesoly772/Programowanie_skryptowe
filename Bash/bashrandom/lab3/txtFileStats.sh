#Z3.1
file $1
#Z3.2
wc -l $1
#Z3.3
wc -m $1 
#Z3.4
du -h $1
#Z3.5
grep "$2" $1 | wc -l 
#Z3.6
grep -v "$2" $1 | wc -l
#Z3.7
cat $1 | head -5 | tail -1