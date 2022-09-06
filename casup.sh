if [ ! "$1" && ! "$2" ]
then
	echo $0" <CAS host> <CAS port>";
	exit
fi

python3 py/casup.py $1 $2
