if NAME = "CustomerAge" then delete;
else 
if NAME    = "IMP_CustomerAge"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "EducationalDegree" then delete;
else 
if NAME    = "IMP_EducationalDegree"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "ORDINAL" ;
   ORDER   = "" ;
end;
if NAME = "FirstPolicyYear" then delete;
else 
if NAME    = "IMP_FirstPolicyYear"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "ORDINAL" ;
   ORDER   = "" ;
end;
if NAME = "GeographicLiving" then delete;
else 
if NAME    = "IMP_GeographicLiving"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "GrossMonthlySalary" then delete;
else 
if NAME    = "IMP_GrossMonthlySalary"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "HasChildren" then delete;
else 
if NAME    = "IMP_HasChildren"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "PremiumsinLOBHealth" then delete;
else 
if NAME    = "IMP_PremiumsinLOBHealth"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "PremiumsinLOBLife" then delete;
else 
if NAME    = "IMP_PremiumsinLOBLife"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "PremiumsinLOBMotor" then delete;
else 
if NAME    = "IMP_PremiumsinLOBMotor"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "PremiumsinLOBWorkComp" then delete;
else 
if NAME    = "IMP_PremiumsinLOBWorkComp"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
