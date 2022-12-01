#!/bin/bash
##########
# 	AUTHOR
#			 nzz0x
#	WHAT IT DOES?
#			Verify the file's total line to check if it is still being updated
#	HOW TO USE
#			call checkWhenDone passing a file
#		 	./checkWhenDone.sh file1.log
##########

########################################
# CHANGE HERE ACCORDING YOUR DESIRED
timeInSecconds=1

####Spiners styles, choose one!
#spiner=('\t\t\t-' '\t\t\t\\' '\t\t\t|' '\t\t\t/')
spiner=('' '.' '..' '...' '' '.' '..' '...')
########################################

file=$1
# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
clear='\033[0m'

checkIfFileExists(){
	if [ ! -f $file ]; then
    	echo -e "${red}File not found!${clear}"
    	exit 1
	fi
}

checkWhenDone(){
	fileLines=$(wc -l $file | awk '{ print $1 }')
	while true;
	do
		for sp in ${spiner[@]}
		do
			echo -ne "Total line file is ${yellow}${fileLines}${clear} now$sp\033[0K\r" #update totalLine without '\n'
			sleep $timeInSecconds
		done
		fileLinesUpToDate=$(wc -l $file | awk '{ print $1 }')
		if [[ $fileLines -eq $fileLinesUpToDate ]]; then
			break
		fi
		fileLines=$fileLinesUpToDate
	done
	doBeep
}

doBeep(){
	echo -e "\a" # Do a beep!
}

main(){
	echo -e "checking when ${green}${file}${clear} file is done (wait!)"
	checkIfFileExists
	checkWhenDone
}
main $@
#EOF