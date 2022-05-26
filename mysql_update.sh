#!/bin/bash
[ $# -lt 3 ] && echo "Usage: $(basename $0) <DB_HOST> <DB_USER> <DB_NAME> <TABLE> <CHANGE_COLUMN> <WHERE_COLUMN>" && exit 1

DB_host=$1
DB_user=$2
DB=$3
TABLE=$4
CHANGE_COLUMN=$5
WHERE_COLUMN=$6

echo "host $DB_host"
echo "user $DB_user"
echo "db $DB"
echo "table $TABLE"
echo "changecol $CHANGE_COLUMN"
echo "WHERE_COLUMN $WHERE_COLUMN"

# echo -n "DB password: "
# read -s DB_pass
DB_pass="pass"

INPUT=new.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read idx oldId newId
do
	echo "oldId : $oldId"
	echo "newId : $newId"
	echo "UPDATE $TABLE SET $CHANGE_COLUMN = '$newId' WHERE $WHERE_COLUMN='$oldId'"
    mysql -h $DB_host -u $DB_user -p$DB_pass $DB -e "
		SET character_set_client='utf8';
		SET character_set_connection='utf8';
		SET character_set_results='utf8';
		UPDATE $TABLE SET $CHANGE_COLUMN = '$newId' WHERE $WHERE_COLUMN='$oldId';"
done < $INPUT
IFS=$OLDIFS