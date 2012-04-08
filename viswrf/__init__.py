#!/usr/bin/env python3
# -*- coding: utf-8 -*-

AUTHOR  = 'Yagnesh Raghava Yakkala'
LICENSE = 'GPL v3 or later'
VERSION = 'not versioned yet'

import os
import sys
from viswrf import conf

def main():
    import argparse
    parser = argparse.ArgumentParser(
        description='Configuration and Plotting Options')

    parser.add_argument('-c', '--conf',
                        action='append',
                        dest='confargs',
                        nargs='+',
                        default=[],
                        help='Add configuration options Eg: confsetting="a"')

    parser.add_argument('-p','--plot',
                        action='append',
                        nargs='+',
                        default=[],
                        help="make a plot")

    if len(sys.argv)==1:
        parser.print_help()
        sys.exit(1)

    args = parser.parse_args()
    # print(args)

    if args.confargs:
        c = conf.Conf(args.confargs)

# ---------------------
if __name__ == '__main__':
    main()
