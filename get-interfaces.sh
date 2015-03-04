#! /bin/bash
#
# Usage:
# ./get-interfaces.sh <priv_key> <host_list> <outfile>
#

private_key=$1
host_list=$2
outfile=$3

touch ${outfile}

for router in `cat ${host_list}`
do
	echo "ROUTER ${router}" >> ${outfile}
	ssh -i ${private_key} oscars@${router} show configuration interfaces >> ${outfile}

done
