#!/bin/bash
# Linux enumeration script (milbot)
# Version 0.1

#option to store to a file
outfile="$1"

if [ "$outfile" ]; then
    echo -e "#########################################################" >> $outfile
    echo -e "Linux Enumeration & Privilege Escalation Script" >> $outfile
    echo -e "#########################################################" >> $outfile
    echo -e "# https://github.com/milbot/linux_enumeration" >> $outfile
    echo -e "# version 0.1" >> $outfile
    echo -e "#########################################################" >> $outfile
    echo -e "Methodology Used: http://insidetrust.blogspot.com.au/2011/04/quick-guide-to-linux-privilege.html" >> $outfile
    echo -e "#########################################################" >> $outfile
    echo -e "  1. Operating System" >> $outfile
    echo -e "  2. Services & Applications" >> $outfile
    echo -e "  3. File Systems" >> $outfile
    echo -e "  4. Confidential Information" >> $outfile
    echo -e "  5. Communications & Networking" >> $outfile
    echo -e "  6. Possible Exploit Code" >> $outfile
    echo -e "usage ./linux_enumeration.sh outfile.txt 'keyword1 keyword2'\n" >> $outfile
else
    echo -e "\n\e[00;30m#########################################################\e[00m"
    echo -e "\e[00;34mLinux Enumeration & Privilege Escalation Script\e[00m"
    echo -e "\e[00;30m#########################################################\e[00m"
    echo -e "\e[00;30m# https://github.com/milbot/linux_enumeration\e[00m"
    echo -e "\e[00;30m# version 0.1\e[00m\n"
    echo -e "\e[00;34m#########################################################\e[00m"
    echo -e "\e[00;34mMethodology Used: http://insidetrust.blogspot.com.au/2011/04/quick-guide-to-linux-privilege.html\e[00m"
    echo -e "\e[00;34m#########################################################\e[00m"
    echo -e "\e[00;34m  1. Operating System\e[00m"
    echo -e "\e[00;34m  2. Services & Applications\e[00m"
    echo -e "\e[00;34m  3. File Systems\e[00m"
    echo -e "\e[00;34m  4. Confidential Information\e[00m"
    echo -e "\e[00;34m  5. Communications & Networking\e[00m"
    echo -e "\e[00;34m  6. Possible Exploit Code\e[00m\n"
    echo -e "\e[00;34musage ./linux_enumeration.sh outfile.txt 'keyword1 keyword2'\e[00m\n"
fi

#enter a single keyword that'll be used to search within *.conf, *.log & *.ini files.
if [ "$outfile" ]; then
    echo "Enter keywords (space separated) that'll be used to search in *.conf, *.log and *.ini files (e.g. password cred)" >> $outfile
    #accepts search keywords from commandline
    keyword="$2"
    echo -e "$keyword" >> $outfile
else
    echo "Enter keywords (space separated) that'll be used to search in *.conf, *.log and *.ini files (e.g. password cred)"
    #accepts search keywords from commandline
    read keyword
fi

who=`whoami`

if [ "$outfile" ]; then
    echo -e "\n" >> $outfile
    thedate=`date`
    echo -e "Scan started at: $thedate" >> $outfile
    echo -e "\n" >> $outfile
else
    echo -e "\n"
    echo -e "\e[00;30mScan started at:"; date
    echo -e "\e[00m\n"
fi

hostnamed=`hostname 2>/dev/null`
ipaddress=`hostname -i 2>/dev/null`

echo -e "\n\e[00;30m#########################################################\e[00m"
echo -e "\e[00;31mHostname:\e[00m\n$hostnamed"
echo -e "\e[00;31mIP Address:\e[00m\n$hostnamed"
echo -e "\e[00;30m#########################################################\e[00m"

# DISTRIBUTION TYPE
# -----------------
# Search all *-release files for version info
release=`cat /etc/*-release 2>/dev/null`

if [ "$outfile" ];then
    if [ "$release" ]; then
      echo -e "Specific release information:\n$release" >> $outfile
      echo -e "\n" >> $outfile
    else
      :
    fi
else
    if [ "$release" ]; then
        echo -e "\e[00;31mSpecific release information:\e[00m\n$release"
        echo -e "\n"
    else
        :
    fi
fi

# KERNEL VERSION
# --------------
unameinfo=`uname -a 2>/dev/null`

if [ "$outfile" ]; then
    if [ "$unameinfo" ]; then
      echo -e "Kernel information:\n$unameinfo" >> $outfile
      echo -e "\n" >> $outfile
    else
      :
    fi
else
    if [ "$unameinfo" ]; then
      echo -e "\e[00;31mKernel information:\e[00m\n$unameinfo"
      echo -e "\n"
    else
      :
    fi
fi

procver=`cat /proc/version 2>/dev/null`

if [ "$outfile" ];then
    if [ "$procver" ]; then
      echo -e "Kernel information (continued):\n$procver" >> $outfile
      echo -e "\n" >> $outfile
    else
      :
    fi
else
    if [ "$procver" ]; then
      echo -e "\e[00;31mKernel information (continued):\e[00m\n$procver"
      echo -e "\n"
    else
      :
    fi
fi
