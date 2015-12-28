format IMP_PremiumsinLOBHealth F12.2;
label IMP_PremiumsinLOBHealth = 'Imputed PremiumsinLOBHealth';
IMP_PremiumsinLOBHealth = PremiumsinLOBHealth;
if PremiumsinLOBHealth = . then IMP_PremiumsinLOBHealth = 162.81;
