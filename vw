#!/usr/bin/env python
# -*- mode: python; -*-
#
# Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
#    File: vw
# Created: Sunday, January 22 2012
# License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
#
# Description:
#

# add our module in python path
import os
import sys
import inspect

AUTHOR = "Yagnesh Raghava Yakkala"
WEBSITE = "http://yagnesh.org"
LICENSE ="GPL v3 or later"


VISWRFDIR = os.path.abspath(os.path.split(inspect.getfile(
    inspect.currentframe()))[0])

if VISWRFDIR not in sys.path:
    sys.path.insert(0, VISWRFDIR)


def main():
    import viswrf
    viswrf.main()



if __name__ == '__main__':
    main()
