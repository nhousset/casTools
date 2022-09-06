/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/list-table-caslib-casuser.sas -log /tmp/list-table-caslib-casuser.log

cat /tmp/list-table-caslib-casuser.log
