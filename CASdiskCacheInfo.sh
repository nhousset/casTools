

/opt/sas/spre/home/SASFoundation/sas  -cashost $1 -casport $2 -casauthinfo  $3 sas/diskCacheInfo.sas -log /tmp/diskCacheInfo.log -print /tmp/diskCacheInfo.out

cat /tmp/diskCacheInfo.log
echo "============================="
cat /tmp/diskCacheInfo.out
