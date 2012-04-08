#!/usr/bin/env python3
'''

conf.ncl creation and manipulation things

'''
import sys

class Conf(object):
    """ Writes conf file
    """

    def __init__(self,confargs):
        """
        Arguments:
        - `dir`:
        """
        self._test = "I am called"
        self.confargs=confargs
        self.write_conf()

    def write_conf(self):
        print(self.confargs)

def main():
    import argparse
    parser = argparse.ArgumentParser(
        description='Configuration Options')

    parser.add_argument('confargs',
                    action='append',
                    nargs='+',
                    default=[],
                    help='Add configuration options Eg: confsetting="a"')

    if len(sys.argv)==1:
        parser.print_help()
        sys.exit(1)

    args = parser.parse_args()

    if args.confargs:
        c = Conf(args.confargs)

if __name__ == '__main__':
    main()


# conf.py ends here
