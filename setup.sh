#!/bin/bash
clear;
echo "[>--] Welcome to installation of JOLANA, this script will create";
echo "[>--] necessary files and guide you trough configuration. As first, ";
echo "[>--] script will create file .jolana in your homedir ($HOME) and save";
echo "[>--] all the configuratin there. Is it OK?[Y/N]"
read -e input;
case "$input" in 
	y | Y )
		./config.sh
	;;

	*) 
		echo "[>--] Why do you even run the setup, moron. ";
		exit;
esac
