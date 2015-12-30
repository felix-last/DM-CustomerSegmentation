*------------------------------------------------------------*;
* Clus2: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    IMP_EducationalDegree(ASC) IMP_GeographicLiving(ASC) IMP_HasChildren(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge LOYALTY PremiumsinLOBHousehold
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Trans_TRAIN
dmdbcat=WORK.Clus2_DMDB
maxlevel = 513
out=WORK.Clus2_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus2: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge LOYALTY PremiumsinLOBHousehold
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus2: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    IMP_GeographicLiving IMP_HasChildren
%mend DMVQNOMINAL;
*------------------------------------------------------------* ;
* Clus2: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQORDINAL;
    IMP_EducationalDegree
%mend DMVQORDINAL;
*------------------------------------------------------------*;
* Clus2: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus2_DMDB dmdbcat=WORK.Clus2_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
input %DMVQORDINAL / level=ordinal;
VQ maxc = 4 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus2_OUTVAR;
INITIAL radius=0
initial=PRINCOMP
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus2_OUTSTAT outmean=EMWS1.Clus2_OUTMEAN;
code file="C:\Users\D059331\Desktop\DM_Insurance_segmentation\insurance_segmentation\Workspaces\EMWS1\Clus2\DMVQSCORECODE.sas"
group=Clus2
;
run;
quit;
*------------------------------------------------------------* ;
* Clus2: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge PremiumsinLOBHousehold
   IMP_GeographicLiving1 IMP_GeographicLiving2 IMP_GeographicLiving3
   IMP_GeographicLiving4 IMP_HasChildren0 IMP_HasChildren1 T_IMP_EducationalDegree
%mend ;
