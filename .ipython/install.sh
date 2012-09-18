if [ ! -z $IPYTHONDIR ]; then
    SOURCE=$(pwd)
    mkdir -p $IPYTHONDIR
    cd $IPYTHONDIR
    ln -s $SOURCE/ipython_config.py
fi
