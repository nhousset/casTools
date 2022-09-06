cas adminsession;
proc cas;
/* need to be a super user */
accessControl.assumeRole / adminRole="superuser";
accessControl.accessPersonalCaslibs;table.caslibinfo result=fileresult;
casliblist=findtable(fileresult);
 
/* loop caslibs */
do cvalue over casliblist;
 
if cvalue.name==: "CASUSER" then
do; /* only look at caslibs that contain CASUSER */
 
table.tableinfo result=tabresult / caslib=cvalue.name;
 
tablelist=findtable(tabresult);
x=dim(tablelist);
 
if x>1 then
do; /* there are tables available */
 
do tvalue over tablelist; /* loop all tables in the caslib */
 
table.tabledetails / caslib=cvalue.name name=tvalue.name;
table.tableinfo / caslib=cvalue.name name=tvalue.name;
 
end; /* loop all tables in the caslib */
end; /* there are tables available */
end; /* only look at caslibs that contain CASUSER */
end; /* loop caslibs */
 
accessControl.dropRole / adminRole="superuser";
quit;
cas adminsession terminate;
