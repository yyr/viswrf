#!/usr/bin/env python3
#
# Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
#    File: vw
# Created: Sunday, January 22 2012
# License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>
#
# Description:
#

# add our module in python path
import os, sys, inspect
vw_dir = os.path.abspath(os.path.split(inspect.getfile(
    inspect.currentframe()))[0])
if vw_dir not in sys.path:
    sys.path.insert(0, vw_dir)

#  Import ours module
from viswrf import conf

print(os.getcwd())


# Local Variables:
# mode: python
# End:
