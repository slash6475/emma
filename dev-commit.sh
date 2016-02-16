#/bin/bash

PATH_ORI=`pwd`
echo $PATH_ORI


echo "PROJECT : emma-cooja "
echo "---------------------"
PATH_COOJA_WORKSPACE="emma-cooja/"
PATH_COOJA_GIT="src/emma-cooja/src/"

echo -e "Differing working directory($PATH_COOJA_WORKSPACE) and git directory ($PATH_COOJA_GIT)"

cd $PATH_ORI/$PATH_COOJA_WORKSPACE/tools/cooja/
ant clean
cd $PATH_ORI
diff -crBq $PATH_COOJA_WORKSPACE $PATH_COOJA_GIT
while true; do
    read -p "Do you want to push this data ? [N, y]" yn
    case $yn in
        [Yy]* ) 
			cp -r $PATH_COOJA_WORKSPACE/* $PATH_COOJA_GIT
			cd $PATH_COOJA_GIT
			git commit -a 
			cd $PATH_ORI
        	break;;
        [Nn]* ) ;;
        * ) 	break;;
    esac
done


echo -e "PROJECT : emma-node "
echo -e "---------------------"
cd emma-node/examples/emma-node-example/
rm -rf obj*
rm -rf *.avr-raven
make clean
cd $PATH_ORI

diff -crBq emma-node/apps/emma-node/ src/emma-node/src/apps/emma-node/
diff -crBq emma-node/examples/emma-node-example/ src/emma-node/src/examples/emma-node-example/
while true; do
    read -p "Do you want to push this data ? [N, y]" yn
    case $yn in
        [Yy]* ) 
			cp -r emma-node/apps/emma-node/* src/emma-node/src/apps/emma-node/
			cp -r emma-node/examples/emma-node-example/* src/emma-node/src/examples/emma-node-example/

			cd src/emma-node
			git commit -a 
			cd $PATH_ORI
        	break;;
        [Nn]* ) ;;
        * ) 	break;;
    esac
done




PATH_AGENT_LOADER_WORKSPACE="emma-agent-loader/java"
PATH_AGENT_LOADER_GIT="src/emma-agent-loader/src/emma-agent-loader/java"
echo -e "PROJECT : emma-agent-loader "
echo -e "---------------------"

echo -e "Cleaning directory $PATH_AGENT_LOADER_WORKSPACE"
cd $PATH_AGENT_LOADER_WORKSPACE
ant clean
ant clean_libs
cd $PATH_ORI

echo -e "Differing working directory($PATH_AGENT_LOADER_WORKSPACE) and git directory ($PATH_AGENT_LOADER_GIT)"
diff -crB $PATH_AGENT_LOADER_WORKSPACE $PATH_AGENT_LOADER_GIT
diff -crB $PATH_AGENT_LOADER_WORKSPACE/../build.xml $PATH_AGENT_LOADER_GIT/../build.xml
while true; do
    read -p "Do you want to push this data ? [N, y]" yn
    case $yn in
        [Yy]* ) 
			cp -r $PATH_AGENT_LOADER_WORKSPACE/* $PATH_AGENT_LOADER_GIT
			cp -r $PATH_AGENT_LOADER_WORKSPACE/../build.xml $PATH_AGENT_LOADER_GIT/../build.xml

			cd $PATH_AGENT_LOADER_GIT
			git commit -a 
			cd $PATH_ORI
        	break;;
        [Nn]* ) ;;
        * ) 	break;;
    esac
done

