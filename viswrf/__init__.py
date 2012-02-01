#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__  = 'Yagnesh Raghava Yakkala'

__license__ = 'GPL v3 or later'

__version__ = 'no version yet'

import os
import sys


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Configuration and Plotting Options')

    parser.add_argument('plotid', action="append",
                        help='Plot type')
    parser.add_argument('conf', action='append',
                        help='Configuration Options')

    args = parser.parse_args()


# ---------------------
if __name__ == '__main__':
    main()
