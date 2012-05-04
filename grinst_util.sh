#!/bin/bash

resolve () {
    what=$1 ; shift
    eval echo \$$what
}


$(eval echo \$${package}_version)
usage () {
    local basicusage="usage: grinst.sh configfile"
    if [ -n "$1" ] ; then
	echo "$basicusage $1"
    else
	echo "$basicusage [command] [command options]"
    fi
    exit 1
}

error () {
    local msg=$1 ; shift
    echo "Error: $msg"
    usage $@
}

isinpath () {
    local thing=$1 ; shift

    local other="" 
    for other in $(echo $@ | tr : ' ')
    do
        if [ "$thing" = "$other" ] ; then
            echo $thing
            return
        fi
    done
    return
}
pathadd () {
    local ret=""
    local comma=""
    local thing=""
    for thing in $(echo $@ | tr : ' ')
    do
        if [ ! -d "$thing" ] ; then
            continue
        fi


        if [ -n "$(isinpath $thing $ret)" ] ; then
            continue
        fi
        ret="${ret}${comma}${thing}"
        comma=":"
    done
    echo $ret
}

assuredir () {
    local dirname=$1; shift
    if [ -d $dirname ] ; then
        echo "Already have directory: \"$dirname\""
        return
    fi
    mkdir -p $dirname
}
download () {
    local url=$1 ; shift
    local file=$(basename $url)
    if [ -f $file ] ; then
        echo "Already downloaded URL: \"$url\""
        return
    fi
    echo "Downloading $url to $(pwd)"
    wget $url
    if [ "$?" != 0 ] ; then
	echo "Download failed for $url"
	exit 1
    fi
}

untar () {
    local tarball=$1 ; shift
    local targdir=$1; shift
    if [ -n "$targdir" ] ; then
	if [ -d "$targdir" ] ; then
	    echo "Tarball directory already exists: $targdir"
	    return
	fi
    fi
    tar -xzvf $tarball
}


cvsco () {
    url=$1 ; shift
    module=$1 ; shift
    
    if [ -d "$module" ] ; then
	echo "CVS module \"$module\" already checked out"
	return
    fi

    cvs -d $url checkout $module
}


svnco () {
    url=$1 ; shift
    tgt=$1 ; shift
    if [ -d $tgt ] ; then
        echo "Already checked out svn repo $url to $tgt"
        return
    fi
    if [ ! -d ${tgt}.svn ] ; then
        svn co $url ${tgt}.svn
    fi
    mkdir $tgt
    pushd ${tgt}.svn
    tar -cf - $(find . -print | grep -v .svn) | (cd ../$tgt; tar -xf -)
    popd
}
