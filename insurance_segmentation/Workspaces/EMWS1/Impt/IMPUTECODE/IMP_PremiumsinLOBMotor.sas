format IMP_PremiumsinLOBMotor F12.2;
label IMP_PremiumsinLOBMotor = 'Imputed PremiumsinLOBMotor';
IMP_PremiumsinLOBMotor = PremiumsinLOBMotor;
if PremiumsinLOBMotor = . then IMP_PremiumsinLOBMotor = 298.61;
