#!/usr/bin/env bash

## did I get any arguments where to create?
if [ "x${0}" == "x" ]; then
    echo "no args"
fi

VISWRF=$(cd `dirname $BASH_SOURCE`; pwd)
# echo $VISWRF

## load libs
. $VISWRF/lib/general.sh
. $VISWRF/lib/conf_util.sh

## custom fields
DOMID=03
RUNID=con
GTYPE=ps

## write the conf file
write_conf
if [ $? -eq 0 ]; then
    green " $conf_file is written"
    else
    red "could n't write " $conf_file
fi
