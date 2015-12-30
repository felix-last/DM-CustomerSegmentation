length IMP_EducationalDegree $15;
format IMP_EducationalDegree $CHAR15.0;
label IMP_EducationalDegree = 'Imputed EducationalDegree';
IMP_EducationalDegree = EducationalDegree;
if EducationalDegree = '' then IMP_EducationalDegree = '3 - BSc/MSc';
