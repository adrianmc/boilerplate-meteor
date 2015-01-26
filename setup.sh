#!/bin/bash

# Packages to install
declare -a packages=(
	underscore
	ewall:foundation
	iron:router
	)

# DON'T TOUCH ANYTHING BELOW THIS LINE
#
#
#
#

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
	meteor add $t &> /dev/null
	echo "    Installing: $t"
done

# Setting up file structure
echo "Setting up file structure..."
mkdir client server lib public
cd client
mkdir stylesheets templates templates/includes templates/application

# Create files
touch main.html stylesheets/styles.css

printf "\nDone!\n"