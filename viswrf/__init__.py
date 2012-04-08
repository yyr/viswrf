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

    parser.add_argument('-c', '--conf', default='conf')
    parser.add_argument('-p', '--plot', default='Test')
    args = parser.parse_args()

# ---------------------
if __name__ == '__main__':
    main()
