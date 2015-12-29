* ;
*Variable: CustomerAge;
* ;
Label REP_CustomerAge= 'Replacement: CustomerAge';
REP_CustomerAge= CustomerAge;
if CustomerAge eq . then REP_CustomerAge = .;
else
if CustomerAge>150 then REP_CustomerAge=.;
