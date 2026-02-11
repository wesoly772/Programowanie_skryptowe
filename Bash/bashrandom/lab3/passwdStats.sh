#Z1
mkdir $1
#Z2
grep "$(whoami)" /etc/passwd
#Z3
cat /etc/passwd | cut -d ":" -f1,6,7 | sort -r > $1/F1.csv
#Z4
cat /etc/passwd | cut -d ":" -f7 | rev | sort | rev | uniq > $1/F2.csv
#Z5
cat /etc/passwd | cut -d ":" -f1 | tr a-z A-Z > $1/F3.txt
#Z6
grep "kali" /etc/passwd -A4 -B4 > $1/F4.txt
#Z7
diff -y /etc/passwd $1/F4.txt > $1/differences.txt