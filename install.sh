#!/bin/bash

THIS=$( cd "$( dirname "$0" )" && pwd )
REPO=http://git.duhart-clement.fr:4223/emma

function uninstall {
	if [[ -z $DEST_INSTALL ]]
		then
		echo "You should specify destination installation folder to remove"
		exit
	fi


	while true; do
    	read -p "Do you want to uninstall workspace $DEST_INSTALL ? [N, y]" yn
    	case $yn in
        	[Yy]* ) 
				break ;;
        	* ) exit;;

	    esac
	done
	rm -rf $DEST_INSTALL/emma-agent-loader/
	rm -rf $DEST_INSTALL/emma-node/
	rm -rf $DEST_INSTALL/emma-cooja/
	rm -rf $DEST_INSTALL/doc/
	rm -rf $DEST_INSTALL/simulations/
	rm -rf $DEST_INSTALL/network.sh
	echo "DONE"
}

function install {
	if [[ -z $DEST_INSTALL ]]
		then
		echo "You should specify destination installation folder"
		exit
	fi

	if [[ -z $DEST_SOURCE ]]
		then
		echo -e "=======================\n"
		echo -e "GIT Repository download\n"
		echo -e "=======================\n"
		echo -e "Repository access : $REPO "
		DEST_SOURCE=$DEST_INSTALL/src
		rm -rf $DEST_INSTALL/src
		mkdir $DEST_SOURCE

		echo -e "Repository access : $REPO/emma-node.git "
		echo -e "==================="
		git clone $REPO/emma-node.git $DEST_SOURCE/emma-node/
		echo -e ""
		echo -e "Repository access : $REPO/emma-cooja.git "
		echo -e "==================="
		git clone $REPO/emma-cooja.git $DEST_SOURCE/emma-cooja/
		echo -e ""
		echo -e "Repository access : $REPO/emma-agent-loader.git "
		echo -e "==================="
		git clone $REPO/emma-agent-loader.git $DEST_SOURCE/emma-agent-loader/
		echo -e ""
	fi

	# Install Node
	echo -e ""
	echo -e "===========================\n"
	echo -e "Node framework installation\n"
	echo -e "===========================\n"
	echo -e ""
	mkdir $DEST_INSTALL/emma-node
	bash $DEST_SOURCE/emma-node/install.sh $DEST_INSTALL/emma-node

	# Install Cooja
	echo -e ""
	echo -e "=========================\n"
	echo -e "COOJA Simulation patching\n"
	echo -e "=========================\n"
	echo -e ""
	mkdir $DEST_INSTALL/emma-cooja
	bash $DEST_SOURCE/emma-cooja/install.sh $DEST_INSTALL/emma-cooja

	# Install Loader
	echo -e ""
	echo -e "=========================\n"
	echo -e "Agent loader installation\n"
	echo -e "=========================\n"
	echo -e ""
	mkdir $DEST_INSTALL/emma-agent-loader
	bash $DEST_SOURCE/emma-agent-loader/install.sh $DEST_INSTALL/emma-agent-loader
	cd $DEST_INSTALL/

	# Package installation
	echo -e ""
	echo -e "=========================\n"
	echo -e "Package installation\n"
	echo -e "=========================\n"
	echo -e ""
	echo -e "Local root password :"
	sudo apt-get install avr-libc gcc-avr gdb-avr avrdude gksu ant openjdk-6-jdk
	echo -e ""
	echo -e "\nInstall complete.\n"
}


##############################################
usage()
{
cat << EOF
	usage: 
		install.sh [options] -dDEST_FOLDER 
			DEST_INSTALLINATION: The location of a Contiki directory (David Kopf branch)

	Options:
		-h, --help            : help menu
		-s, --src=FOLDER   : A local folder containing the git repo of EMMA projects
		-d, --dest=FOLDER     : A local folder to install workingspace
		-u, --uninstall       : Uninstall process
EOF
}


##############################################
# Argument extraction
##############################################
UNINSTALL=false;
if ! options=$(getopt -o hs:d:u -l help,src:,dest:,uninstall -- "$@")
then
    exit 1
fi
set -- $options
while [ $# -gt 0 ]
do
     case $1 in
         -h|--help)
             usage
             exit 1
             ;;
         -s|--src)
             DEST_SOURCE=`echo $2 | sed "s/'//g"`
             ;;
         -d|--dest)
			 DEST_INSTALL=`echo $2 | sed "s/'//g"`
			 ;;
		 -u|--uninstall)
		     UNINSTALL=true;
		     ;;
 			 
         ?)
             usage
             exit
             ;;
     esac
     shift
done


##############################################
if [[ $UNINSTALL = true ]]
	then
	uninstall

else 
	install
fi



if [[ -z $DEST_INSTALL ]]
then
     usage
     exit 1
fi

