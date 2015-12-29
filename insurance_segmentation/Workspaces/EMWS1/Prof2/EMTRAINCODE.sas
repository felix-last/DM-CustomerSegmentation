%macro main;
   %if %sysfunc(indexw(&EM_DEBUG, _ALL_)) or %sysfunc(indexw(&EM_DEBUG, SOURCE)) %then %do;
       options MPRINT;
   %end;

   filename temp catalog 'sashelp.emexpl.profile_macros.source';
   %include temp;
   filename temp;

   /* Initialize property macro variables */
   %SetProperties;

   %if %upcase(&EM_ACTION) = CREATE %then %do;

       filename temp catalog 'sashelp.emexpl.profile_create.source';
       %include temp;
       filename temp;
       %create;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;

       filename temp catalog 'sashelp.emexpl.profile_train.source';
       %include temp;
       filename temp;
       %train;
   %end;
%mend main;

%main;
