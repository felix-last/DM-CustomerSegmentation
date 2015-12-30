*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize ClaimsRate ;
drop T_ClaimsRate ;
if missing( ClaimsRate ) then T_ClaimsRate = .;
else T_ClaimsRate = (ClaimsRate - 0.74278480769098) * 0.34282299968436;

*** Standardize CustomerMonetaryValue ;
drop T_CustomerMonetaryValue ;
if missing( CustomerMonetaryValue ) then T_CustomerMonetaryValue = .;
else T_CustomerMonetaryValue = (CustomerMonetaryValue
         - 177.89260352564) * 0.00051392438417;

*** Standardize IMP_GrossMonthlySalary ;
drop T_IMP_GrossMonthlySalary ;
if missing( IMP_GrossMonthlySalary ) then T_IMP_GrossMonthlySalary = .;
else T_IMP_GrossMonthlySalary = (IMP_GrossMonthlySalary
         - 5012.8385565301) * 0.00043274126676;

*** Standardize IMP_PremiumsinLOBHealth ;
drop T_IMP_PremiumsinLOBHealth ;
if missing( IMP_PremiumsinLOBHealth ) then T_IMP_PremiumsinLOBHealth = .;
else T_IMP_PremiumsinLOBHealth = (IMP_PremiumsinLOBHealth
         - 171.58083292696) * 0.00338081900561;

*** Standardize IMP_PremiumsinLOBLife ;
drop T_IMP_PremiumsinLOBLife ;
if missing( IMP_PremiumsinLOBLife ) then T_IMP_PremiumsinLOBLife = .;
else T_IMP_PremiumsinLOBLife = (IMP_PremiumsinLOBLife
         - 41.8557819858754) * 0.02116841219401;

*** Standardize IMP_PremiumsinLOBMotor ;
drop T_IMP_PremiumsinLOBMotor ;
if missing( IMP_PremiumsinLOBMotor ) then T_IMP_PremiumsinLOBMotor = .;
else T_IMP_PremiumsinLOBMotor = (IMP_PremiumsinLOBMotor
         - 300.470252387456) * 0.00472668476828;

*** Standardize IMP_PremiumsinLOBWorkComp ;
drop T_IMP_PremiumsinLOBWorkComp ;
if missing( IMP_PremiumsinLOBWorkComp ) then T_IMP_PremiumsinLOBWorkComp = .;
else T_IMP_PremiumsinLOBWorkComp = (IMP_PremiumsinLOBWorkComp
         - 41.2775142017676) * 0.01949395258122;

*** Standardize IMP_REP_CustomerAge ;
drop T_IMP_REP_CustomerAge ;
if missing( IMP_REP_CustomerAge ) then T_IMP_REP_CustomerAge = .;
else T_IMP_REP_CustomerAge = (IMP_REP_CustomerAge
         - 47.900758902511) * 0.05754504433;

*** Standardize PremiumsinLOBHousehold ;
drop T_PremiumsinLOBHousehold ;
if missing( PremiumsinLOBHousehold ) then T_PremiumsinLOBHousehold = .;
else T_PremiumsinLOBHousehold = (PremiumsinLOBHousehold
         - 210.431191724937) * 0.00283610717435;

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
      IMP_GeographicLiving1 = -0.32422559943915;
      IMP_GeographicLiving2 = -0.16723350696889;
      IMP_GeographicLiving3 = -0.25050370517151;
      IMP_GeographicLiving4 = 0.60893624085983;
   end;
   else if _dm12 = '1'  then do;
      IMP_GeographicLiving1 = 0.77099315772144;
      IMP_GeographicLiving2 = -0.16723350696889;
      IMP_GeographicLiving3 = -0.25050370517151;
      IMP_GeographicLiving4 = -0.41051213896014;
   end;
   else if _dm12 = '3'  then do;
      IMP_GeographicLiving1 = -0.32422559943915;
      IMP_GeographicLiving2 = -0.16723350696889;
      IMP_GeographicLiving3 = 0.99789230085265;
      IMP_GeographicLiving4 = -0.41051213896014;
   end;
   else if _dm12 = '2'  then do;
      IMP_GeographicLiving1 = -0.32422559943915;
      IMP_GeographicLiving2 = 1.4947705352625;
      IMP_GeographicLiving3 = -0.25050370517151;
      IMP_GeographicLiving4 = -0.41051213896014;
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
      IMP_HasChildren0 = -0.45478729278124;
      IMP_HasChildren1 = 0.45478729278124;
   end;
   else if _dm12 = '0'  then do;
      IMP_HasChildren0 = 1.09930828188709;
      IMP_HasChildren1 = -1.09930828188709;
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
      T_IMP_EducationalDegree = 0.74260910169779;
   end;
   else if _dm15 = '2 - HIGH SCHOOL'  then do;
      T_IMP_EducationalDegree = -0.77133883677817;
   end;
   else if _dm15 = '1 - BASIC'  then do;
      T_IMP_EducationalDegree = -1.64086790737535;
   end;
   else if _dm15 = '4 - PHD'  then do;
      T_IMP_EducationalDegree = 1.74524048924962;
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
   goto CLUS2vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS2vads [4] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 4; CLUS2vads [_vqclus] = 0; end;
