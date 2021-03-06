*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize ClaimsRate ;
drop T_ClaimsRate ;
if missing( ClaimsRate ) then T_ClaimsRate = .;
else T_ClaimsRate = (ClaimsRate - 0.67785883165078) * 3.19874181950442;

*** Standardize CustomerMonetaryValue ;
drop T_CustomerMonetaryValue ;
if missing( CustomerMonetaryValue ) then T_CustomerMonetaryValue = .;
else T_CustomerMonetaryValue = (CustomerMonetaryValue
         - 216.174775814523) * 0.00411492618602;

*** Standardize IMP_GrossMonthlySalary ;
drop T_IMP_GrossMonthlySalary ;
if missing( IMP_GrossMonthlySalary ) then T_IMP_GrossMonthlySalary = .;
else T_IMP_GrossMonthlySalary = (IMP_GrossMonthlySalary
         - 5037.91650495352) * 0.00052239907129;

*** Standardize IMP_REP_CustomerAge ;
drop T_IMP_REP_CustomerAge ;
if missing( IMP_REP_CustomerAge ) then T_IMP_REP_CustomerAge = .;
else T_IMP_REP_CustomerAge = (IMP_REP_CustomerAge
         - 48.2995826432697) * 0.05850781974212;

*** Standardize IMP_REP_FirstPolicyYear ;
drop T_IMP_REP_FirstPolicyYear ;
if missing( IMP_REP_FirstPolicyYear ) then T_IMP_REP_FirstPolicyYear = .;
else T_IMP_REP_FirstPolicyYear = (IMP_REP_FirstPolicyYear
         - 1985.99606898641) * 0.15179010233625;

*** Standardize TOTAL_PREMIUM ;
drop T_TOTAL_PREMIUM ;
if missing( TOTAL_PREMIUM ) then T_TOTAL_PREMIUM = .;
else T_TOTAL_PREMIUM = (TOTAL_PREMIUM - 747.789125727714) * 0.00576296047634;

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
      T_IMP_EducationalDegree = 0.73634959452922;
   end;
   else if _dm15 = '2 - HIGH SCHOOL'  then do;
      T_IMP_EducationalDegree = -0.80426719652593;
   end;
   else if _dm15 = '1 - BASIC'  then do;
      T_IMP_EducationalDegree = -1.66589982524682;
   end;
   else if _dm15 = '4 - PHD'  then do;
      T_IMP_EducationalDegree = 1.75319504815218;
   end;
   else do;
      T_IMP_EducationalDegree = .;
      _DM_BAD = 1;
   end;
end;

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
      IMP_GeographicLiving1 = -0.32410552391225;
      IMP_GeographicLiving2 = -0.16768700644594;
      IMP_GeographicLiving3 = -0.2501308440739;
      IMP_GeographicLiving4 = 0.6087597341956;
   end;
   else if _dm12 = '1'  then do;
      IMP_GeographicLiving1 = 0.77127493332795;
      IMP_GeographicLiving2 = -0.16768700644594;
      IMP_GeographicLiving3 = -0.2501308440739;
      IMP_GeographicLiving4 = -0.41062910751965;
   end;
   else if _dm12 = '3'  then do;
      IMP_GeographicLiving1 = -0.32410552391225;
      IMP_GeographicLiving2 = -0.16768700644594;
      IMP_GeographicLiving3 = 0.9993748162973;
      IMP_GeographicLiving4 = -0.41062910751965;
   end;
   else if _dm12 = '2'  then do;
      IMP_GeographicLiving1 = -0.32410552391225;
      IMP_GeographicLiving2 = 1.49072054922295;
      IMP_GeographicLiving3 = -0.2501308440739;
      IMP_GeographicLiving4 = -0.41062910751965;
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
      IMP_HasChildren0 = -0.45375214559081;
      IMP_HasChildren1 = 0.45375214559081;
   end;
   else if _dm12 = '0'  then do;
      IMP_HasChildren0 = 1.10181061963315;
      IMP_HasChildren1 = -1.10181061963315;
   end;
   else do;
      IMP_HasChildren0 = .;
      IMP_HasChildren1 = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   SOM_SEGMENT = .; Distance = .;
   goto SOMvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label SOM_SEGMENT = 'SOM Segment ID' ;
