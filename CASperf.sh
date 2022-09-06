/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/CASperf.sas -log /tmp/CASperf.log

cat /tmp/CASperf.log
