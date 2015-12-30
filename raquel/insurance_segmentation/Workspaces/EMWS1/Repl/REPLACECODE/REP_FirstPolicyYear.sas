* ;
*Variable: FirstPolicyYear;
* ;
Label REP_FirstPolicyYear= 'Replacement: FirstPolicyYear';
REP_FirstPolicyYear= FirstPolicyYear;
if FirstPolicyYear eq . then REP_FirstPolicyYear = .;
else
if FirstPolicyYear<1900 then REP_FirstPolicyYear=.;
else
if FirstPolicyYear>2016 then REP_FirstPolicyYear=.;
