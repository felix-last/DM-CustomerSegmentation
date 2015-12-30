%macro main;
   filename temp catalog 'sashelp.emexpl.som_macros.source';
   %include temp;
   filename temp;

   %SetProperties;

   %if %upcase(&EM_ACTION) = CREATE %then %do;

       filename temp catalog 'sashelp.emexpl.som_create.source';
       %include temp;
       filename temp;
       %create;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;

       filename temp catalog 'sashelp.emexpl.som_train.source';
       %include temp;
       filename temp;
       %train;
   %end;
   %else
   %if %upcase(&EM_ACTION) = SCORE %then %do;

       filename temp catalog 'sashelp.emexpl.som_score.source';
       %include temp;
       filename temp;

       %score;
   %end;

%mend main;
%main;