label Distance = 'Distance' ;
array SOMvads [4] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 4; SOMvads [_vqclus] = 0; end;
if not missing( T_ClaimsRate ) then do;
   SOMvads [1] + ( T_ClaimsRate - -1.24884679326032 )**2;
   SOMvads [2] + ( T_ClaimsRate - -0.34342532829866 )**2;
   SOMvads [3] + ( T_ClaimsRate - 0.83365615759656 )**2;
   SOMvads [4] + ( T_ClaimsRate - 0.08360769719345 )**2;
end;
else _vqmvar + 1;
if not missing( T_CustomerMonetaryValue ) then do;
   SOMvads [1] + ( T_CustomerMonetaryValue - 1.02889602345723 )**2;
   SOMvads [2] + ( T_CustomerMonetaryValue - 0.78897524864445 )**2;
   SOMvads [3] + ( T_CustomerMonetaryValue - -0.81638970393316 )**2;
   SOMvads [4] + ( T_CustomerMonetaryValue - -0.07725261539638 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_GrossMonthlySalary ) then do;
   SOMvads [1] + ( T_IMP_GrossMonthlySalary - -0.06362398921708 )**2;
   SOMvads [2] + ( T_IMP_GrossMonthlySalary - -1.25680147892849 )**2;
   SOMvads [3] + ( T_IMP_GrossMonthlySalary - -0.33915449911407 )**2;
   SOMvads [4] + ( T_IMP_GrossMonthlySalary - 1.13605289689784 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_CustomerAge ) then do;
   SOMvads [1] + ( T_IMP_REP_CustomerAge - -0.10281212520727 )**2;
   SOMvads [2] + ( T_IMP_REP_CustomerAge - -1.34026162396271 )**2;
   SOMvads [3] + ( T_IMP_REP_CustomerAge - -0.30349792931496 )**2;
   SOMvads [4] + ( T_IMP_REP_CustomerAge - 1.25906902414547 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_FirstPolicyYear ) then do;
   SOMvads [1] + ( T_IMP_REP_FirstPolicyYear - -0.10827622807874 )**2;
   SOMvads [2] + ( T_IMP_REP_FirstPolicyYear - -0.00381089227763 )**2;
   SOMvads [3] + ( T_IMP_REP_FirstPolicyYear - -0.00591488475977 )**2;
   SOMvads [4] + ( T_IMP_REP_FirstPolicyYear - 0.19769544609659 )**2;
end;
else _vqmvar + 1;
if not missing( T_TOTAL_PREMIUM ) then do;
   SOMvads [1] + ( T_TOTAL_PREMIUM - -0.30244073064465 )**2;
   SOMvads [2] + ( T_TOTAL_PREMIUM - 1.4448056399174 )**2;
   SOMvads [3] + ( T_TOTAL_PREMIUM - -0.37484678760762 )**2;
   SOMvads [4] + ( T_TOTAL_PREMIUM - 0.05322007616901 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_EducationalDegree ) then do;
   SOMvads [1] + ( T_IMP_EducationalDegree - 0.27877961961375 )**2;
   SOMvads [2] + ( T_IMP_EducationalDegree - -0.98200668915813 )**2;
   SOMvads [3] + ( T_IMP_EducationalDegree - 0.10863328290934 )**2;
   SOMvads [4] + ( T_IMP_EducationalDegree - 0.02146626084857 )**2;
