INPUT=new.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

INPUT2=aa-employee.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT2 ] && { echo "$INPUT2 file not found"; exit 99; }
while read idx oldId newId
do
	echo "oldId : $oldId"
	echo "newId : $newId"
done < $INPUT
IFS=$OLDIFS