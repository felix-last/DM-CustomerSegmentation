format IMP_GrossMonthlySalary F12.0;
label IMP_GrossMonthlySalary = 'Imputed GrossMonthlySalary';
IMP_GrossMonthlySalary = GrossMonthlySalary;
if GrossMonthlySalary = . then IMP_GrossMonthlySalary = 5002.5;
