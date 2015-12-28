

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(FirstPolicyYear,BEST12.0);
if
_FILTERFMT1 not in ( '       53784')
and
( ClaimsRate eq . or (0<=ClaimsRate) and (ClaimsRate<=1))
and ( CustomerAge eq . or (0<=CustomerAge) and (CustomerAge<=150))
and ( CustomerMonetaryValue eq . or (-35784.17035<=CustomerMonetaryValue) and (CustomerMonetaryValue<=11899.001562))
and ( GrossMonthlySalary eq . or (0<=GrossMonthlySalary) and (GrossMonthlySalary<=11558.490849))
and ( PremiumsinLOBHealth eq . or (24.45<=PremiumsinLOBHealth) and (PremiumsinLOBHealth<=365.07))
and ( PremiumsinLOBHousehold eq . or (-70<=PremiumsinLOBHousehold) and (PremiumsinLOBHousehold<=1194.1))
and ( PremiumsinLOBMotor eq . or (18.78<=PremiumsinLOBMotor) and (PremiumsinLOBMotor<=559.44))
and ( PremiumsinLOBWorkComp eq . or (-11<=PremiumsinLOBWorkComp) and (PremiumsinLOBWorkComp<=254.38))
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
