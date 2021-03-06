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

*** Standardize LOYALTY ;
drop T_LOYALTY ;
if missing( LOYALTY ) then T_LOYALTY = .;
else T_LOYALTY = (LOYALTY - 29.0027065039337) * 0.15179623368094;

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
array CLUSvads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUSvads [_vqclus] = 0; end;
if not missing( T_ClaimsRate ) then do;
   CLUSvads [1] + ( T_ClaimsRate - -0.55032712447982 )**2;
   CLUSvads [2] + ( T_ClaimsRate - 0.24067040035191 )**2;
   CLUSvads [3] + ( T_ClaimsRate - 0.37226668449576 )**2;
   CLUSvads [4] + ( T_ClaimsRate - 0.12060121457744 )**2;
   CLUSvads [5] + ( T_ClaimsRate - -0.11830649663813 )**2;
end;
else _vqmvar + 1;
if not missing( T_CustomerMonetaryValue ) then do;
   CLUSvads [1] + ( T_CustomerMonetaryValue - 0.30423994153308 )**2;
   CLUSvads [2] + ( T_CustomerMonetaryValue - -0.21996810108003 )**2;
   CLUSvads [3] + ( T_CustomerMonetaryValue - -0.37971273830137 )**2;
   CLUSvads [4] + ( T_CustomerMonetaryValue - -0.09439896747785 )**2;
   CLUSvads [5] + ( T_CustomerMonetaryValue - 0.49789441537079 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_GrossMonthlySalary ) then do;
   CLUSvads [1] + ( T_IMP_GrossMonthlySalary - -0.08409439907167 )**2;
   CLUSvads [2] + ( T_IMP_GrossMonthlySalary - 0.51351270530275 )**2;
   CLUSvads [3] + ( T_IMP_GrossMonthlySalary - -0.86709158628221 )**2;
   CLUSvads [4] + ( T_IMP_GrossMonthlySalary - 1.15546926173304 )**2;
   CLUSvads [5] + ( T_IMP_GrossMonthlySalary - -1.14068968229078 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBHealth ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBHealth - -0.98937426534087 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBHealth - -0.30146037132124 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBHealth - 0.74631647842302 )**2;
   CLUSvads [4] + ( T_IMP_PremiumsinLOBHealth - 0.62149284176421 )**2;
   CLUSvads [5] + ( T_IMP_PremiumsinLOBHealth - -0.0115832415579 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBLife ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBLife - -0.6504765301098 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBLife - -0.14547919467741 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBLife - -0.11610398959901 )**2;
   CLUSvads [4] + ( T_IMP_PremiumsinLOBLife - 0.05168632307734 )**2;
   CLUSvads [5] + ( T_IMP_PremiumsinLOBLife - 1.45312309884203 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBMotor ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBMotor - 1.18671497909633 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBMotor - 0.28040978116274 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBMotor - -0.297783823788 )**2;
   CLUSvads [4] + ( T_IMP_PremiumsinLOBMotor - -0.39131642130038 )**2;
   CLUSvads [5] + ( T_IMP_PremiumsinLOBMotor - -1.38909537454878 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBWorkComp ) then do;
   CLUSvads [1] + ( T_IMP_PremiumsinLOBWorkComp - -0.67595844999924 )**2;
   CLUSvads [2] + ( T_IMP_PremiumsinLOBWorkComp - -0.0996449923526 )**2;
   CLUSvads [3] + ( T_IMP_PremiumsinLOBWorkComp - -0.06631905428861 )**2;
   CLUSvads [4] + ( T_IMP_PremiumsinLOBWorkComp - 0.03890616916594 )**2;
   CLUSvads [5] + ( T_IMP_PremiumsinLOBWorkComp - 1.3810679485595 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_CustomerAge ) then do;
   CLUSvads [1] + ( T_IMP_REP_CustomerAge - -0.06851875007629 )**2;
   CLUSvads [2] + ( T_IMP_REP_CustomerAge - 0.49618952052836 )**2;
   CLUSvads [3] + ( T_IMP_REP_CustomerAge - -0.8883455537645 )**2;
   CLUSvads [4] + ( T_IMP_REP_CustomerAge - 1.22020510578764 )**2;
   CLUSvads [5] + ( T_IMP_REP_CustomerAge - -1.2204539220054 )**2;
