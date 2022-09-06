/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/CASlistSessions.sas -log /tmp/CASlistSessions.log -print /tmp/CASlistSessions.out

cat /tmp/CASlistSessions.out
