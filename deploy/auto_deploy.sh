#!/bin/bash

echo 'Usage'
echo './auto_deploy.sh brokername egname barName timeoutSecs'
echo './auto_deploy.sh WMBBRK EG1 /develop/wmb/workspace/BARfiles/pub-sub.bar 60'

#if [ $# < 4 ] ;
#then
#	echo './auto_deploy.sh brokerName egName barName timeoutSecs';
#fi

typeset timeoutSecs=60

typeset brokerName=$1
typeset egName=$2
typeset barName=$3
typeset timeoutSecs=$4

echo 'Begin deploy bar with args:'
echo $brokerName -e $egName -a $barName -w $timeoutSecs

source /opt/ibm/mqsi/8.0.0.0/bin/mqsiprofile
$MQSI_FILEPATH/bin/mqsideploy $brokerName -e $egName -a $barName -w $timeoutSecs