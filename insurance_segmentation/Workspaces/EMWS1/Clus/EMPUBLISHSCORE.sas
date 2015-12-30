*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize ClaimsRate ;
drop T_ClaimsRate ;
if missing( ClaimsRate ) then T_ClaimsRate = .;
else T_ClaimsRate = (ClaimsRate - 0.67794677876012) * 3.19941338729829;

*** Standardize CustomerMonetaryValue ;
drop T_CustomerMonetaryValue ;
if missing( CustomerMonetaryValue ) then T_CustomerMonetaryValue = .;
else T_CustomerMonetaryValue = (CustomerMonetaryValue
         - 216.160594666394) * 0.00411467214717;

*** Standardize IMP_GrossMonthlySalary ;
drop T_IMP_GrossMonthlySalary ;
if missing( IMP_GrossMonthlySalary ) then T_IMP_GrossMonthlySalary = .;
else T_IMP_GrossMonthlySalary = (IMP_GrossMonthlySalary
         - 5037.76267683033) * 0.00052230054959;

*** Standardize IMP_PremiumsinLOBHealth ;
drop T_IMP_PremiumsinLOBHealth ;
if missing( IMP_PremiumsinLOBHealth ) then T_IMP_PremiumsinLOBHealth = .;
else T_IMP_PremiumsinLOBHealth = (IMP_PremiumsinLOBHealth
         - 169.062511833779) * 0.01393077964912;

*** Standardize IMP_PremiumsinLOBLife ;
drop T_IMP_PremiumsinLOBLife ;
if missing( IMP_PremiumsinLOBLife ) then T_IMP_PremiumsinLOBLife = .;
else T_IMP_PremiumsinLOBLife = (IMP_PremiumsinLOBLife
         - 40.9128391370854) * 0.02196228220047;

*** Standardize IMP_PremiumsinLOBMotor ;
drop T_IMP_PremiumsinLOBMotor ;
if missing( IMP_PremiumsinLOBMotor ) then T_IMP_PremiumsinLOBMotor = .;
else T_IMP_PremiumsinLOBMotor = (IMP_PremiumsinLOBMotor
         - 300.705034925363) * 0.00752909476072;

*** Standardize IMP_PremiumsinLOBWorkComp ;
drop T_IMP_PremiumsinLOBWorkComp ;
if missing( IMP_PremiumsinLOBWorkComp ) then T_IMP_PremiumsinLOBWorkComp = .;
else T_IMP_PremiumsinLOBWorkComp = (IMP_PremiumsinLOBWorkComp
         - 39.1457064116058) * 0.02388036571999;

*** Standardize IMP_REP_CustomerAge ;
drop T_IMP_REP_CustomerAge ;
if missing( IMP_REP_CustomerAge ) then T_IMP_REP_CustomerAge = .;
else T_IMP_REP_CustomerAge = (IMP_REP_CustomerAge
         - 48.3002159661034) * 0.05849681051166;

*** Standardize PremiumsinLOBHousehold ;
drop T_PremiumsinLOBHousehold ;
if missing( PremiumsinLOBHousehold ) then T_PremiumsinLOBHousehold = .;
else T_PremiumsinLOBHousehold = (PremiumsinLOBHousehold
         - 198.392193726367) * 0.00468668992402;

*** Generate dummy variables for IMP_GeographicLiving ;
drop IMP_GeographicLiving1 IMP_GeographicLiving2 IMP_GeographicLiving3
        IMP_GeographicLiving4 ;
