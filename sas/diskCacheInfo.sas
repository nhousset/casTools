cas adminsession;

proc cas;
    session adminsession;
    accessControl.assumeRole / adminRole="superuser";        
    builtins.getCacheInfo result=results;  
    describe results;
run;
    print results.diskCacheInfo;
run;
quit;

cas adminsession terminate;