if not missing( T_ClaimsRate ) then do;
   CLUS2vads [1] + ( T_ClaimsRate - -0.01322534560946 )**2;
   CLUS2vads [2] + ( T_ClaimsRate - -0.00548205746619 )**2;
   CLUS2vads [3] + ( T_ClaimsRate - -0.0307416809451 )**2;
   CLUS2vads [4] + ( T_ClaimsRate - 0.05693229586164 )**2;
end;
else _vqmvar + 1;
if not missing( T_CustomerMonetaryValue ) then do;
   CLUS2vads [1] + ( T_CustomerMonetaryValue - 0.06136601212268 )**2;
   CLUS2vads [2] + ( T_CustomerMonetaryValue - 0.00612894168194 )**2;
   CLUS2vads [3] + ( T_CustomerMonetaryValue - 0.01508980919854 )**2;
   CLUS2vads [4] + ( T_CustomerMonetaryValue - -0.05890238611796 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_GrossMonthlySalary ) then do;
   CLUS2vads [1] + ( T_IMP_GrossMonthlySalary - -1.09656467146711 )**2;
   CLUS2vads [2] + ( T_IMP_GrossMonthlySalary - -0.46733394233693 )**2;
   CLUS2vads [3] + ( T_IMP_GrossMonthlySalary - 0.07808607343356 )**2;
   CLUS2vads [4] + ( T_IMP_GrossMonthlySalary - 0.96769071166013 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBHealth ) then do;
   CLUS2vads [1] + ( T_IMP_PremiumsinLOBHealth - -0.02099458247305 )**2;
   CLUS2vads [2] + ( T_IMP_PremiumsinLOBHealth - 0.12251723415997 )**2;
   CLUS2vads [3] + ( T_IMP_PremiumsinLOBHealth - -0.17241032248412 )**2;
   CLUS2vads [4] + ( T_IMP_PremiumsinLOBHealth - 0.11588368225496 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBLife ) then do;
   CLUS2vads [1] + ( T_IMP_PremiumsinLOBLife - 1.65719854370536 )**2;
   CLUS2vads [2] + ( T_IMP_PremiumsinLOBLife - -0.0006090336593 )**2;
   CLUS2vads [3] + ( T_IMP_PremiumsinLOBLife - -0.57228904581029 )**2;
   CLUS2vads [4] + ( T_IMP_PremiumsinLOBLife - 0.00666924491861 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBMotor ) then do;
   CLUS2vads [1] + ( T_IMP_PremiumsinLOBMotor - -0.99139587687483 )**2;
   CLUS2vads [2] + ( T_IMP_PremiumsinLOBMotor - -0.18930087783186 )**2;
   CLUS2vads [3] + ( T_IMP_PremiumsinLOBMotor - 0.6292774215729 )**2;
   CLUS2vads [4] + ( T_IMP_PremiumsinLOBMotor - -0.19610423706139 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_PremiumsinLOBWorkComp ) then do;
   CLUS2vads [1] + ( T_IMP_PremiumsinLOBWorkComp - 1.46019310259722 )**2;
   CLUS2vads [2] + ( T_IMP_PremiumsinLOBWorkComp - 0.03460611858388 )**2;
   CLUS2vads [3] + ( T_IMP_PremiumsinLOBWorkComp - -0.50691144743446 )**2;
   CLUS2vads [4] + ( T_IMP_PremiumsinLOBWorkComp - -0.03096224812048 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_CustomerAge ) then do;
   CLUS2vads [1] + ( T_IMP_REP_CustomerAge - -1.36010683641144 )**2;
   CLUS2vads [2] + ( T_IMP_REP_CustomerAge - -0.55730331993116 )**2;
   CLUS2vads [3] + ( T_IMP_REP_CustomerAge - 0.09718159362462 )**2;
   CLUS2vads [4] + ( T_IMP_REP_CustomerAge - 1.1739414897895 )**2;
