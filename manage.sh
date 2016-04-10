#!/bin/bash

##
# This script makes it easier to execute the management commands for Stackdump Python front-end.
#
# Run without parameters to get a list of commands.
##

COMMANDS_DIR=src/python

if [ -z "$1" ]
then
    echo "Stackdump management commands:"
    echo -e "\tdownload_site_info"
    echo -e "\timport_site"
    echo -e "\tmanage_sites"
    echo ""
    echo "Execute $0 command to run it, e.g. $0 manage_sites"

else
    # look for command
    command="$COMMANDS_DIR/$1.py"
    if [ ! -e $command ]
    then
        echo "The command $1 does not exist. Run without any parameters to list commands."
        exit 1
    fi

    # shift off the command name so we don't pass it on
    shift

    python $command "$@"
fi
