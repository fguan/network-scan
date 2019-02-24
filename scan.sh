#!/bin/bash

if [ $# -ne 1 ]; then
    # TODO: print usage
    echo 'Error: Must have 1 argument representing IP address'
    exit 1
fi

RESULTS_FILE = nmap-results.txt

echo '=== ACK Scan ==='
nmap -sA $1 >> $RESULTS_FILE 2>&1

echo '=== SYN Scan ==='
nmap -sS $1 >> $RESULTS_FILE 2>&1

echo '=== XMAS Scan ==='
nmap -sX $1 >> $RESULTS_FILE 2>&1

echo '=== Version Scan ==='
nmap -sV $1 >> $RESULTS_FILE 2>&1

echo '=== OS Scan ==='
nmap -O $1 >> $RESULTS_FILE 2>&1
