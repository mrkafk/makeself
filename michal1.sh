#!/bin/bash

thx="dzieki"

cd /home
echo "Podaj nazwe katalogu do stworzenia:"
read katalog

	if [ -d /home/$katalog ] ; then
		echo "Katalog o nazwie $katalog istnieje"
	else
		mkdir $katalog
		echo "Katalog o nazwie $katalog nie istnieje, ale utworzyłem go dla Ciebie mistrzu :)"
	fi

cd $katalog
echo "Teraz tworzymy plik. Podaj nazwe pliku:"
read plik

	if [ -e $plik ] ; then
		echo "Plik o nazwie $plik juz istnieje. Idziemy dalej"
	else
		touch $plik
		echo "Plik o nazwie $plik nie istnieje, ale utworzylem go juz dla Ciebie :)"
read thanks
	until [ "$thanks" == "$thx" ]; do
		echo "Nie podziekowales! Podziekuj! Wystarczy zwykle slowo - dzieki:"
read thanks
	done
		echo "Bardzo prosze"
	fi
clear

echo "Kolejna czesc otwiera mozliwosc edycji utworzonego pliku. Wybierz opcje:"
	
	while [[ "$thanks" == "0" || "thanks" != "0" ]] ; do
	echo "1. Edytuj plik - Vi Edytor"
	echo "2. Usun plik"
	echo "3. Wyjdz i nic nie rob"
	read numer
		if [ "$numer" == "1" ]; 
		then
			echo "Wybrales Edycje - Vi Edytor "
			vi /home/$katalog/$plik
		elif [ "$numer" == "2" ]; 
		then
			echo "Wybrales Usuniecie. Jestes pewny ze chcesz usunac?"
			echo "Potwierdz y lub Y nacisniecie innego klawisza spowoduje anulowanie"
			read y
				if [[ "$y" == y || "$y" == Y ]]; 
				then
					rm /home/$katalog/$plik
					echo "Plik o nazwie $plik zostal usuniety. Wybierz kolejna opcje:"
						while [[ "$y" == y || "$y" == Y ]]; do
							echo "1. Utworz nowy plik"
							echo "2. Wyjdz"
							echo "Wybierz z powyzszego menu cyfre:"
							read nowy
							if [ "$nowy" == "1" ];
							then
								echo "Podaj nazwe nowego pliku:"
								read nazwa1
									until  [ "$nazwa1" != "" ]; do
								 		echo "Nie oszukasz skryptu ;) Musisz podac nazwe pliku"
									read nazwa1
										echo "Tworzysz nowy plik o nazwie: $nazwa1"
										touch /home/$katalog/$nazwa1
									done
							elif [ "$nowy" == "2" ];
							then
								echo "Nie tworzysz nic i wychodzisz"
								exit
							elif [ "$nowy" == "0" ];
							then
								echo "Nie podales nazwy pliku. Zrob to jeszcze raz!"
							else 
								clear
								echo "Niepoprawny wybor! Wybierz jeszcze raz:"
							fi

						done
									
					else
				echo "Anulowales proces usuwania"

				fi
		elif [ "$numer" == "3" ];
		then
			echo "Wybrales opcje nr 3 - wyjscie. Dowidzenia. Zamknalem program."
			exit
		else 
			echo "Nic nie wybrales! Musisz wybrac ktoras z cyfr:"
		fi
	done

