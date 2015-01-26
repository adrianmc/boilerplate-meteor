#!/bin/bash

# Packages to install
declare -a packages=(
	underscore
	ewall:foundation
	stylus
	iron:router
	)

# DON'T TOUCH ANYTHING BELOW THIS LINE
#
#
#
#

function getScriptPath()
{
	# attribution: http://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script
	MY_PATH="`dirname \"$0\"`"              # relative
	MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
	if [ -z "$MY_PATH" ] ; then
	  # error; for some reason, the path is not accessible
	  # to the script (e.g. permissions re-evaled after suid)
	  exit 1  # fail
	fi
	scriptPath="$MY_PATH"
}
getScriptPath

# echo $scriptPath

# Check to make sure a project name is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided, please provide a project name"
    exit 1
fi

# Create meteor app and remove generated files
printf "\nProject Name: $1\n\n"
echo "Creating meteor project..."
meteor create $1 &> /dev/null
cd $1
echo "Removing generated files..."
rm $1.css $1.html $1.js

# Install packages (suppress output)
echo "Installing custom packages..."
for t in "${packages[@]}"
do
	echo "    Installing: $t"
	meteor add $t &> /dev/null	
done

# Setting up file structure
echo "Setting up file structure..."
mkdir client server lib public packages

# Copying over client and lib files and folders
cp -r $scriptPath/client .
cp -r $scriptPath/lib .

# Server stuff
cd server
	touch fixtures.js publications.js
cd ..

# Public stuff - static files like images
cd public
	mkdir images
cd ..

printf "\nDone!\n"