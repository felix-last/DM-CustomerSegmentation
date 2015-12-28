label M_CustomerAge = "Imputation Indicator for CustomerAge";
if CustomerAge = . then M_CustomerAge = 1;
else M_CustomerAge= 0;
