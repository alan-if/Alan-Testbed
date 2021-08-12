#!/bin/bash

## Delete Old Transcripts
#########################

echo -e "\n\e[0;34m# \e[33mDeleting Old Transcripts"
echo -e "\e[0;34m#########################\e[1;30m"

rm *.a3t


## Compile Adventure
####################

echo -e "\n\e[0;34m# \e[33mCompiling Adventure"
echo -e "\e[0;34m#####################\e[1;30m"

alan ../kitchen-ascii.alan


## ISO without Encoding Opts
############################

echo -e "\n\e[0;34m# \e[33mISO Solution, No Encoding Opts"
echo -e "\e[0;34m################################\e[0m"

solF=input_iso.a3s
trnF=output_iso.a3t

echo -e "\nInput solution file: \e[33m$solF\e[0m"
echo -e "Output transcript:   \e[33m$trnF\e[1;30m"

arun -r -l kitchen-ascii.a3c < $solF >/dev/null
mv kitchen-ascii.a3t $trnF


## ISO w/ '-u' Option
#####################

echo -e "\n\e[0;34m# \e[33mISO Solution, UTF-8 Encoding Opts"
echo -e "\e[0;34m###################################\e[0m"

echo -e "\nInvoking ARun with -u switch."

solF=input_iso.a3s
trnF=output_iso_-u.a3t

echo -e "\nInput solution file: \e[33m$solF\e[0m"
echo -e "Output transcript:   \e[33m$trnF\e[1;30m"

arun -r -l -u kitchen-ascii.a3c < $solF >/dev/null
mv kitchen-ascii.a3t $trnF


## UTF-8 Sol w/ Autodetection
#############################

echo -e "\n\e[0;34m# \e[33mBOM Solution, No Encoding Opts"
echo -e "\e[0;34m################################\e[0m"

solF=input_utf8-bom.a3s
trnF=output_utf8-bom.a3t

echo -e "\nInput solution file: \e[33m$solF\e[0m"
echo -e "Output transcript:   \e[33m$trnF\e[1;30m"

arun -r -l kitchen-ascii.a3c < $solF >/dev/null
mv kitchen-ascii.a3t $trnF


## UTF-8 Sol w/ '-u' Option
###########################

echo -e "\n\e[0;34m# \e[33mBOM Solution, UTF-8 Encoding Opts"
echo -e "\e[0;34m###################################\e[0m"

echo -e "\nInvoking ARun with -u switch."

solF=input_utf8-bom.a3s
trnF=output_utf8-bom_-u.a3t

echo -e "\nInput solution file: \e[33m$solF\e[0m"
echo -e "Output transcript:   \e[33m$trnF\e[1;30m"

arun -r -l -u kitchen-ascii.a3c < $solF >/dev/null
mv kitchen-ascii.a3t $trnF

echo -e "\n\e[0;0m/// Done ///"
