import argparse
import os 
from datetime import datetime
import time
     
parser = argparse.ArgumentParser(prog='cas_cache_disk.py', usage='%(prog)s [options]')
parser.add_argument("--path", help="path to CAS_DISK_CACHE",required = True)
parser.add_argument("--sleep", help="sleep value", type=float)
parser.add_argument("--unit", help="[m]ega or [g]iga (default: m) ", default="m")

args = parser.parse_args()
sleep_value=1
if args.sleep:
   sleep_value=args.sleep

path=args.path
unite=args.unit


 
print "DATE,FS_TOTAL,FS_AVAIL,FS_FREE,MEM_TOTAL,MEM_USED,MEM_FREE"
print "-----------------------------------------------------------"
while 1:
  now = datetime.now()
  date_time = now.strftime("%Y/%m/%d %H:%M:%S")
  info = os.statvfs(path) 
  
  total_fs = info.f_blocks * info.f_bsize
  total_fs_m = total_fs / 1024 / 1024
  if unite == "g":
   total_fs_m = total_fs / 1024 / 1024/1024
  
  avail_fs = info.f_bavail * info.f_bsize 
  avail_fs_m  =  avail_fs / 1024 / 1024
  if unite == "g":
   avail_fs_m = avail_fs / 1024 / 1024/1024
  
  free_fs = info.f_bfree * info.f_bsize
  free_fs_m = free_fs / 1024 / 1024
  if unite == "g":
   free_fs_m = free_fs / 1024 / 1024/1024
  
  tot_m, used_m, free_m = map(int, os.popen('free -t -%s'% unite).readlines()[-1].split()[1:])
  print "%s,%s,%s,%s,%s,%s,%s" % (date_time,total_fs_m,avail_fs_m,free_fs_m,tot_m,used_m,free_m)
  time.sleep(sleep_value)


