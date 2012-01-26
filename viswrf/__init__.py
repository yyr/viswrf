#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__  = 'Yagnesh Raghava Yakkala'

__license__ = 'GPL v3 or later'

__version__ = 'no version yet'

import os
import sys


def parseOpts():
    """bring Options
    """
    import optparse

    parser = optparse.OptionParser()

    # option groups
    general = optparse.OptionGroup(parser, 'General Options')
    #    dirconfig  = optparse.OptionGroup(parser, 'Configuration Options For Directories')

    plottype = optparse.OptionGroup(parser,
        'Plot Options')


    general.add_option('-v', '--version',
        action='version', help='P')

    plottype.add_option("xy",
        action='store_true', dest='plot_type', help=" Plot Type XY")


    parser.add_option_group(general)
    parser.add_option_group(plotxy)

    opts, args = parser.parse_args(argv)

    return parser, opts, args


def main():
    parser, opts, args = parseOpts()

    if args.length == 0:
        print("no args")
    else:
        print("Good JOB")

if __name__ == '__main__':
    main()
