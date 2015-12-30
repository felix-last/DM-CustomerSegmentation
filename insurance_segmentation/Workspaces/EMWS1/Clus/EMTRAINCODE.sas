*------------------------------------------------------------*;
* Clus: Preliminary Clustering;
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
VQ maxc = 1000 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus_OUTVAR;
INITIAL radius=0
initial=PRINCOMP
;
TRAIN tech=FORGY
;
SAVE outstat=WORK.Clus_OUTSTAT outmean=EMWS1.Clus_OUTMEAN;
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
   IMP_PremiumsinLOBWorkComp IMP_REP_CustomerAge PremiumsinLOBHousehold
   IMP_GeographicLiving1 IMP_GeographicLiving2 IMP_GeographicLiving3
   IMP_GeographicLiving4 IMP_HasChildren0 IMP_HasChildren1 T_IMP_EducationalDegree
%mend ;
*------------------------------------------------------------*;
* Clus: Determining the number of clusters;
*------------------------------------------------------------*;
proc cluster data=EMWS1.Clus_OUTMEAN method=AVERAGE pseudo outtree=EMWS1.Clus_CLUSSEED
;
var %dmvqvars;
copy _SEGMENT_;
run;
quit;
proc sort data =EMWS1.Clus_CLUSSEED out=WORK._SEED_;
by _ncl_;
where (_ccc_ > -99999.0);
run;
data WORK._SEED2_;
retain oJump occc oncl;
set WORK._SEED_;
_lccc_=lag(_ccc_);
if _lccc_ > . then jump = _ccc_ - _lccc_;
if jump<0 and ojump>0 then do;
* Have a local Max;
numclus = oncl;
cccvalue = occc;
output;
end;
ojump = jump;
occc = _ccc_;
oncl = _ncl_;
run;
proc print data=WORK._SEED2_;
var numclus cccvalue;
label numclus="%sysfunc(sasmsg(sashelp.dmine, rpt_numclus_vlabel ,  NOQUOTE))";
label cccvalue="%sysfunc(sasmsg(sashelp.dmine, rpt_ccc_vlabel ,     NOQUOTE))";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_OptClus_title, NOQUOTE))";
run;
title10;
data WORK._SEED2_;
length msg $200;
set WORK._SEED2_ end=eof;
retain select cccSelect 0 numSel;
if _N_=1 then numSel = numClus;
if cccvalue>=2 then do;
if 1000>= numclus >= 2 and cccSelect<1 then do;
cccSelect = 1;
select =1;
numSel = numClus;
end;
end;
else if 1000>= numclus >= 2 and select<1 then do;
select = 1;
numSel = numClus;
end;
if eof then do;
if ^(select=1 and cccselect=1) then do;
put "*------------------------------------------------------------*";
put '*;';
put "WARNING: The number of clusters selected based on the CCC values may not be valid.  Please refer to the documentation on the Cubic Clustering Criterion.";
put '*;';
put "*------------------------------------------------------------*";
end;
if select<1 then do;
msg = sasmsg('sashelp.dmine', 'rpt_noCCCclusternum_note', 'NOQUOTE');
put msg;
end;
if cccselect<1 then do;
msg = sasmsg('sashelp.dmine', 'rpt_noValidclusterNum_note', 'NOQUOTE');
put msg;
end;
call symput('em_maxC', strip(put(numSel,best.)));
end;
run;
*------------------------------------------------------------*;
* Clus: Training;
*------------------------------------------------------------*;
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
VQ maxc = 3 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
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
