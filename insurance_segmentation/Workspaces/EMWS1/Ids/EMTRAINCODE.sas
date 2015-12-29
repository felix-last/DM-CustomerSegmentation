*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\D059331\Desktop\DM_Insurance_segmentation\insurance_segmentation\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set INSPROJF.A2ZINSURANCE;
run;
