#!/bin/bash
if [ $# -eq 0 ];then
echo "Expected arguments, please check the help : initdev –help" 
elif [ $# -eq 1 ];then  
if [ "$1" = "-Name" ];then 
echo "Nom de l'application : initdev ";
echo "Description : le but de l'application initdev est de créer un programme initiale selon le besoin de l'utilisateur ";
elif [ "$1" = "-help" ];then 
echo "Arguments:" ;
echo "-Name : Afficher le nom de l’application et une petite description."
echo "-Syntax : Afficher la syntaxe d’utilisation de la commande initdev."
echo "-args : Lister les arguments et donner une description de chaque argument."
echo "-author : Afficher le nom et l’email de l’auteur de l’application." 
elif [ "$1" = "-Syntax" ];then
echo "Syntaxes d'utilisations: "
echo "  initdev [commande : -help , -Name , -Syntax , -args , -author ] "
echo " initdev [nom] "
echo " initdev [nom] [langage/licence]"
echo " initdev [nom] [langage/licence/git] [langage/licence/git]"
echo " initdev [nom] [langage/licence/git] [langage/licence/git] [langage/licence/git]"	
elif [ "$1" = "-args" ];then
echo "Arguments : 
-help	:	affiche l'aide
-Name	:	affiche le nom de l'application 
-Syntax	:	affiche les syntaxes d'utilisation de la commande
-args	:	affiche tous les arguments possible pour l'application
-author	:	affiche le nom et l'e-mail de l'auteur de l'application
-C	:	Projet en langage C
-Py	:	Projet en langage Python
-Cpp ou -C++	:	Projet en langage C++ 
-Latex	:	Projet de rédaction en Latex
-BEAMER	:	Projet de rédaction en BEAMER
-GPL	:	Projet avec une licence GENERAL PUBLIC LICENSE
-MIT	:	Projet avec une licence MIT
-git	:	ajoute un fichier .gitignore et un depot git dans le repertoire du projet"
elif [ "$1" = "-author" ];then 
echo "Auteur: BENRABIA Rachid "
echo "E-mail: sasuke_rachid@live.fr"
else 
mkdir "$1"
touch "$1"/main
touch "$1"/LICENSE  
touch "$1"/makefile 
fi
else
if [ $# -eq 2 ];then 
if [ "$2" = "-C" ];then 
mkdir "$1" ;
cp  home/"$USER"/.initdev/sources/main.c "$1"/ 
touch "$1"/LICENSE ;
touch "$1"/Makefile ;
elif [ "$2" = "-CPP" ] || [ "$2" = "-C++" ] ;then
mkdir "$1" ;
cp home/"$USER"/.initdev/sources/main.cpp "$1"/ 
touch "$1"/LICENSE ;
touch "$1"/Makefile ;
elif [ "$2" = "-Py" ];then 
mkdir "$1" ;
cp /home/"$USER"/.initdev/sources/main.py "$1"/ 
touch "$1"/LICENSE ;
touch "$1"/Makefile ;
elif [ "$2" = "-Latex" ];then  
mkdir "$1" ;
cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
mv "$1"/latexMin.tex "$1"/Main.tex
touch "$1"/LICENSE ;
touch "$1"/Makefile ;
elif [ "$2" = "-BEAMER" ];then 
mkdir "$1" ;
cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
mv "$1"/beamer.tex "$1"/Main.tex
touch "$1"/LICENSE ;
touch "$1"/Makefile ;
elif [ "$2" = "-GPL" ];then 
mkdir "$1" ; 
touch "$1"/main ;
cp /home/"$USER"/.initdev/licenses/GPL "$1"/
mv "$1"/GPL "$1"/LICENSE
touch "$1"/Makefile ;
elif [ "$2" = "-MIT" ];then 
mkdir "$1" ; 
touch "$1"/main ;
cp /home/"$USER"/.initdev/licenses/MIT "$1"/
mv "$1"/MIT "$1"/LICENSE	
touch "$1"/Makefile ;
fi 
elif [ $# -eq 3 ];then 
a="$2"
b="$3"
if [ "$2" = "$3" ];then
echo "Erreur vous avez entrer deux fois le même arguments "
elif [ "$2" = "-GPL" ] || [ "$2" = "-MIT" ] || [ "$2" = "-git" ] || [ "$3" = "-C" ] || [ "$3" = "-Cpp" ] || [ "$3" = "-C++" ] || [ "$3" = "-Py" ] || [ "$3" = "-Latex" ] || [ "$3" = "-BEAMER" ]  ;then
a="$3"
b="$2"
fi 
mkdir "$1" ;
if [ "$a" = "-C" ];then 
cp  /home/"$USER"/.initdev/sources/main.c "$1"/ 
elif [ "$a" = "-Cpp" ] || [ "$a" = "-C++" ];then
cp /home/"$USER"/.initdev/sources/main.cpp "$1"/
elif [ "$a" = "-Py" ];then
cp /home/"$USER"/.initdev/sources/main.py "$1"/
elif [ "$a" = "-Latex" ];then
cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
mv "$1"/latexMin.tex "$1"/Main.tex
elif [ "$a" = "-BEAMER" ];then				
cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
mv "$1"/beamer.tex "$1"/Main.tex
else
echo "You must set project type, please check the help : initdev -help";					
fi
if [ "$b" = "-GPL" ];then
cp /home/"$USER"/.initdev/licenses/GPL "$1"/
mv "$1"/GPL "$1"/LICENSE
touch "$1"/Makefile ;
elif [ "$b" = "-MIT" ];then
cp /home/"$USER"/.initdev/licenses/MIT "$1"/
mv "$1"/MIT "$1"/LICENSE
touch "$1"/Makefile ;
elif [ "$b" = "-git" ] ;then
if [ "$a" = "-C" ];then
cd "$1"/
git init
cd ../
touch "$1"/LICENSE
touch "$1"/makefile
cp /home/"$USER"/.initdev/gitignores/c "$1"/
mv "$1"/c "$1"/.gitignores
elif [ "$a" = "-Cpp" ] || [ "$a" = "-C++" ];then
cd "$1"/
git init
cd ../
touch "$1"/LICENSE
touch "$1"/makefile
cp /home/"$USER"/.initdev/gitignores/"cpp" "$1"/
mv "$1"/"cpp" "$1"/.gitignore
elif [ "$a" = "-Py" ];then
cd "$1"/
git init
cd ../
touch "$1"/LICENSE
touch "$1"/makefile
cp /home/"$USER"/.initdev/gitignores/python "$1"/
mv "$1"/python "$1"/.gitignore
elif [ "$a" = "-Latex" ] || [ "$a" = "-BEAMER" ];then
cd "$1"/
git init
cd ../
touch "$1"/LICENSE
touch "$1"/makefile
cp /home/"$USER"/.initdev/gitignores/tex "$1"/
mv "$1"/tex "$1"/.gitignore	
fi
else
echo "Uknown arguments, please check the help : initdev –help" ;
if [ -d $1 ]; then
rm -r $1
fi
fi
elif [ $# -eq 4 ] ; then
a="$2"
b="$3"
c="$4"
if [ "$2" = "$3" ] || [ "$2" = "$4" ] || [ "$4" = "$3" ];then
echo " erreur: vous avez repeter le meme argument "
else
if [ "$2" = "-GPL" ] || [ "$2" = "-MIT" ]  ;then
b="$2"
else
if [ "$2" = "-git" ];then
c="$2";
fi
fi
if [ "$3" = "-C" ] || [ "$3" = "-Cpp" ] || [ "$3" = "-C++" ] || [ "$3" = "-Py" ] || [ "$3" = "-Latex" ] || [ "$3" = "-BEAMER" ];then	
a="$3"
else
if [ "$3" = "-git" ];then
c="$3"
fi
fi
if [ "$4" = "-C" ] || [ "$4" = "-Cpp" ] || [ "$4" = "-C++" ] || [ "$4" = "-Py" ] || [ "$4" = "-Latex" ] || [ "$4" = "-BEAMER" ];then
a="$4"
elif [ "$4" = "-GPL" ] || [ "$4" = "-MIT" ]; then
b="$4"
fi
fi
mkdir "$1" ;
if [ "$arg2" = "-C" ];then
				
			cp  /home/"$USER"/.initdev/sources/main.c "$1"/ 
			elif [ "$a" = "-Cpp" ] || [ "$a" = "-C++" ];then
			cp /home/"$USER"/.initdev/sources/main.cpp "$1"/
			elif [ "$a" = "-Py" ];then
			cp /home/"$USER"/.initdev/sources/main.py "$1"/
			elif [ "$a" = "-Latex" ];then
						
			cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
			mv "$1"/latexMin.tex "$1"/Main.tex
			elif [ "$a" = "-BEAMER" ];then
						
			cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
			mv "$1"/beamer.tex "$1"/Main.tex
			else
			echo "You must set project type, please check the help : initdev -help";
			
fi	
if [ "$b" = "-GPL" ];then
				cp /home/"$USER"/.initdev/licenses/GPL "$1"/
				mv "$1"/GPL "$1"/LICENSE
				touch "$1"/Makefile ;
				elif [ "$b" = "-MIT" ];then
					cp /home/"$USER"/.initdev/licenses/MIT "$1"/
					mv "$1"/MIT "$1"/LICENSE
					touch "$1"/Makefile ;
				else "unknown license type, project set to be without specified license ,check the help for more infos  : initdev -help" 
fi	fi
if [ "$c" = "-git" ] ;then
		if [ "$a" = "-C" ];then
cd "$1"/
git init
cd ../
touch "$1"/LICENSE
touch "$1"/makefile	
cp /home/"$USER"/.initdev/gitignores/c "$1"/
mv "$1"/c "$1"/.gitignores
elif [ "$a" = "-Cpp" ] || [ "$a" = "-C++" ];then	
cd "$1"/ 	git init						cd ../				touch "$1"/LICENSE
touch "$1"/makefile							cp /home/"$USER"/.initdev/gitignores/"cpp" "$1"/	mv "$1"/"cpp" "$1"/.gitignore
elif [ "$a" = "-Py" ];then
cd "$1"/
git init			cd ../				touch "$1"/LICENSE		touch "$1"/makefile cp /home/"$USER"/.initdev/gitignores/python "$1"/								mv "$1"/python "$1"/.gitignore				
elif [ "$a" = "-Latex" ] || [ "$a" = "-BEAMER" ];then		
cd "$1"/		git init		cd ../	touch "$1"/LICENSE	touch "$1"/makefile	cp /home/"$USER"/.initdev/gitignores/tex "$1"/
		mv "$1"/tex "$1"/.gitignore				fi
						else	echo "Uknown arguments, please check the help : initdev –help" ;	if [ -d $1 ]; then
rm -r $1
	fi	fi
							fi fi	


