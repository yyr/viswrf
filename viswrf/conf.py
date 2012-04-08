#!/usr/bin/env python3
'''

conf.ncl creation and manipulation things

'''

class Conf(object):
    """ Writes conf file
    """

    def __init__(self):
        """
        Arguments:
        - `dir`:
        """
        self._test = "I am called"
        print(self._test)


def main():
    print("you called this directly")

if __name__ == '__main__':
    main()


# conf.py ends here
