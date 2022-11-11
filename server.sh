#!/bin/bash


PORT="2223"

echo "Server Transfer Unite Recursive International Protocol: TURIP"

echo "(0) LISTEN: Handshake"
MSG=`nc -l $PORT`

HANDSHAKE=`echo $MSG | cut -d " " -f 1`
IP_CLIENT=`echo $MSG | cut -d " " -f 2`


echo "(3) SEND: COMPROBACION"

if [ "$HANDSHAKE" != "HOLI_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"

	echo "KO_TURIP" | nc $IP_CLIENT $PORT
	exit 1
fi

	echo "OK_TURIP" | nc $IP_CLIENT $PORT

echo "(4) LISTEN"

MSG=`nc -l $PORT`

FILE_NAME=`echo $MSG | cut -d " " -f 1`
PREFIX=`echo $MSG | cut -d " " -f 2`


echo "(7) LISTEN"

if [ "$FILE_NAME" != "FILE_NAME" ]
then

	echo "Error 2: FILE_NAME incorrecto"
	echo "KO_FILE_NAME" | nc $PREFIX
	exit 2
fi

echo "OK_FILE_NAME"



echo "(8) LISTEN"

nc -l $PORT > inbox/$FILE_NAME



exit 0
