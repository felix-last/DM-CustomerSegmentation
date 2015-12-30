*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;

if NAME="TOTAL_PREMIUM" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;

if NAME="LOYALTY" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="IMP_REP_FirstPolicyYear" then delete;
