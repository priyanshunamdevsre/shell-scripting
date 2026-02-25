#/bin/bash
echo "script to install git"
echo "Installation started"
echo $(uname)

if [ "$(uname)" = "Linux" ];
then
	echo "This is linux OS, Installing git"
	yum install git -y

elif [ "$(uname)" == "Darwin" ];
then 
	echo "This is not linux box"
	echo "This is MAC OS"
	brew install git
else
	echo "not installing"
fi