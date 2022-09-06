/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/batch-all-cas-table-in-memory.sas -log /tmp/batch-all-cas-table-in-memory.log


grep ANALYSE_MEMOIRE batch-all-cas-table-in-memory.log |grep -v "||"