end;
else _vqmvar + 1;
if not missing( IMP_GeographicLiving1 ) then do;
   SOMvads [1] + ( IMP_GeographicLiving1 - 0.05750702311999 )**2;
   SOMvads [2] + ( IMP_GeographicLiving1 - 0.0160780703933 )**2;
   SOMvads [3] + ( IMP_GeographicLiving1 - -0.01765568664817 )**2;
   SOMvads [4] + ( IMP_GeographicLiving1 - -0.06792259294367 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving2 ) then do;
   SOMvads [1] + ( IMP_GeographicLiving2 - 0.03303076680593 )**2;
   SOMvads [2] + ( IMP_GeographicLiving2 - 0.04108477831395 )**2;
   SOMvads [3] + ( IMP_GeographicLiving2 - -0.03154132179819 )**2;
   SOMvads [4] + ( IMP_GeographicLiving2 - 0.10203886021891 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving3 ) then do;
   SOMvads [1] + ( IMP_GeographicLiving3 - -0.02507722599912 )**2;
   SOMvads [2] + ( IMP_GeographicLiving3 - 0.03117798505168 )**2;
   SOMvads [3] + ( IMP_GeographicLiving3 - 0.04861039041122 )**2;
   SOMvads [4] + ( IMP_GeographicLiving3 - -0.0221656635655 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving4 ) then do;
   SOMvads [1] + ( IMP_GeographicLiving4 - -0.05336197773889 )**2;
   SOMvads [2] + ( IMP_GeographicLiving4 - -0.0656526754001 )**2;
   SOMvads [3] + ( IMP_GeographicLiving4 - -0.00383936689815 )**2;
   SOMvads [4] + ( IMP_GeographicLiving4 - 0.01857280566798 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_HasChildren0 ) then do;
   SOMvads [1] + ( IMP_HasChildren0 - -0.4191569788907 )**2;
   SOMvads [2] + ( IMP_HasChildren0 - -0.12412330574342 )**2;
   SOMvads [3] + ( IMP_HasChildren0 - -0.38349344073152 )**2;
   SOMvads [4] + ( IMP_HasChildren0 - 1.07067607728471 )**2;
end;
else _vqmvar + 0.5;
if not missing( IMP_HasChildren1 ) then do;
   SOMvads [1] + ( IMP_HasChildren1 - 0.4191569788907 )**2;
   SOMvads [2] + ( IMP_HasChildren1 - 0.12412330574342 )**2;
   SOMvads [3] + ( IMP_HasChildren1 - 0.38349344073152 )**2;
   SOMvads [4] + ( IMP_HasChildren1 - -1.07067607728471 )**2;
end;
else _vqmvar + 0.49999999999999;
_vqnvar = 9 - _vqmvar;
if _vqnvar <= 1.3301360013429E-11 then do;
   SOM_SEGMENT = .; Distance = .;
end;
else do;
   SOM_SEGMENT = 1; Distance = SOMvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 4;
      if SOMvads [_vqclus] < _vqfzdst then do;
         SOM_SEGMENT = _vqclus; Distance = SOMvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (9 / _vqnvar));
end;

*** SOM Row and Column;
label SOM_DIMENSION1 = 'SOM Dimension1' ;
label SOM_DIMENSION2 = 'SOM Dimension2' ;
label SOM_ID = 'SOM ID' ;
length SOM_ID $8;
if SOM_SEGMENT > 0 then do;
   SOM_DIMENSION1 = 1 + floor(( SOM_SEGMENT - 1) / 2);
   SOM_DIMENSION2 = 1 + mod( SOM_SEGMENT - 1, 2 );
   SOM_ID = put( SOM_DIMENSION1 ,8. );
   SOM_ID = left( SOM_ID );
   _vqlen = 1 + length( SOM_ID ); drop _vqlen;
   substr( SOM_ID , _vqlen , 1 ) = ':';
   length _dm8 $8; _dm8 = put( SOM_DIMENSION2 , 8. );
   _dm8 = left(_dm8); drop _dm8;
   substr( SOM_ID , _vqlen+1 ) = _dm8;
end;
else do; SOM_DIMENSION1 = .; SOM_DIMENSION2 = .; SOM_ID = ' '; end;
SOMvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
