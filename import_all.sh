#!/bin/bash

if [ $# -lt 1 ] || [ ! -d $1 ] || [ ! -f data/sites ]
then
    echo "Usage: $0 <directory> [temp directory]"
    echo "  Please note that data/sites must exist"
    echo "  Create data/sites with: ./manage.sh download_site_info"
    exit 1
fi

PWD=`pwd`
INPUTDIR=$1
TEMPDIR=/tmp
[ $# -eq 2 ] && TEMPDIR=$2
TEMPDIR=$TEMPDIR/tmpoffstack

echo "Indexing '$INPUTDIR' with temp dir '$TEMPDIR'"

[ -d $TEMPDIR ] && rm -r $TEMPDIR
mkdir $TEMPDIR

for site in `ls $INPUTDIR`
do
    TEMPSUBDIR=$TEMPDIR/$RANDOM
    mkdir $TEMPSUBDIR

    echo "Decompressing $INPUTDIR/$site in $TEMPSUBDIR"
    7z e $INPUTDIR/$site -o$TEMPSUBDIR

    URL=`grep "${site%.*}" data/sites | grep id | cut -d '>' -f 2 | cut -d '<' -f 1`
    NAME=`grep -h1 "${site%.*}" data/sites | grep title | cut -d '>' -f 2 | cut -d '<' -f 1`
    DATE=`stat $INPUTDIR/$site | grep Modify | cut -d ' ' -f 2`
    echo "Indexing $NAME (url: $URL)"
    ./manage.sh import_site $TEMPSUBDIR -n $NAME -u $URL -c "$DATE" -Y

    rm -r $TEMPSUBDIR
done

