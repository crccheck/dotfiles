#
# $IPYTHONDIR is typically something like /Users/crc/env/tt/.ipython
#
if [ -n $IPYTHONDIR ]; then
    DST=$IPYTHONDIR/profile_default
    if [ ! -e $DST/ipython_config.py ]; then
        echo "Copying ipython config into $DST"
        SOURCE=$(pwd)
        mkdir -p $DST
        cd $DST
        ln -s $SOURCE/ipython_config.py
    else
        echo "ipython_config.py already exists"
    fi
else
    echo "IPYTHONDIR is not set"
fi
