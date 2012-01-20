function yn ()
{
    echo -n "$* [y/n]?"; read yn junk
    case $yn in
        y|Y|yes|YES ) #true
            return 0
            ;;
        N|n|no|NO )  #false
            return 1
            ;;
        * )
            echo "Please answere [y/n]"
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
        return 0;
    else
        return 1;
    fi

}