if missing( IMP_GeographicLiving ) then do;
   IMP_GeographicLiving1 = .;
   IMP_GeographicLiving2 = .;
   IMP_GeographicLiving3 = .;
   IMP_GeographicLiving4 = .;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( IMP_GeographicLiving , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      IMP_GeographicLiving1 = -0.32404062826594;
      IMP_GeographicLiving2 = -0.16763086377407;
      IMP_GeographicLiving3 = -0.25011493503349;
      IMP_GeographicLiving4 = 0.6085514560971;
   end;
   else if _dm12 = '1'  then do;
      IMP_GeographicLiving1 = 0.77142936442447;
      IMP_GeographicLiving2 = -0.16763086377407;
      IMP_GeographicLiving3 = -0.25011493503349;
      IMP_GeographicLiving4 = -0.41076962910268;
   end;
   else if _dm12 = '3'  then do;
      IMP_GeographicLiving1 = -0.32404062826594;
      IMP_GeographicLiving2 = -0.16763086377407;
      IMP_GeographicLiving3 = 0.99943834172648;
      IMP_GeographicLiving4 = -0.41076962910268;
   end;
   else if _dm12 = '2'  then do;
      IMP_GeographicLiving1 = -0.32404062826594;
      IMP_GeographicLiving2 = 1.49121975680923;
      IMP_GeographicLiving3 = -0.25011493503349;
      IMP_GeographicLiving4 = -0.41076962910268;
   end;
   else do;
      IMP_GeographicLiving1 = .;
      IMP_GeographicLiving2 = .;
      IMP_GeographicLiving3 = .;
      IMP_GeographicLiving4 = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_HasChildren ;
drop IMP_HasChildren0 IMP_HasChildren1 ;
if missing( IMP_HasChildren ) then do;
   IMP_HasChildren0 = .;
   IMP_HasChildren1 = .;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( IMP_HasChildren , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      IMP_HasChildren0 = -0.45354645930186;
      IMP_HasChildren1 = 0.45354645930186;
   end;
   else if _dm12 = '0'  then do;
      IMP_HasChildren0 = 1.10231025194501;
      IMP_HasChildren1 = -1.10231025194501;
   end;
   else do;
      IMP_HasChildren0 = .;
      IMP_HasChildren1 = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_EducationalDegree ;
drop T_IMP_EducationalDegree ;
if missing( IMP_EducationalDegree ) then do;
   T_IMP_EducationalDegree = .;
end;
else do;
   length _dm15 $ 15; drop _dm15 ;
   _dm15 = put( IMP_EducationalDegree , $CHAR15. );
   %DMNORMIP( _dm15 )
   if _dm15 = '3 - BSC/MSC'  then do;
      T_IMP_EducationalDegree = 0.73555748368902;
   end;
   else if _dm15 = '2 - HIGH SCHOOL'  then do;
      T_IMP_EducationalDegree = -0.80523581525977;
   end;
   else if _dm15 = '1 - BASIC'  then do;
      T_IMP_EducationalDegree = -1.6661375152455;
   end;
   else if _dm15 = '4 - PHD'  then do;
      T_IMP_EducationalDegree = 1.7532834175406;
   end;
   else do;
      T_IMP_EducationalDegree = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [3] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 3; CLUSvads [_vqclus] = 0; end;
if not missing( T_ClaimsRate ) then do;
   CLUSvads [1] + ( T_ClaimsRate - -0.1067509403154 )**2;
   CLUSvads [2] + ( T_ClaimsRate - 0.11883988166144 )**2;
   CLUSvads [3] + ( T_ClaimsRate - 0.08095656243799 )**2;
end;
else _vqmvar + 1;
if not missing( T_CustomerMonetaryValue ) then do;
   CLUSvads [1] + ( T_CustomerMonetaryValue - -0.02465166420419 )**2;
   CLUSvads [2] + ( T_CustomerMonetaryValue - -0.0835605329457 )**2;
   CLUSvads [3] + ( T_CustomerMonetaryValue - 0.13806534314775 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_GrossMonthlySalary ) then do;
   CLUSvads [1] + ( T_IMP_GrossMonthlySalary - -0.08937612472079 )**2;
   CLUSvads [2] + ( T_IMP_GrossMonthlySalary - 1.11665313885414 )**2;
   CLUSvads [3] + ( T_IMP_GrossMonthlySalary - -1.02603933499744 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBHealth ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBHealth - -0.51705109816503 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBHealth - 0.55722691726309 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBHealth - 0.4118777319249 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBLife ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBLife - -0.48906418940277 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBLife - 0.07371157073035 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBLife - 0.87710702640313 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBMotor ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBMotor - 0.76589928619236 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBMotor - -0.38441255049986 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBMotor - -1.08434458051326 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBWorkComp ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBWorkComp - -0.4987161937694 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBWorkComp - 0.07614030401026 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBWorkComp - 0.89336991525772 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_CustomerAge ) then do;
   CLUSvads [1] + ( T_IMP_REP_CustomerAge - -0.09039922909565 )**2;
   CLUSvads [2] + ( T_IMP_REP_CustomerAge - 1.16168792222724 )**2;
   CLUSvads [3] + ( T_IMP_REP_CustomerAge - -1.07246772042387 )**2;
end;
else _vqmvar + 1;
if not missing( T_PremiumsinLOBHousehold ) then do;
   CLUSvads [1] + ( T_PremiumsinLOBHousehold - -0.50473314620215 )**2;
   CLUSvads [2] + ( T_PremiumsinLOBHousehold - 0.09998316505462 )**2;
   CLUSvads [3] + ( T_PremiumsinLOBHousehold - 0.87949626614925 )**2;
end;
else _vqmvar + 1;
if not missing( IMP_GeographicLiving1 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving1 - 0.00727674947277 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving1 - -0.02237730971197 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving1 - 0.00983408120313 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving2 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving2 - -0.00027841068658 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving2 - 0.00962663264214 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving2 - -0.00980776107442 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving3 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving3 - 0.00753305526726 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving3 - -0.0117857386235 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving3 - -0.00205699458937 )**2;
end;
else _vqmvar + 0.24999999999999;
if not missing( IMP_GeographicLiving4 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving4 - -0.01274492565693 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving4 - 0.02452068495237 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving4 - -0.00144588195696 )**2;
end;
else _vqmvar + 0.24999999999999;
if not missing( IMP_HasChildren0 ) then do;
   CLUSvads [1] + ( IMP_HasChildren0 - -0.38800910836474 )**2;
   CLUSvads [2] + ( IMP_HasChildren0 - 0.90507219318486 )**2;
   CLUSvads [3] + ( IMP_HasChildren0 - -0.21452893323305 )**2;
end;
else _vqmvar + 0.5;
if not missing( IMP_HasChildren1 ) then do;
   CLUSvads [1] + ( IMP_HasChildren1 - 0.38800910836474 )**2;
   CLUSvads [2] + ( IMP_HasChildren1 - -0.90507219318486 )**2;
   CLUSvads [3] + ( IMP_HasChildren1 - 0.21452893323305 )**2;
end;
else _vqmvar + 0.5;
if not missing( T_IMP_EducationalDegree ) then do;
   CLUSvads [1] + ( T_IMP_EducationalDegree - 0.34586411005645 )**2;
   CLUSvads [2] + ( T_IMP_EducationalDegree - -0.00169278868143 )**2;
   CLUSvads [3] + ( T_IMP_EducationalDegree - -0.67452344452255 )**2;
end;
else _vqmvar + 0.99999999999999;
_vqnvar = 12 - _vqmvar;
if _vqnvar <= 2.182787284255E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 3;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (12 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus: Creating Segment Label;
*------------------------------------------------------------*;
length _SEGMENT_LABEL_ $80;
label _SEGMENT_LABEL_='Segment Description';
if _SEGMENT_ = 1 then _SEGMENT_LABEL_="Cluster1";
else
if _SEGMENT_ = 2 then _SEGMENT_LABEL_="Cluster2";
else
if _SEGMENT_ = 3 then _SEGMENT_LABEL_="Cluster3";
