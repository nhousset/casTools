cas adminsession;
proc cas;
    accessControl.assumeRole / adminRole="superuser";
    accessControl.accessPersonalCaslibs;
run;


   session.listSessions; 
run;
quit;

cas adminsession terminate;
