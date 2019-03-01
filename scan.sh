#!/bin/bash

# Bash script for network scanning
# Frank Guan 02/28/2019

RESULTS_FILE="results.txt"
IP_ADDR_DEFAULT="127.0.0.1"
IP_ADDR=''

if [ $# -eq 0 ]; then
    read -p "Target IP/subnet [$IP_ADDR_DEFAULT]: " IP_ADDR
    IP_ADDR=${IP_ADDR:=$IP_ADDR_DEFAULT}
elif [ $# -eq 1 ]; then
    IP_ADDR=$1
else
    printf "Error: Must specify IP address or subnet"
    printf "Usage: ./scan.sh or ./scan.sh <IP_ADDR>"
    exit 1
fi

printf "Scanning $IP_ADDR\n" > $RESULTS_FILE
printf "\n=== ACK Scan ===" >> $RESULTS_FILE
nmap -n -sA $IP_ADDR >> $RESULTS_FILE

printf "\n=== SYN Scan ===" >> $RESULTS_FILE
nmap -n -sS $IP_ADDR >> $RESULTS_FILE

printf "\n=== XMAS Scan ===" >> $RESULTS_FILE
nmap -n -sX $IP_ADDR >> $RESULTS_FILE

printf "\n=== Version Scan ===" >> $RESULTS_FILE
nmap -n -sV $IP_ADDR >> $RESULTS_FILE

printf "\n=== OS Scan ===" >> $RESULTS_FILE
nmap -n -O $IP_ADDR >> $RESULTS_FILE

printf "\nResults file: $RESULTS_FILE\n"