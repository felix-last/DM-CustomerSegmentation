label M_REP_FirstPolicyYear = "Imputation Indicator for REP_FirstPolicyYear";
if REP_FirstPolicyYear = . then M_REP_FirstPolicyYear = 1;
else M_REP_FirstPolicyYear= 0;
