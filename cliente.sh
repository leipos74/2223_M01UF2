#!/bin/bash


PORT="2223"
SERVER_AD="localhost"

echo "Cliente TURIP"

echo "(1) enviar mensage: HOLI_TURIP"

echo "HOLI_TURIP 127.0.0.1" | nc $SERVER_AD $PORT

echo "(2) LISTEN: Comprobacion handshake"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: HANDSHAKE INCORRETO"
	exit 1
fi

echo "(5) SEND_FILE: vaca.vaca"

echo "FILE_NAME vaca.vaca" | nc $SERVER_AD $PORT

echo "(6) COMPROBACION FILE_NAME: vaca.vaca"

