label M_REP_CustomerAge = "Imputation Indicator for REP_CustomerAge";
if REP_CustomerAge = . then M_REP_CustomerAge = 1;
else M_REP_CustomerAge= 0;
