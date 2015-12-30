format IMP_HasChildren BEST12.0;
label IMP_HasChildren = 'Imputed HasChildren';
IMP_HasChildren = HasChildren;
if HasChildren = . then IMP_HasChildren = 1;
