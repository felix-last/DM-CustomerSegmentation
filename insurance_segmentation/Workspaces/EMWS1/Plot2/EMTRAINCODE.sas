*------------------------------------------------------------* ;
* Plot2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ClaimsRate(ASC) CustomerMonetaryValue(ASC) IMP_CustomerAge(ASC)
   IMP_EducationalDegree(ASC) IMP_FirstPolicyYear(ASC) IMP_GeographicLiving(ASC)
   IMP_GrossMonthlySalary(ASC) IMP_HasChildren(ASC) IMP_PremiumsinLOBHealth(ASC)
   IMP_PremiumsinLOBLife(ASC) IMP_PremiumsinLOBMotor(ASC)
   IMP_PremiumsinLOBWorkComp(ASC) IMP_REP_FirstPolicyYear(ASC) LOYALTY(ASC)
   PremiumsinLOBHousehold(ASC) TOTAL_PREMIUM(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Trans_TRAIN
dmdbcat=WORK.Plot2_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
run;
quit;
*------------------------------------------------------------*;
* Plot2: Creating univariate histograms;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS1.Trans_TRAIN gout=WORK.Plot2GRAPH;
*;
title "ClaimsRate";
vbar ClaimsRate /
name = "ClaimsRate" description = "ClaimsRate"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "CustomerMonetaryValue";
vbar CustomerMonetaryValue /
name = "CustomerMonetaryValue" description = "CustomerMonetaryValue"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_CustomerAge";
vbar IMP_CustomerAge /
name = "IMP_CustomerAge" description = "IMP_CustomerAge"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_EducationalDegree";
vbar IMP_EducationalDegree /
name = "IMP_EducationalDegree" description = "IMP_EducationalDegree"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_FirstPolicyYear";
vbar IMP_FirstPolicyYear /
name = "IMP_FirstPolicyYear" description = "IMP_FirstPolicyYear"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_GeographicLiving";
vbar IMP_GeographicLiving /
name = "IMP_GeographicLiving" description = "IMP_GeographicLiving"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "IMP_GrossMonthlySalary";
vbar IMP_GrossMonthlySalary /
name = "IMP_GrossMonthlySalary" description = "IMP_GrossMonthlySalary"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_HasChildren";
vbar IMP_HasChildren /
name = "IMP_HasChildren" description = "IMP_HasChildren"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "IMP_PremiumsinLOBHealth";
vbar IMP_PremiumsinLOBHealth /
name = "IMP_PremiumsinLOBHealth" description = "IMP_PremiumsinLOBHealth"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_PremiumsinLOBLife";
vbar IMP_PremiumsinLOBLife /
name = "IMP_PremiumsinLOBLife" description = "IMP_PremiumsinLOBLife"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_PremiumsinLOBMotor";
vbar IMP_PremiumsinLOBMotor /
name = "IMP_PremiumsinLOBMotor" description = "IMP_PremiumsinLOBMotor"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_PremiumsinLOBWorkComp";
vbar IMP_PremiumsinLOBWorkComp /
name = "IMP_PremiumsinLOBWorkComp" description = "IMP_PremiumsinLOBWorkComp"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "IMP_REP_FirstPolicyYear";
vbar IMP_REP_FirstPolicyYear /
name = "IMP_REP_FirstPolicyYear" description = "IMP_REP_FirstPolicyYear"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "LOYALTY";
vbar LOYALTY /
name = "LOYALTY" description = "LOYALTY"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "PremiumsinLOBHousehold";
vbar PremiumsinLOBHousehold /
name = "PremiumsinLOBHousehold" description = "PremiumsinLOBHousehold"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "TOTAL_PREMIUM";
vbar TOTAL_PREMIUM /
name = "TOTAL_PREMIUM" description = "TOTAL_PREMIUM"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot2: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\ClaimsRate.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay CLAIMSRA;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\CustomerMonetaryValue.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay CUSTOMER;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_CustomerAge.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_CUST;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_EducationalDegree.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_EDUC;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_FirstPolicyYear.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_FIRS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_GeographicLiving.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_GEOG;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_GrossMonthlySalary.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_GROS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_HasChildren.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_HASC;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_PremiumsinLOBLife.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_PRE1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_PremiumsinLOBMotor.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_PRE2;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_PremiumsinLOBWorkComp.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_PRE3;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_PremiumsinLOBHealth.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_PREM;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\IMP_REP_FirstPolicyYear.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay IMP_REP_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\LOYALTY.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay LOYALTY;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\PremiumsinLOBHousehold.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay PREMIUMS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot2\GRAPH\TOTAL_PREMIUM.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay TOTAL_PR;
quit;
goptions device=win;
filename gsasfile;
