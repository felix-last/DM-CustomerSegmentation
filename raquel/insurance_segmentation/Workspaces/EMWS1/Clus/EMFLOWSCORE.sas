*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

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

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [4] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 4; CLUSvads [_vqclus] = 0; end;
if not missing( T_CustomerMonetaryValue ) then do;
   CLUSvads [1] + ( T_CustomerMonetaryValue - 0.54819363935898 )**2;
   CLUSvads [2] + ( T_CustomerMonetaryValue - -0.27628174005227 )**2;
   CLUSvads [3] + ( T_CustomerMonetaryValue - 0.07290058073407 )**2;
   CLUSvads [4] + ( T_CustomerMonetaryValue - -0.05637808054285 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_GrossMonthlySalary ) then do;
   CLUSvads [1] + ( T_IMP_GrossMonthlySalary - -1.15507700911751 )**2;
   CLUSvads [2] + ( T_IMP_GrossMonthlySalary - -0.77071466522411 )**2;
   CLUSvads [3] + ( T_IMP_GrossMonthlySalary - 0.46647016497919 )**2;
   CLUSvads [4] + ( T_IMP_GrossMonthlySalary - 1.09343494925154 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_CustomerAge ) then do;
   CLUSvads [1] + ( T_IMP_REP_CustomerAge - -1.22118497232645 )**2;
   CLUSvads [2] + ( T_IMP_REP_CustomerAge - -0.76425205015972 )**2;
   CLUSvads [3] + ( T_IMP_REP_CustomerAge - 0.43810988490889 )**2;
   CLUSvads [4] + ( T_IMP_REP_CustomerAge - 1.15797703241403 )**2;
end;
else _vqmvar + 1;
if not missing( T_IMP_REP_FirstPolicyYear ) then do;
   CLUSvads [1] + ( T_IMP_REP_FirstPolicyYear - -0.0018791610867 )**2;
   CLUSvads [2] + ( T_IMP_REP_FirstPolicyYear - -0.02116736532859 )**2;
   CLUSvads [3] + ( T_IMP_REP_FirstPolicyYear - -0.01136229191995 )**2;
   CLUSvads [4] + ( T_IMP_REP_FirstPolicyYear - 0.04171855303796 )**2;
end;
else _vqmvar + 1;
if not missing( T_TOTAL_PREMIUM ) then do;
   CLUSvads [1] + ( T_TOTAL_PREMIUM - 1.5477666488668 )**2;
   CLUSvads [2] + ( T_TOTAL_PREMIUM - -0.4367315480392 )**2;
   CLUSvads [3] + ( T_TOTAL_PREMIUM - -0.31887649246343 )**2;
   CLUSvads [4] + ( T_TOTAL_PREMIUM - 0.03594122019631 )**2;
end;
else _vqmvar + 1;
if not missing( IMP_GeographicLiving1 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving1 - 0.00575336377939 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving1 - 0.00365173154619 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving1 - 0.00330158245293 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving1 - -0.01198342763518 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving2 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving2 - -0.00749991300064 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving2 - -0.01471134208665 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving2 - 0.01505762778754 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving2 - 0.00496346907164 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving3 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving3 - 0.00190012719415 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving3 - 0.01011495676612 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving3 - 0.001577424286 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving3 - -0.01588092350659 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_GeographicLiving4 ) then do;
   CLUSvads [1] + ( IMP_GeographicLiving4 - -0.00229437262803 )**2;
   CLUSvads [2] + ( IMP_GeographicLiving4 - -0.00260775888004 )**2;
   CLUSvads [3] + ( IMP_GeographicLiving4 - -0.01361506482683 )**2;
   CLUSvads [4] + ( IMP_GeographicLiving4 - 0.02105733270899 )**2;
end;
else _vqmvar + 0.25;
if not missing( IMP_HasChildren0 ) then do;
   CLUSvads [1] + ( IMP_HasChildren0 - -0.13888326200499 )**2;
   CLUSvads [2] + ( IMP_HasChildren0 - -0.37262762067691 )**2;
   CLUSvads [3] + ( IMP_HasChildren0 - -0.45375214559082 )**2;
   CLUSvads [4] + ( IMP_HasChildren0 - 1.10181061963311 )**2;
end;
else _vqmvar + 0.5;
if not missing( IMP_HasChildren1 ) then do;
   CLUSvads [1] + ( IMP_HasChildren1 - 0.13888326200499 )**2;
   CLUSvads [2] + ( IMP_HasChildren1 - 0.37262762067691 )**2;
   CLUSvads [3] + ( IMP_HasChildren1 - 0.45375214559082 )**2;
   CLUSvads [4] + ( IMP_HasChildren1 - -1.10181061963311 )**2;
end;
else _vqmvar + 0.49999999999999;
if not missing( T_IMP_EducationalDegree ) then do;
   CLUSvads [1] + ( T_IMP_EducationalDegree - -0.96174811112778 )**2;
   CLUSvads [2] + ( T_IMP_EducationalDegree - 0.36834933267953 )**2;
   CLUSvads [3] + ( T_IMP_EducationalDegree - 0.00962181884289 )**2;
   CLUSvads [4] + ( T_IMP_EducationalDegree - 0.08133713226348 )**2;
end;
else _vqmvar + 1;
_vqnvar = 8 - _vqmvar;
if _vqnvar <= 1.0913936421275E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 4;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (8 / _vqnvar));
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
