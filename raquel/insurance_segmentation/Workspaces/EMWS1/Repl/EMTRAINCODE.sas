filename x CATALOG 'SASHELP.EMUTIL.EM_VARMACRO.SOURCE';
%inc x;
filename X;
 %macro main;

   filename temp catalog 'sashelp.emmdfy.Replace_macros.source';
   %include temp;
   filename temp;

   %if %upcase(&EM_ACTION) = CREATE %then %do;

       filename temp catalog 'sashelp.emmdfy.Replace_create.source';
       %include temp;
       filename temp;
       %create;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;

       filename temp catalog 'sashelp.emmdfy.Replace_train.source';
       %include temp;
       filename temp;
       %train;
   %end;
   %else
   %if %upcase(&EM_ACTION) = SCORE %then %do;

       filename temp catalog 'sashelp.emmdfy.Replace_score.source';
       %include temp;
       filename temp;
       %score;
   %end;
   %if %upcase(&EM_ACTION) = REPORT %then %do;

       filename temp catalog 'sashelp.emmdfy.Replace_report.source';
       %include temp;
       filename temp;
       %report;
   %end;
   %if %upcase(&EM_ACTION) = OPENOUTCLASSTABLE %then %do;
       filename temp catalog 'sashelp.emmdfy.replace_makeoutclass.source';
       %include temp;
       filename temp;
       %em_replace_openoutclass;
   %end;
   %if %upcase(&EM_ACTION) = CLOSEOUTCLASSTABLE %then %do;
       filename temp catalog 'sashelp.emmdfy.replace_makeoutclass.source';
       %include temp;
       filename temp;
       %em_replace_closeoutclass;
   %end;
%mend main;

%main;

