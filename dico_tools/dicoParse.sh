#!/bin/sh
IFS=$'\n\r'
export AllPwd=()
export ThisFile=()
indexFile=0;
index_i=0;
pwd=0;

##lecture de toute la wordlist decoupe la wordlist par 3 mot de passe par fichier 

cat dico.txt | while  read ligne ; do
	if !((index_i % 3)); then
	  	indexFile=$(($index_i / 3))
	fi
  	echo ${ligne} >> ./$indexFile
	index_i=$(($index_i + 1))
done
