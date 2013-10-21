Linux Host Enumeration
======================

Linux BASH enumeration script to help quickly and easily identify important information about a local host.

The script is best used when transferred from your pen-testing environment to the target host and then executed to the screen, to minimise the level of evidence left on the target machine.
However, there may be times when you wish to dump the output to a file, as per the following example:

  linux_enumeration.sh $(hostname -i) password username auth cred hash *.cnf *.conf

* Note: This script would not have been possible without referring to the "LinEnum" script written by rebootuser - https://github.com/rebootuser/LinEnum
