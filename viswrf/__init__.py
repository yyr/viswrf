# -*- coding: utf-8 -*-

AUTHOR  = 'Yagnesh Raghava Yakkala'
LICENSE = 'GPL v3 or later'
VERSION = 'not versioned yet'

import os
import sys
import conf

def main():
    import argparse
    parser = argparse.ArgumentParser(
        description='Configuration and Plotting Options')

    parser.add_argument('-c', '--conf',
                        action='append',
                        dest='conf_args',
                        nargs='+',
                        default=[],
                        help='Add configuration options \
                        plot_out_dir="~/plots/"')

    parser.add_argument('action',
                        help="plot to make")


    args = parser.parse_args()

    if args.conf_args:
        pass

# ---------------------
if __name__ == '__main__':
    main()
