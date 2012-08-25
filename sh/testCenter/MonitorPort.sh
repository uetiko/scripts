#!/bin/bash
#set -x
MAILTO="root"
HOSTNAME=`hostname`
getPorts(){
	lsof  -i TCP -n -P | awk '/LISTEN/{print $1"/"$3"/"$9}' | sort -u
}

OLD="$(getPorts)"
echo -e "puertos iniciales: \n"$OLD
while 
	sleep 10; 
do

NEW="$(getPorts)"
if test "$OLD" != "$NEW";
then
	echo "los puertos han sido modificados"
	#mail -s "Puertos modificados: $HOSTNAME LISTEN" $MAILTO<<EOF
	echo -e "estado inicial: \n `$OLD`\n\n"
	echo -e "estado nuevo: \n $NEW \n\n"
#	$OLD
#	EOF
#	nuevo estado:
#	$NEW
else
	echo -e "nada nuevo, descansa en paz"
	
fi
OLD="$NEW"
done
