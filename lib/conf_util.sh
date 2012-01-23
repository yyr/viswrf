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
function conf_comment_add()
{
    cat >> $conf_file <<EOF
;; ---------------------------------------------------------------------
"; $@"
EOF


}

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
runid = "$RUNID"
domid = $DOMID

EOF
}

function io_details()
{
    cat >> $conf_file <<EOF
; io details
infile = "`ls *d$DOMID*`" + ".nc"
ofile_prefix = "vw_" + "$RUNID" + "_" + domid
graphic_type = "$GTYPE"
EOF
}

function diffp_details()
{
    cat >> $conf_file <<EOF

;; diffp
diffp_top_level = 1500.
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
load "\$VISWRF/primitive.ncl"

EOF
    dir_details
    run_details
    io_details

    diffp_details

    # show thing that are written in conf file
    echo
    echo "--------------------------------------------------------------------"
    cat $conf_file
    echo "--------------------------------------------------------------------"
}

## ---------------------------------------------------------------------
## temp conf file based on the user command line arguments
function tmp_conf_begin()
{
        ## intialize
    cat > $tmp_conf <<EOF
begin

EOF
}

function tmp_conf_end()
{
        ## intialize
    cat >> $tmp_conf <<EOF

end
EOF
}

function tmp_conf_write_opt()
{
    echo $1 = \"$2\" >> $tmp_conf
}

function tmp_conf_write_opt_num()
{
    echo $1 = $2 >> $tmp_conf
}
