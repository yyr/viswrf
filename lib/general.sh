## some global variables
conf_file="conf.ncl"

## load Customisations if any
. $VISWRF/custom/global_vars.sh

function yn ()
{
    echo -n "$* [y/n]? "; read yn junk
    case $yn in
        y|Y|yes|YES ) #true
            return 0
            ;;
        N|n|no|NO )  #false
            return 1
            ;;
    esac
}

function green ()
{
    echo
    echo -e $(tput setaf 2) $@ $(tput sgr0)
    echo
}


function red ()
{
    echo
    echo  $(tput setaf 1) $@ $(tput sgr0)
    echo
}

## ---------------------------------------------------------------------
# check a file conf file is already present

function conf_file_present()
{
    if [ -f ./$conf_file ]; then
        return 1;

    else
        return 0;
    fi

}

## ---------------------------------------------------------------------
# debugging

function debug_mark()
{
    echo $1
}
