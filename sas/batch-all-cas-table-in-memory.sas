cas adminsession;


proc cas;
/* need to be a super user */
accessControl.assumeRole / adminRole="superuser";
accessControl.accessPersonalCaslibs;table.caslibinfo result=fileresult / caslib="PUBLIC", showHidden=false, verbose=true,active=true; 
casliblist=findtable(fileresult);
 
/* loop caslibs */
do cvalue over casliblist;
 

 
table.tableinfo result=tabresult / caslib=cvalue.name;
 
tablelist=findtable(tabresult);
x=dim(tablelist);
 
if x>1 then
do; /* there are tables available */
 
do tvalue over tablelist; /* loop all tables in the caslib */
 
table.tabledetails  result=A / caslib=cvalue.name name=tvalue.name;
tableA=findtable(A);
do AA over tableA; /* loop all tables in the caslib */
	maligne="ANALYSE_MEMOIRE;"||tvalue.name||";"||AA.Blocks||";"||AA.Active||";"||AA.Rows||";"||AA.DataSize||";"||AA.Mapped||";"||AA.MappedMemory||";"||AA.Unmapped||";"||AA.Allocated||";"||AA.AllocatedMemory;
	
end;

table.tableinfo result=B  / caslib=cvalue.name name=tvalue.name;
tableB=findtable(B);
do BB over tableB; /* loop all tables in the caslib */
	maligne=maligne||";"||BB.Rows||";"||BB.Creator||";"||BB.Global||";"||BB.CreateTime||";"||BB.SourceName||";"||BB.SourceCaslib;
	

end;

print maligne;
end; /* loop all tables in the caslib */
end; /* there are tables available */
end; /* loop caslibs */
 
accessControl.dropRole / adminRole="superuser";
quit;
cas adminsession terminate;
