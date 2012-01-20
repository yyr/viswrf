## ---------------------------------------------------------------------
# Guess
##
function guess_runid ()
{
    echo
}

## sets the variable
function get_ndom ()
{
    echo
}


## ---------------------------------------------------------------------
# Write pieces in the conf file
function dir_details ()
{
    cat >> $conf_file <<EOF
; directories
pltdir = "$PWD/plt"
outdir = "$ODIR"

EOF
}

function run_details()
{
    cat >> $conf_file <<EOF
; details about the run
runid = $RUNID
ndom = $NDOM

EOF
}

## ---------------------------------------------------------------------
# writes the conf file
function write_conf()
{
    if [ conf_file_present ]; then
        red "conf file is already present"
        yn "do you want overwrite"
        if [  $? -ne 0 ]; then
            echo "Abort"
            exit 128
        fi
    else
        echo "conf file is not present"
    fi

    ## intialize
    cat > $conf_file <<EOF
load "\$VISWRF/param.ncl"

EOF
    dir_details
    run_details
}
