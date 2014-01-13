#!/bin/bash
mkdir ~/.jolana;
echo "[JOLANA] > mkdir .jolana in $HOME		[OK]";
echo "$(whoami)" > ~/.jolana/config;
echo "$(hostname)" >> ~/.jolana/config;
echo "userinput" >> ~/.jolana/config;
echo "useroutput" >> ~/.jolana/config;
echo "WHOLECM" >> ~/.jolana/config;
echo "HISTORY" >> ~/.jolana/config;
echo "This file serves for your output." > ~/.jolana/useroutput;
echo "This file serves for your input." > ~/.jolana/userinput;
echo "This file serves for whole communication temporary storage." > ~/.jolana/WHOLECM;
echo "This file serves for storing previous communications(history)." > ~/.jolana/HISTORY;
echo "[JOLANA] > make basic I/O files		[OK]";
cp bunny* ~/.jolana/;
cp jolanahelp ~/.jolana/;
echo "[JOLANA] > move adittional files		[OK]";
cp jolana /usr/local/bin;
cp jolana.sh ~/.jolana/;
echo "[JOLANA] > move jolana to /usr/local/bin 	[OK]";
echo "	-> You can now start JOLANA by typing 'jolana' into console.";


