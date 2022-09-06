/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/batch-all-cas-table-in-memory.sas -log /tmp/batch-all-cas-table-in-memory.log

cat /tmp/batch-all-cas-table-in-memory.log
echo "============================================="
grep ANALYSE_MEMOIRE /tmp/batch-all-cas-table-in-memory.log |grep -v "||"
