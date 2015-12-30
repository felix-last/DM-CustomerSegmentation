format IMP_PremiumsinLOBWorkComp F12.2;
label IMP_PremiumsinLOBWorkComp = 'Imputed PremiumsinLOBWorkComp';
IMP_PremiumsinLOBWorkComp = PremiumsinLOBWorkComp;
if PremiumsinLOBWorkComp = . then IMP_PremiumsinLOBWorkComp = 25.67;
