*------------------------------------------------------------*;
* Clus: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    IMP_EducationalDegree(ASC) IMP_GeographicLiving(ASC) IMP_HasChildren(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge LOYALTY PremiumsinLOBHousehold
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Filter_TRAIN
dmdbcat=WORK.Clus_DMDB
maxlevel = 513
out=WORK.Clus_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge LOYALTY PremiumsinLOBHousehold
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    IMP_GeographicLiving IMP_HasChildren
%mend DMVQNOMINAL;
*------------------------------------------------------------* ;
* Clus: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQORDINAL;
    IMP_EducationalDegree
%mend DMVQORDINAL;
*------------------------------------------------------------*;
* Clus: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus_DMDB dmdbcat=WORK.Clus_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
input %DMVQORDINAL / level=ordinal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus_OUTVAR;
INITIAL radius=0
initial=PRINCOMP
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus_OUTSTAT outmean=EMWS1.Clus_OUTMEAN;
code file="C:\Users\D059331\Desktop\DM_Insurance_segmentation\insurance_segmentation\Workspaces\EMWS1\Clus\DMVQSCORECODE.sas"
group=Clus
;
run;
quit;
*------------------------------------------------------------* ;
* Clus: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary
   IMP_PremiumsinLOBHealth IMP_PremiumsinLOBLife IMP_PremiumsinLOBMotor
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge LOYALTY PremiumsinLOBHousehold
   IMP_GeographicLiving1 IMP_GeographicLiving2 IMP_GeographicLiving3
   IMP_GeographicLiving4 IMP_HasChildren0 IMP_HasChildren1 T_IMP_EducationalDegree
%mend ;
