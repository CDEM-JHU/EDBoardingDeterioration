# ED Boarding Deterioration


*Author: * [Nicholas Rizer](mailto:NRizer@som.umaryland.edu?subject=[GitHub]%20ED%20Boarding%20Deterioration)


This is a repository of analytic code to evaluate escalations in level of care for boarding Emergency Department patients admitted to a medicine or medicine subspeciality level of care. The analyses were conducted in STATA v18 SE. Below is a brief description of each do-file.

DataCleaningInit.do - This do-file prepares and encodes variables to allow for data analysis with STATA. Run this file first. 
DataAnalysis.do - This do-file  performs the analyses to evaluate the incidence and risk factors associated with clinical deterioration. 
LocaitonSubanalysis.do - This do-file performs the logistic regression analysis performed on all boarders at each admission hospital. 
SensiAnalysis.do. - Several logistic regression analyses of using more liberal or conservative  thresholds for "normal" laboratory values. 
IcuOnlyUpgrades.do - This do-file examines clinical deteriorations stratified by those going to the ICU or IMC alone, including incidence, morality, and risk factor analysis using logistic regression. 



More information about the Center for Data Science in Emergency Medicine at Johns Hopkins University may be found at [Center for Data Science in Emergency Medicine Website](https://cdem.jh.edu/)
