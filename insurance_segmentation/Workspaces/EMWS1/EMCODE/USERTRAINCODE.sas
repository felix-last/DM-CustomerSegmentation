%em_register(key=Outtree, type=Data);
%em_getname(key=Outtree, type=Data);
proc varclus data = &em_import_data hi outtree=&em_user_Outtree;
var Clage Clno Debtinc Delinq Derog Loan Mortdue Ninq Value Yoj;
run;
%em_report(
   key=OUTTREE,
   viewtype=DENDROGRAM,
   autodisplay=Y,
   block=Dendrogram,
   name=_Name_,
   parent=_Parent_,
   height=_Varexp_);

