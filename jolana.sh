#!/bin/bash
output_lines=0;
output_lines_prev=0;
nick=$(sed -n '1p' $HOME/.jolana/config);
place=$(sed -n '2p' $HOME/.jolana/config);
input_file="$HOME/.jolana/$(sed -n '3p' $HOME/.jolana/config)";
output_file="$HOME/.jolana/$(sed -n '4p' $HOME/.jolana/config)";
whole_cm="$HOME/.jolana/$(sed -n '5p' $HOME/.jolana/config)";
hist="$HOME/.jolana/$(sed -n '6p' $HOME/.jolana/config)";
clear;
cat ~/.jolana/bunny$(($RANDOM % 4));
cat /dev/null > $input_file;
cat /dev/null > $output_file;
cat /dev/null > $whole_cm;
while [ true ]; do
	cat $whole_cm;
	echo "[JOLANA] >"; read -e input;
	case $input in
		/help | /h)
			cat ~/.jolana/jolanahelp;
			read -e input
		;;

		/nick | /n)
			echo "[JOLANA] ENTER NEW NICKNAME : ";
			read -e input;
			nick=$input;
			sed "1s/.*/$input/" < config > config_backup
			cat config_backup > config

		;;

		/place | /p)
			echo "[JOLANA] ENTER NEW PLACE : ";
			read -e input;
			place=$input;
			sed "2s/.*/$input/" < config > config_backup;
			cat config_backup > config
		;;

		/exit | /e)
			echo "[JOLANA] Save this conversation? [Y/N]";
			read -e input;
			case "$input" in
				y | Y )
					cat $whole_cm >> $hist;
					cat /dev/null > $whole_cm;
					cat /dev/null > $output_file;
					cat /dev/null > $input_file
				;;
				*)
					cat /dev/null > $whole_cm;
					cat /dev/null > $output_file;
					cat /dev/null > $input_file
			esac
			echo "[JOLANA] Exiting, have a nice day.";
			break
		;;		

		/history | /hist)
			cat $hist;
			echo "[JOLANA] This is your history, do you want to erase it?[Y/N]";
			read -e input;
			case "$input" in
				y | Y )
					cat /dev/null > $hist
				;;

				*)
				
			esac	

		;;		 
			
		*)	
			output_lines=$(wc -l $input_file);
			if [ $output_lines -gt $output_lines_prev ]; then
				tail --lines=$(($output_lines - $output_lines_prev)) $input_file >> $whole_cm; 
				$output_lines_prev=$output_lines;
			fi
			echo "$(date)  $nick@$place : $input" >> $whole_cm;
			echo "$(date)  $nick@$place : $input" >> $output_file;
	esac
	clear;
done
