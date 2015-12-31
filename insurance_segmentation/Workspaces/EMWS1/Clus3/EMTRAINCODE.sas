*------------------------------------------------------------*;
* Clus3: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    IMP_EducationalDegree(ASC) IMP_GeographicLiving(ASC) IMP_HasChildren(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary IMP_REP_CustomerAge
   LOYALTY TOTAL_PREMIUM
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Filter_TRAIN
dmdbcat=WORK.Clus3_DMDB
maxlevel = 513
out=WORK.Clus3_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus3: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary IMP_REP_CustomerAge
   LOYALTY TOTAL_PREMIUM
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus3: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    IMP_GeographicLiving IMP_HasChildren
%mend DMVQNOMINAL;
*------------------------------------------------------------* ;
* Clus3: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQORDINAL;
    IMP_EducationalDegree
%mend DMVQORDINAL;
*------------------------------------------------------------*;
* Clus3: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus3_DMDB dmdbcat=WORK.Clus3_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
input %DMVQORDINAL / level=ordinal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus3_OUTVAR;
INITIAL radius=0
initial=PRINCOMP
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus3_OUTSTAT outmean=EMWS1.Clus3_OUTMEAN;
code file="C:\Users\D059331\Desktop\DM_Insurance_segmentation\insurance_segmentation\Workspaces\EMWS1\Clus3\DMVQSCORECODE.sas"
group=Clus3
;
run;
quit;
*------------------------------------------------------------* ;
* Clus3: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    ClaimsRate CustomerMonetaryValue IMP_GrossMonthlySalary IMP_REP_CustomerAge
   LOYALTY TOTAL_PREMIUM IMP_GeographicLiving1 IMP_GeographicLiving2
   IMP_GeographicLiving3 IMP_GeographicLiving4 IMP_HasChildren0 IMP_HasChildren1
   T_IMP_EducationalDegree
%mend ;