end;
else _vqmvar + 1;
if not missing( T_LOYALTY ) then do;
   CLUSvads [1] + ( T_LOYALTY - -0.00399748784547 )**2;
   CLUSvads [2] + ( T_LOYALTY - 0.06013229252938 )**2;
   CLUSvads [3] + ( T_LOYALTY - 0.00358196302372 )**2;
   CLUSvads [4] + ( T_LOYALTY - -0.04159681082494 )**2;
   CLUSvads [5] + ( T_LOYALTY - -0.01045838918556 )**2;
end;
else _vqmvar + 1;
if not missing( T_PremiumsinLOBHousehold ) then do;
   CLUSvads [1] + ( T_PremiumsinLOBHousehold - -0.66943470087491 )**2;
   CLUSvads [2] + ( T_PremiumsinLOBHousehold - -0.10997729368533 )**2;
   CLUSvads [3] + ( T_PremiumsinLOBHousehold - -0.14645023820969 )**2;
   CLUSvads [4] + ( T_PremiumsinLOBHousehold - 0.06886472770849 )**2;
   CLUSvads [5] + ( T_PremiumsinLOBHousehold - 1.45692322004126 )**2;
end;
else _vqmvar + 1;
if not missing( IMP_GeographicLiving1 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving1 - 0.00533743934282 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving1 - -0.00662743924816 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving1 - 0.01191774589411 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving1 - -0.01407633433779 )**2;
   CLUSvads [5] + ( IMP_GeographicLiving1 - 0.00460036954118 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving2 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving2 - 0.00257920831268 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving2 - -0.00220531712311 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving2 - 0.00221732263377 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving2 - 0.00922365582927 )**2;
   CLUSvads [5] + ( IMP_GeographicLiving2 - -0.02045464330127 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving3 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving3 - 0.00946425702682 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving3 - 0.01571800583954 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving3 - -0.00824626078985 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving3 - -0.0174046081875 )**2;
   CLUSvads [5] + ( IMP_GeographicLiving3 - 0.0035537752862 )**2;
end;
else _vqmvar + 0.24999999999999;
if not missing( IMP_GeographicLiving4 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving4 - -0.01427173010781 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving4 - -0.00530007831406 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving4 - -0.00572492679267 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving4 - 0.02162793425467 )**2;
   CLUSvads [5] + ( IMP_GeographicLiving4 - 0.00538928011798 )**2;
end;
else _vqmvar + 0.24999999999999;
if not missing( IMP_HasChildren0 ) then do;
   CLUSvads [1] + ( IMP_HasChildren0 - -0.33839474307837 )**2;
   CLUSvads [2] + ( IMP_HasChildren0 - -0.41906764021605 )**2;
   CLUSvads [3] + ( IMP_HasChildren0 - -0.37541226073607 )**2;
   CLUSvads [4] + ( IMP_HasChildren0 - 1.09251178412787 )**2;
   CLUSvads [5] + ( IMP_HasChildren0 - -0.07335590956108 )**2;
end;
else _vqmvar + 0.5;
if not missing( IMP_HasChildren1 ) then do;
   CLUSvads [1] + ( IMP_HasChildren1 - 0.33839474307837 )**2;
   CLUSvads [2] + ( IMP_HasChildren1 - 0.41906764021605 )**2;
   CLUSvads [3] + ( IMP_HasChildren1 - 0.37541226073607 )**2;
   CLUSvads [4] + ( IMP_HasChildren1 - -1.09251178412787 )**2;
   CLUSvads [5] + ( IMP_HasChildren1 - 0.07335590956108 )**2;
end;
else _vqmvar + 0.5;
if not missing( T_IMP_EducationalDegree ) then do;
   CLUSvads [1] + ( T_IMP_EducationalDegree - 0.60955992254884 )**2;
   CLUSvads [2] + ( T_IMP_EducationalDegree - -0.30142536882155 )**2;
   CLUSvads [3] + ( T_IMP_EducationalDegree - 0.10411969671552 )**2;
   CLUSvads [4] + ( T_IMP_EducationalDegree - 0.07347625651496 )**2;
   CLUSvads [5] + ( T_IMP_EducationalDegree - -0.96417136939438 )**2;
end;
else _vqmvar + 0.99999999999999;
_vqnvar = 13 - _vqmvar;
if _vqnvar <= 2.5124791136477E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (13 / _vqnvar));
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
else
if _SEGMENT_ = 4 then _SEGMENT_LABEL_="Cluster4";
else
if _SEGMENT_ = 5 then _SEGMENT_LABEL_="Cluster5";
