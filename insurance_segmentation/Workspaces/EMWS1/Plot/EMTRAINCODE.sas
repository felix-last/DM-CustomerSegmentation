*------------------------------------------------------------* ;
* Plot: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ClaimsRate(ASC) CustomerAge(ASC) CustomerMonetaryValue(ASC)
   EducationalDegree(ASC) FirstPolicyYear(ASC) GeographicLiving(ASC)
   GrossMonthlySalary(ASC) HasChildren(ASC) PremiumsinLOBHealth(ASC)
   PremiumsinLOBHousehold(ASC) PremiumsinLOBLife(ASC) PremiumsinLOBMotor(ASC)
   PremiumsinLOBWorkComp(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Ids_DATA
dmdbcat=WORK.Plot_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
run;
quit;
*------------------------------------------------------------*;
* Plot: Creating univariate histograms;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS1.Ids_DATA gout=WORK.PlotGRAPH;
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
title "CustomerAge";
vbar CustomerAge /
name = "CustomerAge" description = "CustomerAge"
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
title "EducationalDegree";
vbar EducationalDegree /
name = "EducationalDegree" description = "EducationalDegree"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "FirstPolicyYear";
vbar FirstPolicyYear /
name = "FirstPolicyYear" description = "FirstPolicyYear"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "GeographicLiving";
vbar GeographicLiving /
name = "GeographicLiving" description = "GeographicLiving"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "GrossMonthlySalary";
vbar GrossMonthlySalary /
name = "GrossMonthlySalary" description = "GrossMonthlySalary"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "HasChildren";
vbar HasChildren /
name = "HasChildren" description = "HasChildren"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "PremiumsinLOBHealth";
vbar PremiumsinLOBHealth /
name = "PremiumsinLOBHealth" description = "PremiumsinLOBHealth"
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
title "PremiumsinLOBLife";
vbar PremiumsinLOBLife /
name = "PremiumsinLOBLife" description = "PremiumsinLOBLife"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "PremiumsinLOBMotor";
vbar PremiumsinLOBMotor /
name = "PremiumsinLOBMotor" description = "PremiumsinLOBMotor"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "PremiumsinLOBWorkComp";
vbar PremiumsinLOBWorkComp /
name = "PremiumsinLOBWorkComp" description = "PremiumsinLOBWorkComp"
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
* Plot: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\ClaimsRate.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay CLAIMSRA;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\CustomerMonetaryValue.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay CUSTOME1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\CustomerAge.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay CUSTOMER;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\EducationalDegree.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\FirstPolicyYear.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay FIRSTPOL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\GeographicLiving.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay GEOGRAPH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\GrossMonthlySalary.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay GROSSMON;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\HasChildren.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay HASCHILD;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\PremiumsinLOBHousehold.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay PREMIUM1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\PremiumsinLOBLife.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay PREMIUM2;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\PremiumsinLOBMotor.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay PREMIUM3;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\PremiumsinLOBWorkComp.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay PREMIUM4;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "\\Mac\Home\Documents\DataMining\DM-CustomerSegmentation-master\insurance_segmentation\Workspaces\EMWS1\Plot\GRAPH\PremiumsinLOBHealth.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay PREMIUMS;
quit;
goptions device=win;
filename gsasfile;