end;
else _vqmvar + 1;
if not missing( T_PremiumsinLOBHousehold ) then do;
   CLUS2vads [1] + ( T_PremiumsinLOBHousehold - 0.99610401680665 )**2;
   CLUS2vads [2] + ( T_PremiumsinLOBHousehold - 0.05153038896831 )**2;
   CLUS2vads [3] + ( T_PremiumsinLOBHousehold - -0.38293780105355 )**2;
   CLUS2vads [4] + ( T_PremiumsinLOBHousehold - -0.00015745402457 )**2;
end;
else _vqmvar + 1;
if not missing( IMP_GeographicLiving1 ) then do;
   CLUS2vads [1] + ( IMP_GeographicLiving1 - 0.00169030490944 )**2;
   CLUS2vads [2] + ( IMP_GeographicLiving1 - 0.00392702097852 )**2;
   CLUS2vads [3] + ( IMP_GeographicLiving1 - 0.0046125455087 )**2;
   CLUS2vads [4] + ( IMP_GeographicLiving1 - -0.01198837247702 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving2 ) then do;
   CLUS2vads [1] + ( IMP_GeographicLiving2 - -0.02515896787491 )**2;
   CLUS2vads [2] + ( IMP_GeographicLiving2 - 0.00426571027884 )**2;
   CLUS2vads [3] + ( IMP_GeographicLiving2 - 0.00232123220262 )**2;
   CLUS2vads [4] + ( IMP_GeographicLiving2 - 0.00410711594155 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving3 ) then do;
   CLUS2vads [1] + ( IMP_GeographicLiving3 - -0.00082450396668 )**2;
   CLUS2vads [2] + ( IMP_GeographicLiving3 - 0.00756375853522 )**2;
   CLUS2vads [3] + ( IMP_GeographicLiving3 - 0.00559522666976 )**2;
   CLUS2vads [4] + ( IMP_GeographicLiving3 - -0.0163675787443 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving4 ) then do;
   CLUS2vads [1] + ( IMP_GeographicLiving4 - 0.01453206456157 )**2;
   CLUS2vads [2] + ( IMP_GeographicLiving4 - -0.0124484760822 )**2;
   CLUS2vads [3] + ( IMP_GeographicLiving4 - -0.01028634428379 )**2;
   CLUS2vads [4] + ( IMP_GeographicLiving4 - 0.02200561139964 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_HasChildren0 ) then do;
   CLUS2vads [1] + ( IMP_HasChildren0 - -0.03743743280982 )**2;
   CLUS2vads [2] + ( IMP_HasChildren0 - -0.38446140458919 )**2;
   CLUS2vads [3] + ( IMP_HasChildren0 - -0.42599978835692 )**2;
   CLUS2vads [4] + ( IMP_HasChildren0 - 1.07404344502693 )**2;
end;
else _vqmvar + 0.5;
if not missing( IMP_HasChildren1 ) then do;
   CLUS2vads [1] + ( IMP_HasChildren1 - 0.03743743280982 )**2;
   CLUS2vads [2] + ( IMP_HasChildren1 - 0.38446140458919 )**2;
   CLUS2vads [3] + ( IMP_HasChildren1 - 0.42599978835692 )**2;
   CLUS2vads [4] + ( IMP_HasChildren1 - -1.07404344502693 )**2;
end;
else _vqmvar + 0.49999999999999;
if not missing( T_IMP_EducationalDegree ) then do;
   CLUS2vads [1] + ( T_IMP_EducationalDegree - -1.08415919620897 )**2;
   CLUS2vads [2] + ( T_IMP_EducationalDegree - -0.39037234896876 )**2;
   CLUS2vads [3] + ( T_IMP_EducationalDegree - 0.62655441671249 )**2;
   CLUS2vads [4] + ( T_IMP_EducationalDegree - 0.08597391752254 )**2;
end;
else _vqmvar + 1;
_vqnvar = 12 - _vqmvar;
if _vqnvar <= 2.182787284255E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS2vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 4;
      if CLUS2vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS2vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (12 / _vqnvar));
end;
CLUS2vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus2: Creating Segment Label;
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
