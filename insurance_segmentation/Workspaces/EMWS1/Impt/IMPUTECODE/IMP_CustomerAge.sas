format IMP_CustomerAge BEST12.0;
label IMP_CustomerAge = 'Imputed CustomerAge';
IMP_CustomerAge = CustomerAge;
if CustomerAge = . then IMP_CustomerAge = 48;
