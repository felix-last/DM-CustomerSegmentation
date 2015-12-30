format IMP_PremiumsinLOBLife F12.2;
label IMP_PremiumsinLOBLife = 'Imputed PremiumsinLOBLife';
IMP_PremiumsinLOBLife = PremiumsinLOBLife;
if PremiumsinLOBLife = . then IMP_PremiumsinLOBLife = 41.855781986;
